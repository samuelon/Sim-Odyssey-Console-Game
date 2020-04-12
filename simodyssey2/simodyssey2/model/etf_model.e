note
	description: "A default business model. - game"
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODEL

inherit
	ANY
		redefine
			out
		end

create {ETF_MODEL_ACCESS}
	make


feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			in_game := false
			test_on:=false
			play_on:=false
			end_game := false
			reset_routine
			create main_msg.make
--			io.put_string ("  state:0.0, ok%N  Welcome! Try test(3,5,7,15,30)")
		end

feature -- model attributes
	i : INTEGER
	e : INTEGER
	move_dir : INTEGER
	p : detachable MODE
	main_msg:MAIN_MESSAGE
	all_msg : ALL_MSG
	shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end

feature -- boolean
	in_game : BOOLEAN
		-- show whether it is in the game
	status_on : BOOLEAN
		-- show whether user input status
	test_on:BOOLEAN
		-- show whether user input test
	play_on:BOOLEAN
		-- show whether user input play_on
	face_error:BOOLEAN
		-- show whether the user command causes error
	abort_on : BOOLEAN
	-- show whether user input abort
	command_specific : BOOLEAN
		-- show whether the current command leads to its specific message
	end_game : BOOLEAN
		-- show if the current game is end
	land_on : BOOLEAN
		-- show whether user input land
	liftoff_on : BOOLEAN
		-- show whether user input liftoff


feature -- model operations
	default_update
			-- Perform update to the model state.
			-- main msg number + 1
		do
			-- if no error
			status_check
			if not face_error and not status_on and not abort_on then -- add in game? -- and not status_on and in_game
				i := i+1
				e := 0 --reset
			else
			-- othewise, increment the .x	
				e := e + 1
			end
		end

	status_check
		-- check if the current game status and set death message of explorer if it dead
		local
			ex : EXPLORER
			str : STRING
			d_temp : STRING
		do
			ex := shared_info.og_exp
			create str.make_empty
			create d_temp.make_empty
			if not in_game then

			else
				-- win
				if shared_info.galaxy.game_status.is_win and then shared_info.galaxy.game_status.is_over then

					set_command_specific_on
					main_msg.set_second (all_msg.land_life_found)
--					in_game:= false
					end_game := true
			-- lost
				elseif not shared_info.galaxy.game_status.is_win and then shared_info.galaxy.game_status.is_over then
					d_temp := main_msg.sixth
					set_command_specific_on
					str.append ("  ")
				--				io.put_string (shared_info.exp_death_msg)
					str.append (shared_info.exp_death_msg)
					str.append ("%N"+ all_msg.game_is_over+"%N")
--					main_msg.set_second (str)
					if liftoff_on then
						main_msg.append_second ("%N"+str)
					else
						main_msg.set_second (str)
					end
					main_msg.set_eight("  "+shared_info.exp_death_msg+"%N"+ all_msg.game_is_over)
				--				in_game := false
					end_game := true

				elseif not shared_info.galaxy.game_status.is_win and then not shared_info.galaxy.game_status.is_over then

					-- nothing
				end

			end

			ensure
--				valid_game_status : (shared_info.og_exp.wins or shared_info.og_exp.dead) implies end_game
		end

	reset
			-- Reset model state.
		do
			make
		end

	move(dir : INTEGER)
		-- move explorer
	local
		m : MOVE
		temp : TUPLE[row:INTEGER ; col : INTEGER]
	DO
		create m.make
		reset_action_routine
		temp := m.calculate_next_sector (dir, shared_info.og_exp)
		if not in_game then
			main_msg.set_second (all_msg.error_not_in_mission)
			face_error := true
		elseif shared_info.og_exp.landed then
			main_msg.set_second (all_msg.error_move_landed)
			face_error := true
		else
			if attached p as p1
			then
				if p1.g.get_sector (temp).is_full then
					main_msg.set_second (all_msg.error_move_full)
					face_error := true
				else
					move_dir := dir
					p1.g.turn (m)
				end

			end
		end -- if

	end --do

	land
		-- land explorer
		local
			l : LAND
			not_attached : INTEGER
			p_num : INTEGER
		do
			create l.make
			reset_action_routine
			--control error

			if not in_game then
				main_msg.set_second (all_msg.error_not_in_mission)
				face_error := true
			elseif shared_info.og_exp.landed then
				main_msg.set_second (all_msg.error_land_already_land)
				face_error := true
			elseif not shared_info.og_exp.get_sector.has_yellow_dwarf then
				main_msg.set_second (all_msg.error_land_no_yellow_dwarf)
				face_error := true
			elseif not shared_info.og_exp.get_sector.has_planet then
				main_msg.set_second (all_msg.error_land_no_planet)
				face_error := true
--			elseif shared_info.og_exp.get_sector then
			elseif shared_info.og_exp.get_sector.all_p_not_attached then
				main_msg.set_second (all_msg.error_land_no_visited_planet)
				face_error := true
			else
				if	attached p as p1 then
					-- no unvisited inside land
					p1.g.turn (l)
					land_on := true
				end
			end

		end

	liftoff
		-- liftoff explorer
		local
			li : LIFTOFF
		do
			create li.make
			reset_action_routine
			if not in_game then
				main_msg.set_second (all_msg.error_not_in_mission)
				face_error := true
			elseif not shared_info.og_exp.landed then
				main_msg.set_second (all_msg.error_liftoff_not_on_a_planet)
				face_error := true
			else
				if	attached p as p1 then
					p1.g.turn (li)
				end
				main_msg.set_second (all_msg.lift_off)
				command_specific := true
				liftoff_on := true
			end

		end
	pass
		-- pass the current turn and do nothing
		local
			pa : PASS
		do
			create pa.make
			reset_action_routine
			if not in_game then
				main_msg.set_second (all_msg.error_not_in_mission)
				face_error := true
			else
				if	attached p as p1 then
					p1.g.turn (pa)
					end
			end
		end

	wormhole
		-- exploer use wormhole
		local
			w : ACT_WORMHOLE
		do
			reset_action_routine
			if not in_game then
				main_msg.set_second (all_msg.error_not_in_mission)
				face_error := true
			elseif shared_info.og_exp.landed then
				main_msg.set_second (all_msg.error_wormhole_landed)
				face_error := true
			elseif not shared_info.og_exp.get_sector.has_wormhole then
				main_msg.set_second (all_msg.error_wormhole_not_find)
				face_error := true
			else
				create w.make
				if	attached p as p1 then
					p1.g.turn (w)
					end
			end
		end

	abort
		-- abort the current game
		do
			reset_action_routine
			if in_game = false then
				main_msg.set_second (all_msg.error_not_in_mission)
				face_error := true
			else
				main_msg.set_second (all_msg.abort_in_game)
				command_specific := true
				in_game := False
				play_on := false
				test_on := false
				abort_on := true
--				shared_info.reset_key_info
			end
		end

	test(a_threshold, j_threshold, m_threshold, b_threshold, p_threshold : INTEGER)
		-- test mode set as the value user input
		do
--			create t.make
	-- need test sth wrong with generator
			if in_game then
				main_msg.set_second (all_msg.error_mode_in_game)
				face_error := true
			elseif not (0 < a_threshold and a_threshold <= j_threshold and j_threshold <= m_threshold
				and m_threshold <= b_threshold and b_threshold <= p_threshold and p_threshold < 101 ) then
				main_msg.set_second (all_msg.error_test)
				face_error:=true
			else
				create p.make_test (a_threshold, j_threshold, m_threshold, b_threshold, p_threshold)
				test_on:= True
				play_on := false
				mode_common
			end
		end

	mode_common
		-- the common settings of play and test
	do
		in_game := true
		reset_routine
		main_msg.set_second ("")
		main_msg.set_eight("")
		end_game := false
--		if end_game then
--			shared_info.reset_ent_id
--		end

	end

	play
		-- play mode
	DO
		if in_game then
			main_msg.set_second (all_msg.error_mode_in_game)
			face_error := true
		else
			create p.make
			play_on := True
			mode_common
			test_on := false


--			main_msg.reset_all

		end

	end

	status
		-- current explorer status
		do
			reset_action_routine
			if not in_game then
				main_msg.set_second (all_msg.error_not_in_mission)
				face_error := true
			else
				status_on := true
				if not shared_info.og_exp.landed then
					main_msg.set_second (all_msg.status_not_landed)
				else
					main_msg.set_second (all_msg.status_landed)
				end
				command_specific := true
				--print/set status
			end
		end

feature -- helper

	reset_action_routine
		-- reset all flags
		do
			command_specific := false
			status_on := false
			face_error := false
			abort_on := false
			land_on := false
			liftoff_on := false
		end

	reset_routine
		-- reset the make
		do
			reset_action_routine
--			shared_info.reset_key_info
--			end_game := false
			e := 0
		end

	return_i : INTEGER
	do
		result := i
	end

	set_in_game_false
	do
		in_game := false
	end

	off_end_game
	do
		end_game := false
	end

	set_command_specific_on
		do
			command_specific := true
		end

	set_face_error_t
		do
			face_error := true
		end


feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  ")
			--result.append ("------------------%N") --debug

			if i > 0 or e > 0 then
				Result.append (main_msg.first)
			else
				result.append (all_msg.welcome)
			end
			if face_error or command_specific then -- command-specific (include exp death msg)
				Result.append (main_msg.second)
				if not end_game and (land_on or liftoff_on )then
					Result.append ("%N")
				end
			end

			if
				in_game and not face_error and not status_on and not shared_info.og_exp.wins
			then
				result.append (main_msg.third)
				if test_on then
					Result.append (main_msg.fourth)
					Result.append (main_msg.fifth)
					result.append (main_msg.sixth)
				end
				Result.append (main_msg.seventh)
			end
			if in_game and test_on and shared_info.og_exp.dead then
				result.append ("%N")
				Result.append(main_msg.eight)
			end
		end

end




