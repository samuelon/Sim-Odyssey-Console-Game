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
	movable_sorted: LINKED_LIST[NON_STATIONARY]
	stationary_stars_sorted: LINKED_LIST [STATIONARY]

feature --attributes
	all_msgs: ALL_MSG
	planet_threshold: INTEGER
	asteroid_threshold: INTEGER
	janitaur_threshold: INTEGER
	malevolent_threshold: INTEGER
	benign_threshold: INTEGER

	explorer: EXPLORER
	temp_reproduced : LINKED_LIST[EBMJ_COMMON]


feature -- boolean
	sector_is_full: BOOLEAN

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
		create  movable_sorted.make
		create temp_reproduced.make


	end

	make
			-- creates a dummy of galaxy grid
		local
			row: INTEGER
			column: INTEGER

		do
			create movable_sorted.make
			movable_sorted.compare_objects
			create stationary_stars_sorted.make
--			create temp_for_produce.make_empty
			stationary_stars_sorted.extend (shared_info.black_hole)
			planet_threshold := shared_info.planet_threshold
			malevolent_threshold := shared_info.malevolent_threshold
			benign_threshold := shared_info.benign_threshold
			janitaur_threshold := shared_info.janitaur_threshold
			asteroid_threshold := shared_info.asteroid_threshold
			create temp_reproduced.make
			temp_reproduced.compare_objects

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
			explorer := shared_info.og_exp
			sector_is_full := FALSE

			---sort movable
			sort_movable_list

		end

feature --commands
	sort_movable_list
	local
		sort : SORTED_ENTITY
		temp : LINKED_LIST[ENTITY]
		temp_movable : LINKED_LIST[NON_STATIONARY]
	do
		create sort.make (movable_sorted)
		temp:= sort.sorted_entities-- array [NON_STATIONARY] := ARR[ENTITY]????
		-- CAST TO NONSTATIONARY
		create temp_movable.make
		across
			temp is ent
		loop
			if
				not ent.is_stationary
			then
				if attached{NON_STATIONARY}ent as mov then
					temp_movable.extend (mov)
				end
			end
		end
		movable_sorted := temp_movable
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
	turn(action : ACTION)
	require
		vaild : not model.face_error
	do
		shared_info.reset_move_this_turn
		shared_info.reset_dead_this_turn
		shared_info.reset_reproduce_this_turn
		temp_reproduced.wipe_out
		act(action)
		check_alive (shared_info.og_exp)
		-- reset
		across
			movable_sorted is m
		loop
			m.off_use_wormhole
			-- set reproduced others?
		end
		movable_entity_move
		if temp_reproduced.is_empty then
		else
			across
				temp_reproduced is mov
			loop
				movable_sorted.extend (mov)
			end
			sort_movable_list
		end
		if
			shared_info.og_exp.dead
		then
			shared_info.og_exp.set_life (0)
			model.set_in_game_false
		end

	end

	movable_entity_move -- for turn
		local
			num: INTEGER
			num2: INTEGER
			row : INTEGER
			col : INTEGER
			m : MOVE
			w : ACT_WORMHOLE
			en : ENTITY_ALPHABET
			id : INTEGER
			i : INTEGER
			move_gen:INTEGER
			old_count : INTEGER
			mov_count : INTEGER
		do
			create m.make
			create w.make
        	old_count := movable_sorted.count
			from
				i := 2
			until
				i >  old_count
			loop
				row := movable_sorted[i].row
				col := movable_sorted[i].col
				id := movable_sorted[i].id
				en := movable_sorted[i].en
				if movable_sorted[i].turns_left = 0 then
					if attached{PLANET}movable_sorted[i] as planet and get_sector([row,col]).has_star then
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
						planet.dec_turns_left
					else-- not planet
						if
							movable_sorted[i].get_sector.has_wormhole and (movable_sorted[i].is_malevolent or movable_sorted[i].is_benign)
						then
							w.wormhole(movable_sorted[i]) -- comment out when finish wormhole
						else
							move_gen := gen.rchoose (1,8)
							m.move_routine (move_gen, movable_sorted[i])
							io.put_string (movable_sorted[i].en.out + "->" + move_gen.out + ":[1,8])"+ "%N")
						end
						check_alive(movable_sorted[i])
						if
							not movable_sorted[i].dead
						then
							reproduce(movable_sorted[i])
							mov_count := movable_sorted.count
							movable_sorted[i].behave
							-- if less i - 1
							if mov_count - movable_sorted.count >0 then
								i := i -(mov_count - movable_sorted.count)
							end

						end
					end --
				else -- turns_left
					movable_sorted[i].dec_turns_left
				end
				i := i+1
				old_count := movable_sorted.count
			end
--		
		end

	check_alive (ent:NON_STATIONARY)
	local
		sum_lum : INTEGER

	do
		if
			attached{EBMJ_COMMON}ent as ebmj and (not ent.location_equals and not ent.use_wormhole) --- ??????
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
			end
		end

		if
			ent.get_sector.has_blackhole
		then
			ent.set_devoured
			ent.dies
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
				bmj.set_reproduce_others
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

	act(action:ACTION)

	do
		if attached{PASS}action as pass then

		elseif attached {MOVE}action as mov then
			mov.move_routine (model.move_dir, shared_info.og_exp)
		elseif attached{ACT_WORMHOLE}action as wor then
			wor.wormhole (shared_info.og_exp)
		elseif attached{LAND}action as land then
			land.land
		elseif action.act_name.is_liftoff then
			if attached{LIFTOFF}action as lift then
				lift.liftoff
			end
		end
	end

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
			result := b
		else
			result := a
		end
	end


	create_bmj(ent : EBMJ_COMMON)
	local
		num_turns : INTEGER
		b : BENIGN
		m : MALEVOLENT
		j : JANITAUR
	do
		if
			ent.is_benign
		then
			create {BENIGN}b.make (shared_info.movable_id, ent.row,ent.col)
			ent.get_sector.populate_routine (ent.row, ent.col, b)
			ent.set_actions_left_until_reproduction (1)
--			io.put_string ("B->"+ b.cur_location_out)
			-- STORE B
--			movable_sorted.extend (b)
			temp_reproduced.extend (b)
			shared_info.reproduce_this_turn.put (b, ent)
		end
		if
			ent.is_malevolent
		then
			create{MALEVOLENT}m.make (shared_info.movable_id, ent.row,ent.col)
			ent.get_sector.populate_routine (ent.row, ent.col, m)
			ent.set_actions_left_until_reproduction (1)
--			movable_sorted.extend (m)
--			sort_movable_list
			temp_reproduced.extend (m)
			shared_info.reproduce_this_turn.put (m, ent)
		end
		if
			ent.is_janitaur
		then
			create{JANITAUR}j.make (shared_info.movable_id, ent.row,ent.col)
			ent.get_sector.populate_routine (ent.row, ent.col, j)
			ent.set_actions_left_until_reproduction (2)
--			movable_sorted.extend (j)
--			sort_movable_list
			temp_reproduced.extend (j)
			shared_info.reproduce_this_turn.put (j, ent)
		end
		io.put_string ("("+ent.en.out+ "->"+ num_turns.out + ":[0,2])"+ "%N")
	end




feature -- query


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
