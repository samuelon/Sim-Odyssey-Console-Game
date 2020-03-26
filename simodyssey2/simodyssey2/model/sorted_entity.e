note
	description: "Summary description for {SORTED_ENTITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SORTED_ENTITY

create
	make


feature--constructor
	make(arr : ITERABLE[ENTITY])
	DO
		-- DO BUBLLE SORT
		-- PUBLIC ATTRIBUTE
		create to_sort.make_empty
		across arr is entity
		loop
		 	to_sort.force(entity, sorted_entities.count + 1)
		end
	end

feature

	sorted_entities: ARRAY[ENTITY]
		do
			result := sorted_entities_hidden
		end


feature
	to_sort : ARRAY[ENTITY]

feature {NONE}

	sorted_entities_hidden: ARRAY[ENTITY]
	local
		i : INTEGER
		j : INTEGER
		t : ENTITY
	do
		from
			 i := to_sort.lower
		until
			i > to_sort.upper
		loop
			from
				j := to_sort.lower
			until
				j > (to_sort.upper-i)
			loop
				if to_sort[j].id > to_sort[j+1].id then
					t := to_sort[j]
					to_sort[j]:= to_sort[j+1]
					to_sort[j+1]:= t
--					io.put_string ("sort?" + to_sort[j].id_out + "%N")
				end
				j := j+1
			end
			i := i + 1
		end
		result := to_sort
	end

	-- now sort


end
