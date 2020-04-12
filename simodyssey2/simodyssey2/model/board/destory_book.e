note
	description: "Summary description for {DESTORY_BOOK}. Collect all destoryed item and its destorctor this turn via iterator pattern"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DESTORY_BOOK

inherit
	ITERABLE[TUPLE[NON_STATIONARY,NON_STATIONARY]]


create
	make

feature {NONE} -- implementation

	 destoryed: ARRAY[NON_STATIONARY]
	 destructor: LINKED_LIST[NON_STATIONARY]
	make
		do
--			create imp.make (10)
--			imp.compare_objects
			create destoryed.make_empty
			create destructor.make
		ensure
			model.is_empty
		end

feature -- model

	model: FUN [NON_STATIONARY, NON_STATIONARY]
		-- FUN [DESTORYED,DESTRUCTOR]

		do
			create Result.make_empty
			across
				1 |..| destoryed.count is i
			loop
				Result.extend ([destoryed[i],destructor[i]])
			end

		ensure
			model_imp_consistency:
			-- this is the only place where `imp` is mentioned in contracts.
			-- all other features' pre- and post-conditions, as well as class invariants,
			-- should only be written in terms of the `model`.
			(model.count = destoryed.count)
			and
			(across model is cursor all
--			   imp.has (cursor.item.first)
--			   and imp [cursor.item.first] ~ cursor.item.second
--cursor.item.first = key = NAME
			  destoryed.has (cursor.first) and destructor.has (cursor.second)
			end)
		end

feature -- Iterable
	new_cursor : ITERATION_CURSOR[TUPLE[NON_STATIONARY,NON_STATIONARY]]
	-- N,D
	local
		it_cursor : ITEM_ITERATION_CURSOR[NON_STATIONARY,NON_STATIONARY]
		-- N ,D
	do
		create it_cursor.make(destructor,destoryed)
		-- D, N
		Result := it_cursor
	end


feature
	check_destructor(g : NON_STATIONARY): ARRAY[NON_STATIONARY]
	local
		temp_fun : ARRAY[NON_STATIONARY]
	do
		create temp_fun.make_empty
		temp_fun := model.domain_restricted_by (g).range.as_array -- g : destoryed
		result := temp_fun
	end

	has_destructor(k:NON_STATIONARY):BOOLEAN
		do
			result := destructor.has (k)
		end

	put (d: NON_STATIONARY; r: NON_STATIONARY)
	-- d : destoryed r :destructor
		-- add pair to destory book
		do
			if not destoryed.has (d) then
				destoryed.force (d, destoryed.count + 1)
				destructor.extend (r)
			else
				across
					1 |..| destoryed.count is i
				loop
					if
						destoryed[i] ~ d
					then
						destructor[i]:=r
					end
				end
			end
		ensure
			model_override:
--				model ~ (old model @<+ [a_name, d])
				model ~ (old model.overriden_by ([d,r]))
		end

	return_destoryed (destr: NON_STATIONARY): ARRAY [NON_STATIONARY]
			-- returns an array of destoryed with destructor`d'
		local

		do
			create Result.make_empty
			Result.compare_objects
			across
				1 |..| destoryed.count is i
			loop
				if
					destructor[i]~destr
				then
					Result.force(destoryed[i],result.count+1)
				end
			end

		ensure
			nothing_changed: model ~ (old model.deep_twin)
			remind_count:
				Result.count ~ (model.range_restricted_by (destr)).count
			remind_model_has_result:across
				Result is d
			all
				model.range_restricted_by (destr).domain.has (d)
			end
			remind_model_range_restiction:
				across
					 model.range_restricted_by (destr).domain is n
				all
					Result.has(n)
				end
		end

	count: INTEGER
			-- returns the number of entries in current birthday book
		do
			Result := destoryed.count
		ensure
			Result = model.count
		end

feature

	out_destory_book: STRING
		do
			Result := model.out
		end

invariant
	count =  model.count
end
