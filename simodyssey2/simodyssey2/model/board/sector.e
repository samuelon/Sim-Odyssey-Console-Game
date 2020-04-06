note
	description: "Represents a sector in the galaxy."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SECTOR

create
	make, make_dummy

feature -- attributes

	shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end

	gen: RANDOM_GENERATOR_ACCESS

--	contents: ARRAYED_LIST [detachable ENTITY_ALPHABET] --holds 4 quadrants
	contents: ARRAYED_LIST [detachable ENTITY_ALPHABET]
--	entity_quad: ARRAYED_LIST [detachable ENTITY]
	entity_quad: ARRAYED_LIST [ENTITY]

	movable_list: ARRAYED_LIST [NON_STATIONARY]

--	planet_only : ARRAYED_LIST[PLANET]

	row: INTEGER

	column: INTEGER

		--black_hole : BLACKHOLE

feature -- constructor

	make (row_input: INTEGER; column_input: INTEGER)
			--initialization
		require
			valid_row: (row_input >= 1) and (row_input <= shared_info.number_rows)
			valid_column: (column_input >= 1) and (column_input <= shared_info.number_columns)
		do
			create movable_list.make (shared_info.max_capacity)
			create entity_quad.make (shared_info.max_capacity)
			row := row_input
			column := column_input
			create contents.make (shared_info.max_capacity) -- Each sector should have 4 quadrants
			contents.compare_objects
			if (row = 3) and (column = 3) then
				put (shared_info.black_hole) -- If this is the sector in the middle of the board, place a black hole
			else
				if (row = 1) and (column = 1) then
						--create og_exp.make (0,current)
					put (shared_info.og_exp) -- If this is the top left corner sector, place the explorer there
--					movable_list.extend (shared_info.og_exp)
				end
				populate (row, column) -- Run the populate command to complete setup
			end -- if
		end

feature -- commands

	make_dummy(int : INTEGER)
			--initialization without creating entities in quadrants
		do
			create contents.make (int)
			create movable_list.make (int)
			create entity_quad.make (int)
			contents.compare_objects
		end



	populate (a_row: INTEGER; a_col: INTEGER)
			-- this feature creates 1 to max_capacity-1 components to be intially stored in the
			-- sector. The component may be a planet or nothing at all.
		local
			threshold: INTEGER
			number_items: INTEGER
			loop_counter: INTEGER
			planet_holder: ENTITY_ALPHABET
			turns_left: INTEGER
			movable : NON_STATIONARY
			planet : PLANET
			asteroid : ASTEROID
			janitaur : JANITAUR
			malevolent : MALEVOLENT
			benign : BENIGN

		do
			number_items := gen.rchoose (1, shared_info.max_capacity - 1)

			from
				loop_counter := 1
			until
				loop_counter > number_items
			loop
				threshold := gen.rchoose (1, 100)
				if threshold < shared_info.asteroid_threshold then
					create asteroid.make(shared_info.movable_id,a_row,a_col)
					populate_routine (a_row,a_col,asteroid)
				else
					if threshold < shared_info.janitaur_threshold then
						create janitaur.make(shared_info.movable_id,a_row,a_col)
						populate_routine (a_row,a_col,janitaur)

					else
						if (threshold < shared_info.malevolent_threshold) then
							create malevolent.make(shared_info.movable_id,a_row,a_col)
							populate_routine (a_row,a_col,malevolent)
						else
							if (threshold < shared_info.benign_threshold) then
								create benign.make(shared_info.movable_id,a_row,a_col)
								populate_routine (a_row,a_col,benign)
							else
								if threshold < shared_info.planet_threshold then
									create planet.make(shared_info.movable_id,a_row,a_col)
									populate_routine (a_row,a_col,planet)
								end
							end
						end
					end
				end
				loop_counter := loop_counter + 1
			end
		end


feature --function

	populate_routine(a_row: INTEGER ; a_col : INTEGER ; ent : NON_STATIONARY)
	local
		turns_left : INTEGER
		planet_holder: ENTITY_ALPHABET
	do
		put(ent)
		ent.set_location (a_row,a_col,return_quad (ent))
		ent.set_old_location (a_row,a_col,return_quad (ent))
		shared_info.movable_id_plus_one
		turns_left := gen.rchoose (0, 2) -- for this planet
		ent.set_turns_left (turns_left)
--		io.put_string (ent.id_out + ent.cur_location_out + "turns_left" + turns_left.out + ":[0,2])"+ "%N")
--		movable_list.extend (ent)
		planet_holder := void -- only difference from sector now
	end

	return_sorted_ent : LINKED_LIST[ENTITY] --ok
	local
		sort : SORTED_ENTITY
	do
		create sort.make (entity_quad)
		result := sort.sorted_entities
	end

	put (new_component: ENTITY)
			-- put `new_component' in contents array
		local
			loop_counter: INTEGER
			found: BOOLEAN
			filled: BOOLEAN
		do
			from
				loop_counter := 1
			until
				loop_counter > contents.count or found
			loop
				if contents [loop_counter] = new_component.en then
					found := TRUE
				end --if
				loop_counter := loop_counter + 1
			end -- loop

-- if it is found do nothing if not put things
			from
				loop_counter := 1
			until
				loop_counter > contents.count or filled
			loop
		    	if not attached contents [loop_counter] or entity_quad[loop_counter].is_empty then -- not void if is it void
					contents [loop_counter] := new_component.en
					filled := TRUE
					entity_quad [loop_counter] := new_component
				end
				loop_counter := loop_counter + 1
			end -- loop

			if  not filled and not found and not is_full then --if no dup and not full.
				contents.extend (new_component.en)
				entity_quad.extend (new_component)
				if attached{NON_STATIONARY}new_component as mov then
					movable_list.extend (mov)
				end
			end
		ensure
			component_put: not is_full implies contents.has (new_component.en)
		end

	remove (new_component: ENTITY)
			-- put `new_component' in contents array
		local
			loop_counter: INTEGER
			removed: BOOLEAN
			dummy_entity: ENTITY
			empty_en_alp : ENTITY_ALPHABET
			empty_en : ENTITY
			--			empty_ent_alph : ENTITY_ALPHABET
		do
			from
				loop_counter := 1
			until
				loop_counter > entity_quad.count or removed
			loop
				if attached entity_quad [loop_counter] as ent then
						--					io.put_string ("fx")
					if ent.id ~ new_component.id and ent.en ~ new_component.en then
						--
						create{ENTITY_ALPHABET}empty_en_alp.make ('-')
						create{EMPTY}empty_en.make
						entity_quad [loop_counter] := empty_en--void
						contents [loop_counter] := void --void
--						io.put_string("removing this id, planet" +new_component.id.out+ "%N")
						removed := true
						if attached{NON_STATIONARY}ent as mov then
							movable_list.prune_all (mov)
						end
					end
				end
				loop_counter := loop_counter + 1
			end -- loop
		ensure
--			others_unchanged : across old contents.deep_twin is en  all en.item /~ new_component.en end
--			already_moved : not entity_quad.has (new_component)
		end

feature -- Queries

	print_sector: STRING
			-- Printable version of location's coordinates with different formatting
		do
			Result := ""
			Result.append (row.out)
			Result.append (",")
			Result.append (column.out)
		end

	print_sector_spec: STRING
			-- Printable version of location's coordinates with different formatting
		do
			Result := ""
			Result.append (row.out)
			Result.append (":")
			Result.append (column.out)
		end

	print_quadrant: STRING
		local
			quad_counter: INTEGER
			column_counter: INTEGER
			contents_counter: INTEGER
			temp_sector: SECTOR
			temp_component: ENTITY
			printed_symbols_counter: INTEGER
		do
			create Result.make_empty

			from
				quad_counter := 1
				printed_symbols_counter := 0
			until
				quad_counter > current.entity_quad.count
			loop
				temp_component := current.entity_quad [quad_counter]
--				if attached temp_component as character then
--					Result.append (character.id_out)
--				end -- if
				if
					temp_component.en.is_empty
				then
					Result.append ("-")
				else
					Result.append (temp_component.id_out)
				end

				if ( quad_counter ~ 4) then
				else
					Result.append(",")
				end
				printed_symbols_counter := printed_symbols_counter + 1
				quad_counter := quad_counter + 1
			end

			-- print -
			from
			until
				(shared_info.max_capacity - printed_symbols_counter) = 0
			loop
				if
					shared_info.max_capacity - printed_symbols_counter >1
				then
					Result.append ("-,")
				else
					Result.append ("-")
				end
				printed_symbols_counter := printed_symbols_counter + 1
			end-- loop
		end

	is_full: BOOLEAN
			-- Is the location currently full?
		local
			loop_counter: INTEGER
			occupant: ENTITY_ALPHABET
			empty_space_found: BOOLEAN
		do
			if contents.count < shared_info.max_capacity then
				empty_space_found := TRUE
			end
			from
				loop_counter := 1
			until
				loop_counter > contents.count or empty_space_found
			loop
				occupant := contents [loop_counter]
				if not attached occupant then
					empty_space_found := TRUE
				end
				loop_counter := loop_counter + 1
			end
			if contents.count = shared_info.max_capacity and then not empty_space_found then
				Result := TRUE
			else
				Result := FALSE
			end
		end

feature -- check
	has_benign: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_benign
				end -- if
				loop_counter := loop_counter + 1
			end
		end

	has_explorer: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_explorer
				end -- if
				loop_counter := loop_counter + 1
			end
		end


	has_stationary: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_stationary
				end -- if
				loop_counter := loop_counter + 1
			end
		end

	has_yellow_dwarf: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_yellow_dwarf
				end -- if
				loop_counter := loop_counter + 1
			end
		end

	has_blackhole: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_blackhole
				end -- if
				loop_counter := loop_counter + 1
			end
		end

	has_star: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_star
				end -- if
				loop_counter := loop_counter + 1
			end
		end


	has_wormhole: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_wormhole
				end -- if
				loop_counter := loop_counter + 1
			end
		end

	has_planet: BOOLEAN
			-- returns whether the location contains any stationary item
		local
			loop_counter: INTEGER
		do
			Result := false
			from
				loop_counter := 1
			until
				loop_counter > contents.count or Result
			loop
				if attached contents [loop_counter] as temp_item then
					Result := temp_item.is_planet
				end -- if
				loop_counter := loop_counter + 1
			end
		end
feature --others
	out_sorted_entity : STRING
	do
		create result.make_empty
		across
			return_sorted_ent is m
		loop
			result.append("sorted_ent:"+ m.id_out + ",")
		end
	end

	out_movable_list : STRING
		do
			create result.make_empty
			across
				movable_list is m
			loop
				result.append("movable_list"+m.id_out+",")
			end
		end


	max_luminosity : INTEGER

		-- returns whether the location contains luminosity
		local
			loop_counter: INTEGER
			temp_lum : INTEGER
			star_lum : INTEGER
		do
			temp_lum := 1
			from
				loop_counter := 1
			until
				loop_counter > contents.count
			loop
				if attached contents[loop_counter] as temp_item then
					if (temp_item.is_star) then
						if attached current.entity_quad[loop_counter] as star then
							IF
								attached {STAR}star as s1
							then
								if(temp_lum < s1.luminosity) then
									temp_lum := s1.luminosity
								end
							end

						end
					end
				end -- if
				Result := temp_lum
				loop_counter := loop_counter + 1
			end
		end

--RETURN INDEX OF ENTITY  USE ENTITY_ALPH?	
	return_quad(ent:ENTITY):INTEGER
	do
		across
			1 |..| entity_quad.count is i
		loop
			if entity_quad[i].id.is_equal (ent.id)then
				Result := i
			end

		end
	end


end
