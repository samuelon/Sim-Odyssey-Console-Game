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
		-- initialization
	DO
		-- DO BUBLLE SORT
		-- PUBLIC ATTRIBUTE
		create to_sort.make
		across arr is entity
		loop
		 	to_sort.extend (entity)
		end
	end

feature

	sorted_entities: LINKED_LIST[ENTITY]
		-- return already sorted collection
		do
			result := sorted_entities_hidden
		end


feature
	to_sort : LINKED_LIST[ENTITY]

feature {NONE}

	sorted_entities_hidden: LINKED_LIST[ENTITY]
	local
		i : INTEGER
		j : INTEGER
		t : ENTITY
	do
		from
			 i := to_sort.lower
		until
			i > to_sort.count
		loop
			from
				j := to_sort.lower
			until
				j > (to_sort.count-i)
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
