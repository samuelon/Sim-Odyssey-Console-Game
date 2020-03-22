note
	description: "Galaxy represents a game board in simodyssey. for the layout"
	author: "Kevin B"
	date: "$Date$"
	revision: "$Revision$"

class
	GALAXY

inherit

	ANY
		redefine
			out
		end

create
	make, make_empty

feature -- collection

	grid: ARRAY2 [SECTOR]
			-- the board
--	gen_num_arr : ARRAYED_LIST[INTEGER]
	movable_sorted: ARRAYED_LIST[NON_STATIONARY]
	stationary_stars_sorted: LINKED_LIST [STATIONARY]

feature -- 	attributes
	all_msgs: ALL_MSG
	planet_threshold: INTEGER
	asteroid_threshold: INTEGER
	janitaur_threshold: INTEGER
	malevolent_threshold: INTEGER
	benign_threshold: INTEGER

	explorer: EXPLORER



feature -- boolean
	sector_is_full: BOOLEAN

	wormhole_used: BOOLEAN

	end_game: BOOLEAN

	exp_devoured: BOOLEAN

feature -- singleton pattern
	model_access: ETF_MODEL_ACCESS

	model: ETF_MODEL
		attribute
			Result := model_access.m
		end
	gen: RANDOM_GENERATOR_ACCESS

	shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end

feature --constructor
	make_empty
	do
		create grid.make_filled (create{SECTOR}.make_dummy(4), 5,5)
--		create gen_num_arr.make (1000)
		create explorer.make (0,1,1)
		create stationary_stars_sorted.make
		create  movable_sorted.make(100)

	end

	make
			-- creates a dummy of galaxy grid
		local
			row: INTEGER
			column: INTEGER

		do
			exp_devoured := false
			end_game := false
			wormhole_used := false
			create movable_sorted.make(100)
			create stationary_stars_sorted.make
			stationary_stars_sorted.extend (shared_info.black_hole)
			planet_threshold := shared_info.planet_threshold
			malevolent_threshold := shared_info.malevolent_threshold
			benign_threshold := shared_info.benign_threshold
			janitaur_threshold := shared_info.janitaur_threshold
			asteroid_threshold := shared_info.asteroid_threshold

			create grid.make_filled (create {SECTOR}.make_dummy(shared_info.max_capacity), shared_info.number_rows, shared_info.number_columns)
			from
				row := 1
			until
				row > shared_info.number_rows
			loop
				from
					column := 1
				until
					column > shared_info.number_columns
				loop
					grid [row, column] := create {SECTOR}.make (row, column)

						--------Track movable
					across
						grid [row, column].movable_list as movable
					loop
						movable_sorted.extend (movable.item)
					end

					column := column + 1;
				end
				row := row + 1
			end
			set_stationary_items
				--set player coord

			explorer := shared_info.og_exp
			sector_is_full := FALSE

			---sort movable
			sort_movable_list

		end

feature --commands
	sort_movable_list
	local
		i : INTEGER
		t : NON_STATIONARY
		j:INTEGER
	do
		from
			 i := movable_sorted.lower
		until
			i > movable_sorted.upper
		loop
			from
				j := movable_sorted.lower
			until
				j > (movable_sorted.upper-i)
			loop
				if movable_sorted[j].id > movable_sorted[j+1].id then
					t := movable_sorted[j]
					movable_sorted[j]:= movable_sorted[j+1]
					movable_sorted[j+1]:= t
					io.put_string ("sort?" + movable_sorted[j].id_out + "%N")
				end
				j := j+1
			end
			i := i + 1
		end
	end

	set_stationary_items
			-- distribute stationary items amongst the sectors in the grid.
			-- There can be only one stationary item in a sector
		local
			loop_counter: INTEGER
			check_sector: SECTOR
			temp_row: INTEGER
			temp_column: INTEGER
		do
			from
				loop_counter := 1
			until
				loop_counter > shared_info.number_of_stationary_items
			loop
				temp_row := gen.rchoose (1, shared_info.number_rows)
				temp_column := gen.rchoose (1, shared_info.number_columns)
				check_sector := get_sector ([temp_row,temp_column])
				if (not check_sector.has_stationary) and (not check_sector.is_full) then
					grid [temp_row, temp_column].put (create_stationary_item (temp_row, temp_column))
					loop_counter := loop_counter + 1
				end -- if
			end -- loop
		end -- feature set_stationary_items

	create_stationary_item (t_row: INTEGER; t_col: INTEGER): ENTITY
			-- this feature randomly creates one of the possible types of stationary actors
		local
			chance: INTEGER
			Y: YELLOW_DWARF
			B: BLUE_GIANT
			W: WORMHOLE
		do
				------------------adding stationary stars to the stationary Array ----------------------------------------

			chance := gen.rchoose (1, 3)
			inspect chance
			when 1 then
				create Y.make (shared_info.stationary_id, t_row, t_col)
					--create Result.make('Y')
				Result := Y
				stationary_stars_sorted.extend (Y)
					--				grid [t_row, t_col].put (Result)
					--				next_stationary_id := next_stationary_id - 1
			when 2 then
					--create Result.make('*')
				create B.make (shared_info.stationary_id, t_row, t_col)
				Result := B
				stationary_stars_sorted.extend (B)
					--				grid [t_row, t_col].put (Result)
					--				next_stationary_id := next_stationary_id - 1
			when 3 then
					--	create Result.make('W')
				create W.make (shared_info.stationary_id, t_row, t_col)
				Result := W
				stationary_stars_sorted.extend (W)
					--				grid [t_row, t_col].put (Result)
					--				next_stationary_id := next_stationary_id - 1
			else
					--	create Result.make('Y') -- create more yellow dwarfs this will never happen, but create by default
				create Y.make (shared_info.stationary_id, t_row, t_col)
				Result := Y
				stationary_stars_sorted.extend (Y)
					--				grid [t_row, t_col].put (Result)

			end -- inspect
			shared_info.stationary_id_sub_one
		end

feature --action

	movable_entity_move -- for turn
		local
			num: INTEGER
			num2: INTEGER
			planet_dir: INTEGER
			dir_u: DIRECTION_UTILITY
			dir_coord: TUPLE [row: INTEGER; col: INTEGER]
			suppose_coord: TUPLE [row: INTEGER; col: INTEGER]
			next_quad: INTEGER
			row : INTEGER
			col : INTEGER
			m : MOVE
			w : ACT_WORMHOLE
			en : ENTITY_ALPHABET
			id : INTEGER
			move_gen:INTEGER
		do
			across
				movable_sorted is movable
			loop
				row := movable.row
				col := movable.col
				id := movable.id
				en := movable.en
					if movable.turns_left = 0 then
						if attached{PLANET}movable as planet and get_sector([row,col]).has_star then
							planet.set_true_is_attached
							if
								get_sector([row,col]).has_yellow_dwarf
							then
								num := gen.rchoose (1, 2)
								io.put_string ("(P->"+ num.out + ":[1,2])"+ "%N")
								if num = 2 then
									planet.set_true_is_support_life
								end
							end
						else-- not planet
							if
								get_sector([row,col]).has_wormhole and (movable.is_malevolent or movable.is_benign)
							then
								w.wormhole(movable) -- comment out when finish wormhole
							else
								move_gen := gen.rchoose (1,8)
								m.move_routine (move_gen, movable)
								io.put_string ("(P->"+ move_gen.out + ":[1,8])"+ "%N")
							end
							check_alive(movable)
							if
								not movable.dead
							then

								reproduce(movable)
								movable.behave
							end
						end --
					else -- turns_left
						movable.dec_turns_left
					end
			end --loop
		end

	check_alive (ent:NON_STATIONARY)
	local
		sum_lum : INTEGER

	do
		if
			attached{EBMJ_COMMON}ent as ebmj and (not ent.location_equals and not ent.use_wormhole)
		then
			ebmj.lose_fuel
		end

		if
			attached{EBMJ_COMMON} ent as ebmj and (ent.get_sector.has_star)
		then
			sum_lum := ebmj.fuel+ent.get_sector.max_luminosity
			if
				ebmj.is_e_b_m
			then
				ebmj.set_fuel (min(sum_lum,3))
			else --j
				ebmj.set_fuel (min(sum_lum,5))
			end
		end

		if
			attached{EBMJ_COMMON}ent as ebmj
		then
			if
				ebmj.fuel = 0
			then
				ebmj.dies
				if
					ebmj.is_explorer
				then
					model.set_in_game_false
				end
			end
		end

		if
			ent.get_sector.has_blackhole
		then
			ent.dies
			ent.set_devoured
		end
	end

	reproduce(ent: NON_STATIONARY)
	DO
		io.put_string ("reproduction was reached")
		if
			attached {EBMJ_COMMON} ent as bmj
		then
			io.put_string ("(actions_left" + bmj.en.out + "->:"+ bmj.actions_left_until_reproduction.out + "%N")
			if
				not bmj.get_sector.is_full and bmj.actions_left_until_reproduction = 0
			then
				create_bmj (bmj)
			elseif
					(bmj.actions_left_until_reproduction /~ 0)
				then
					bmj.dec_actions_left_until_reproduction
				else
					if ent.get_sector.is_full then
					-- will try to reproduce next time the entity acts
				end
			end--notfull
		end --attached_
	end -- do

--	behave (ent: NON_STATIONARY) in non_stationary
--		local
--			num: INTEGER
--			num2: INTEGER
--		DO
--			if ent.is_planet then
--				if grid [ent.row, ent.col].has_star then
--						--					ent.ent_attached := true
--					if attached {PLANET} ent as planet_ent then
--						planet_ent.set_true_is_attached
--						planet_ent.set_turns_left (-1)
--					end
--					if grid [ent.row, ent.col].has_yellow_dwarf then
--						num := gen.rchoose (1, 2)
--						if num = 2 then
--							if attached {PLANET} ent as planet_ent then
--								planet_ent.set_true_is_support_life
--							end
--						end
--					end
--				else
--					if attached {PLANET} ent as planet_ent then
--						num2 := gen.rchoose (0, 2)
--						planet_ent.set_turns_left (num2)
--					end
--				end
--			end
--		end

--	turn (action: STRING)
--		DO
--			if shared_info.og_exp.face_error then
--			else
--				shared_info.reset_move_this_turn
--				shared_info.reset_dead_this_turn
--				act (action)
--				check_alive (shared_info.og_exp)
--				current.movable_entity_move
--					--				current.move (model.move_dir)
--			end
--		end

--	act (action: STRING)
--		do
--			if (action ~ "pass") then

--			elseif action ~ "move" then
--				current.move (model.move_dir)
--			elseif action ~ "wormhole" then
--				current.wormhole(shared_info.og_exp)
--			elseif action ~ "land" then
--				shared_info.og_exp.set_true_landed
--				current.land

--			elseif action ~ "liftoff" then
--			end
--		end

	land
	local
		exp : EXPLORER
		curr_sec: SECTOR
		temp_id : INTEGER
		i: INTEGER
		quad_num : INTEGER
		-- what happens when the planet supports life and i land on it.
		do
			temp_id := 10000
			exp := shared_info.og_exp
			curr_sec := grid[exp.row,exp.col]
			if(model.in_game and (not shared_info.og_exp.landed)) then
				if curr_sec.has_planet and curr_sec.has_yellow_dwarf then
			---------------------------------go through entities ---------------------------------------------------		
					from i := 1
					until i > curr_sec.entity_quad.count
					loop
						if attached {PLANET} curr_sec.entity_quad[i] as planet then
							if not planet.landed_on and temp_id > planet.id then
							temp_id := planet.id
							quad_num := i
							end
						end
						if attached {PLANET} curr_sec.entity_quad[quad_num] as planet then
							if(planet.is_support_life) then
								--output you have found life and win!!
								planet.set_landed_on_true
								shared_info.og_exp.set_true_landed
							else

								planet.set_landed_on_true
								shared_info.og_exp.set_true_landed
							end
						end
					end--loop
				end--if
			end
		end--do

		liftoff
		--lift explorer off planet
		local
			exp : EXPLORER
			i : INTEGER
			quad_num : INTEGER
			curr_sec: SECTOR
			temp_id : INTEGER

			do
				exp := shared_info.og_exp
				curr_sec := shared_info.og_exp.get_sector
				if(model.in_game and exp.landed) then

					from i := 1
					until i > curr_sec.entity_quad.count
					loop
						if attached {PLANET} curr_sec.entity_quad[i] as planet then -- check if the current planet
							if planet.landed_on and temp_id > planet.id then
							temp_id := planet.id
							quad_num := i
							end
						end
						if attached {PLANET} curr_sec.entity_quad[quad_num] as planet then
							if( not planet.is_support_life) then
								exp.set_false_landed
							else
								--turn passes
							end
						end
					end--loop
				end --if

			end--do
feature -- helper
	movable_sorted_out : STRING
	DO
		create Result.make_empty
		across
			movable_sorted is m
		loop
			Result.append(m.id_out)
		end

	end
	get_sector(d : TUPLE[row : INTEGER;col : INTEGER]) : SECTOR
		DO
			Result := grid[d.row , d.col]
		end

	place_ent(now:TUPLE[row:INTEGER;col:INTEGER]; suppose :TUPLE[row:INTEGER;col:INTEGER];ent : NON_STATIONARY )
	DO
		get_sector (now).remove (ent)
		get_sector (suppose).put (ent)
		ent.set_row (suppose.row)
		ent.set_col (suppose.col)
		ent.set_location (ent.row, ent.col, ent.get_sector.return_quad (ent))
	end

	min(a:INTEGER;b:INTEGER):INTEGER
	do
		if
			a > b
		then
			result := a
		else
			result := b
		end
	end

	create_bmj(ent : EBMJ_COMMON)
	local
		num_row: INTEGER
		num_col: INTEGER
		num_turns : INTEGER
	do
		num_row := gen.rchoose (1, 5)
		num_col := gen.rchoose (1, 5)
		if
			ent.is_benign
		then
			ent.get_sector.put (create{BENIGN}.make (shared_info.movable_id, num_row,num_col))
			ent.set_actions_left_until_reproduction (1)
			io.put_string ("(B_row->"+ num_row.out + ":[1,5])"+ "%N")
			io.put_string ("(B_col->"+ num_col.out + ":[1,5])"+ "%N")
		end
		if
			ent.is_malevolent
		then
			ent.get_sector.put (create{MALEVOLENT}.make (shared_info.movable_id, ent.row,ent.col))
			ent.set_actions_left_until_reproduction (1)
			io.put_string ("(B_row->"+ num_row.out + ":[1,5])"+ "%N")
			io.put_string ("(B_col->"+ num_col.out + ":[1,5])"+ "%N")
		end
		if
			ent.is_janitaur
		then
			ent.get_sector.put (create{JANITAUR}.make (shared_info.movable_id, ent.row,ent.col))
			ent.set_actions_left_until_reproduction (2)
		end
		num_turns := gen.rchoose (0,2)
		ent.set_turns_left (num_turns)
		io.put_string ("("+ent.en.out+ "->"+ num_turns.out + ":[0,2])"+ "%N")
		shared_info.movable_id_plus_one
	end


feature --test_information

	movement_str: STRING
		local

			ent : NON_STATIONARY

		DO
			--exp
			create Result.make_empty
			if
				shared_info.move_this_turn.is_empty
			then
				Result.append("  Movement:none%N")
			else
				Result.append("  Movement:%N")
				across
				1 |..| shared_info.move_this_turn.count is i
				loop
					ent := shared_info.move_this_turn[i]
					if
						ent.location_equals
					then
						Result.append ("    " + ent.id_out+":"+ ent.cur_location_out )
					else
						Result.append ("    " + ent.id_out+":"+ent.old_location_out+"->"+ ent.cur_location_out )
					end

					if
						i < shared_info.move_this_turn.count
					then
						Result.append("%N")
					end

				end
				Result.append ("%N")
			end

		end

	death_string : STRING
	local
		ent : NON_STATIONARY
	do
		create Result.make_empty
		if
			shared_info.dead_this_turn.is_empty
		then
			Result.append("  Deaths This Turn:none")
		else
			Result.append("  Deaths This Turn:%N")
			across
				1 |..| shared_info.dead_this_turn.count is i
			loop
				ent := shared_info.dead_this_turn[i]
				if attached{EXPLORER}ent as exp then
					Result.append ("    "+exp.id_out + "->" + "fuel:"+ exp.fuel.out +"/3" + ", "+"life:" + exp.life.out + "/3, landed?:"+ exp.return_landed )
				end

				if attached{PLANET}ent as planet then
					Result.append ("    "+planet.id_out + "->" +"attached?"+planet.out_is_attached+", support_life?:"+planet.out_is_support_life+", visited?:"+planet.out_is_visited+", turns_left:"+planet.out_turns_left)
				end

				if
					i < shared_info.move_this_turn.count
				then
					Result.append("%N")
				end
			end
		end

	end

	abstract_test_string: STRING
		local
			B: ENTITY_ALPHABET
			Y: ENTITY_ALPHABET
			i: INTEGER
			row: INTEGER
			column: INTEGER
		do
			create B.make ('*')
			create Y.make ('Y')
			create Result.make_empty
			Result.append ("  Sectors:")
			Result.append ("%N")
				-------------------OUTPUT SECTORS ---------------------
			from
				row := 1
			until
				row > shared_info.number_rows
			loop
				from
					column := 1
				until
					column > shared_info.number_columns
				loop
					Result.append ("    [" + grid [row, column].print_sector + "]->" + grid [row, column].print_quadrant)
					Result.append ("%N")
					column := column + 1;
				end
				row := row + 1
			end

				-------------------END SECTORS -------------------------
			---------------printout movable entities list--------------------------
			across movable_sorted is move_ent loop

				Result.append ("ID: " + move_ent.id_out + ",EN:" + move_ent.en.out+",turns_left:" + move_ent.turns_left.out)
				if attached {PLANET} move_ent as planet then
					result.append(", attached?:"+ planet.out_is_attached + "turns_left_planet:" + planet.out_turns_left)
				end
				if attached {EBMJ_COMMON} move_ent as EBMJ then
					Result.append (", actions_intervals:" + EBMJ.actions_left_until_reproduction.out+ ", fuel:" + EBMJ.fuel.out + ", dead_BOOLEAN" + EBMJ.dead.out)
				end
				Result.append ("%N")
			end

				-------------------OUTPUT STATIONARY STARS -----------------------
--			Result.append ("  Descriptions:%N")
--			from
--				i := stationary_stars_sorted.count
--			until
--				i < 1
--			loop
--				Result.append ("    [" + stationary_stars_sorted [i].id.out + "," + stationary_stars_sorted [i].en.out + "]->")
--				if stationary_stars_sorted [i].en ~ B or stationary_stars_sorted [i].en ~ Y then
--					Result.append ("Luminosity:" + stationary_stars_sorted [i].luminosity.out)
--				end
--				Result.append ("%N")
--				i := i - 1
			--end
			--explorer
			--movable, for planet

			across
				movable_sorted as movable
			loop
				if attached{PLANET}movable as planet then
					Result.append ("    [" + planet.id.out + "," + planet.en.out + "]->attached?:" + planet.out_is_attached)
					Result.append (", support_life?:" + planet.out_is_support_life + ", visited?:" + planet.out_is_visited + ", turns_left:" + planet.out_turns_left)
					Result.append ("%N")
				end

			end
				-------------------END PLANETS----------------------------
		end

feature -- query
	--	out_messages
	--		do
	--		--put devour and the code
	--
	--		end

	out: STRING
			--Returns grid in string form
		local
			string1: STRING
			string2: STRING
			row_counter: INTEGER
			column_counter: INTEGER
			contents_counter: INTEGER
			temp_sector: SECTOR
			temp_component: ENTITY_ALPHABET
			printed_symbols_counter: INTEGER
		do
			create Result.make_empty
			create string1.make (7 * shared_info.number_rows)
			create string2.make (7 * shared_info.number_columns)
			string1.append ("%N")
			from
				row_counter := 1
			until
				row_counter > shared_info.number_rows
			loop
				string1.append ("    ")
				string2.append ("    ")
				from
					column_counter := 1
				until
					column_counter > shared_info.number_columns
				loop
					temp_sector := grid [row_counter, column_counter]
					string1.append ("(")
					string1.append (temp_sector.print_sector)
					string1.append (")")
					string1.append ("  ")
					from
						contents_counter := 1
						printed_symbols_counter := 0
					until
						contents_counter > temp_sector.contents.count
					loop
						temp_component := temp_sector.contents [contents_counter]
						if attached temp_component as character then
							string2.append_character (character.item)
						else
							string2.append ("-")
						end -- if
						printed_symbols_counter := printed_symbols_counter + 1
						contents_counter := contents_counter + 1
					end -- loop

					from
					until
						(shared_info.max_capacity - printed_symbols_counter) = 0
					loop
						string2.append ("-")
						printed_symbols_counter := printed_symbols_counter + 1
					end
					string2.append ("   ")
					column_counter := column_counter + 1
				end -- loop
				string1.append ("%N")
				if not (row_counter = shared_info.number_rows) then
					string2.append ("%N")
				end
				Result.append (string1.twin)
				Result.append (string2.twin)
				row_counter := row_counter + 1
				string1.wipe_out
				string2.wipe_out
			end
		end

end
