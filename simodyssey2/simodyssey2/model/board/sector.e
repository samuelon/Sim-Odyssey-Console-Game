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

	contents: ARRAYED_LIST [detachable ENTITY_ALPHABET] --holds 4 quadrants

	entity_quad: ARRAYED_LIST [detachable ENTITY]

	movable_list: ARRAYED_LIST [NON_STATIONARY]

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
					shared_info.movable_id_plus_one
					if attached asteroid as entity then -- this causes you not allowed o be EBMJ
						put (entity) -- add new entity to the contents list
						turns_left := gen.rchoose (0, 2) -- for this planet
						entity.set_turns_left (turns_left)
						io.put_string ("(A->"+ turns_left.out + ":[0,2])"+ "%N")
							-------------------------------copy the planets into the correctplace-----------------------
						movable_list.extend (entity)
						planet_holder := void -- only difference from sector now
						end
				else
					if threshold < shared_info.janitaur_threshold then
						create janitaur.make(shared_info.movable_id,a_row,a_col)
						shared_info.movable_id_plus_one
						if attached janitaur as entity then
						put (entity) -- add new entity to the contents list
						turns_left := gen.rchoose (0, 2) -- for this planet
						entity.set_turns_left (turns_left)
						entity.set_actions_left_until_reproduction (2) --added this
						io.put_string ("(J->"+ turns_left.out + ":[0,2])"+ "%N")
							-------------------------------copy the planets into the correctplace-----------------------
						movable_list.extend (entity)
						planet_holder := void -- only difference from sector now
						end

					else
						if (threshold < shared_info.malevolent_threshold) then
							create malevolent.make(shared_info.movable_id,a_row,a_col)
							shared_info.movable_id_plus_one
							if attached malevolent as entity then
							put (entity) -- add new entity to the contents list
							turns_left := gen.rchoose (0, 2) -- for this planet
							entity.set_turns_left (turns_left)
							entity.set_actions_left_until_reproduction (1)
							io.put_string ("(M->"+ turns_left.out + ":[0,2])"+ "%N")
								-------------------------------copy the planets into the correctplace-----------------------
							movable_list.extend (entity)
							planet_holder := void -- only difference from sector now
							end
						else
							if (threshold < shared_info.benign_threshold) then
								create benign.make(shared_info.movable_id,a_row,a_col)

								shared_info.movable_id_plus_one
								if attached benign as entity then
								put (entity) -- add new entity to the contents list
								turns_left := gen.rchoose (0, 2) -- for this planet
								entity.set_turns_left (turns_left)
								entity.set_actions_left_until_reproduction (1) -- added this
								io.put_string ("(B->"+ turns_left.out + ":[0,2])"+ "%N")
									-------------------------------copy the planets into the correctplace-----------------------
								movable_list.extend (entity)
								planet_holder := void -- only difference from sector now
								end
							else
								if threshold < shared_info.planet_threshold then
									create planet.make(shared_info.movable_id,a_row,a_col)
									shared_info.movable_id_plus_one
									if attached planet as entity then
									put (entity) -- add new entity to the contents list
									turns_left := gen.rchoose (0, 2) -- for this planet
									entity.set_turns_left (turns_left)
									io.put_string ("(P->"+ turns_left.out + ":[0,2])"+ "%N")
										-------------------------------copy the planets into the correctplace-----------------------
									movable_list.extend (entity)
									planet_holder := void -- only difference from sector now
									end
								end
							end
						end
					end
				end
--			
			-------from sector

						---------------------end sector
				loop_counter := loop_counter + 1
			end
		end


feature --function
	return_sorted_ent : ARRAYED_LIST[detachable ENTITY]
	local

		i : INTEGER
		j : INTEGER
		temp : ARRAYED_LIST[detachable ENTITY]
		temp_ent : ENTITY
	do
		create result.make (shared_info.max_capacity)
		create temp.make (shared_info.max_capacity)
		temp := entity_quad.deep_twin

			from
			i := temp.lower
			until
				i>temp.upper
			loop
				from
					j := temp.lower
				until
					j > (temp.upper-i)
				loop
					if
						attached temp[j] as t1 and attached temp[j+1]as t2
					then
						if
							t1.id > t2.id
						then
							temp_ent := t1
							temp[j]:=t2
							temp[j+1]:=temp_ent
						end
					end
					j:=j+1
				end
			i := i+1
			end

--		for (int i = 0; i < array.length-1; i++) {
--        for (int j = 0; j < array.length - 1-i; j++) {
--            if (array[j] > array[j + 1]) {
--                temp = array[j];
--                array[j] = array[j + 1];
--                array[j + 1] = temp;
--            }
--        }
--    }
	--debug
		across
			1 |..| temp.upper is in
		loop
			if
				attached temp[in] as ent
			then
				io.put_string ("sorted quad"+ent.id.out + ent.en.out + "%N")
			end
		end
	---	
		result := temp
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
				if not attached contents [loop_counter] then -- not void if is it void
					contents [loop_counter] := new_component.en
					filled := TRUE
					io.put_string ("putting in entity in void spot: " + new_component.id.out+ "%N")
						------------------------------------CREATING THE ENTITY_QUADRANT ---------------------------------------
					entity_quad [loop_counter] := new_component
						-------------------------------------END ENTITY QUADRANT --------------------------------------------
				end --if
				loop_counter := loop_counter + 1
			end -- loop

			if  not filled and not found and not is_full then --if no dup and not full.
				contents.extend (new_component.en)
					------------------------------------CREATING THE ENTITY_QUADRANT ---------------------------------------
				entity_quad.extend (new_component)
			io.put_string ("putting in entity in rightmost empty spot: " + new_component.id.out + "%N")
					-------------------------------------END ENTITY QUADRANT --------------------------------------------
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
						entity_quad [loop_counter] := void
						contents [loop_counter] := void
						io.put_string("removing this id, planet" +new_component.id.out+ "%N")
						removed := true
					end
				end
				loop_counter := loop_counter + 1
			end -- loop
--		ensure
--			already_removed :
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
				if attached temp_component as character then
					Result.append (character.id_out)
				end -- if
				if ( quad_counter ~ 4) then
				else
					Result.append(",")
				end
				printed_symbols_counter := printed_symbols_counter + 1
				quad_counter := quad_counter + 1
			end
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
			1 |..| contents.count is i
		loop
			if
				attached contents[i] as ent_alp
			then
				if
					ent_alp.is_equal (ent.en)
				then
					Result := i
				end
			end

		end
	end


end
