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
			reset_routine
			create main_msg.make
			io.put_string (all_msg.welcome)

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
	status_on : BOOLEAN
	test_on:BOOLEAN
	play_on:BOOLEAN
	face_error:BOOLEAN
	abort_on : BOOLEAN
	command_specific : BOOLEAN


feature -- model operations
	default_update
			-- Perform update to the model state.
			-- main msg number + 1
		do
			-- if no error
			if not face_error and not status_on and in_game then
				i := i+1
				e := 0 --reset
			else
			-- othewise, increment the .x	
				e := e + 1
			end
		end

	reset
			-- Reset model state.
		do
			make
		end

	move(dir : INTEGER) --defensive programming
	local
		m : MOVE
		temp : TUPLE[row:INTEGER ; col : INTEGER]
	DO
		create m.make
		reset_action_routine
		temp := m.calculate_next_sector (dir, shared_info.og_exp)
		if not in_game then
			main_msg.set_second (all_msg.error_mode_in_game)
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
				end
				move_dir := dir
				p1.g.turn (m)
			end
		end -- if

	end --do

	land
		local
			l : LAND
		do
			create l.make
			--control error
			reset_action_routine
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
			else
				if	attached p as p1 then
					-- no unvisited inside land
					p1.g.turn (l)
				end
			end

		end

	liftoff
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
			end

		end
	pass
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
				shared_info.reset
			end
		end

	test(a_threshold, j_threshold, m_threshold, b_threshold, p_threshold : INTEGER)
		do
--			create t.make
	-- need test sth wrong with generator
			if in_game then
				main_msg.set_second (all_msg.error_mode_in_game)
				face_error := true
			elseif not (0 < a_threshold and a_threshold <= j_threshold and j_threshold <= m_threshold
				and m_threshold <= b_threshold and b_threshold <= p_threshold and p_threshold <= 101 ) then
				main_msg.set_second (all_msg.error_test)
				face_error:=true
			else
				create p.make_test (a_threshold, j_threshold, m_threshold, b_threshold, p_threshold)
				test_on:= True
				in_game := true
				reset_routine
			end
		end

	play
	DO
		if in_game then
			main_msg.set_second (all_msg.error_mode_in_game)
			face_error := true
		else
			create p.make
			play_on := True
			in_game := true
			reset_routine
		end

	end

	status
		do
			if not in_game then
				main_msg.set_second (all_msg.error_not_in_mission)
				face_error := true
			else
				status_on := true
				if not shared_info.og_exp.landed then
					main_msg.set_second (all_msg.status_not_landed)
					command_specific := true
				else
					main_msg.set_second (all_msg.status_landed)
					command_specific := true
				end
				--print/set status
			end
		end

feature -- helper

	reset_action_routine
		do
			command_specific := false
			status_on := false
			face_error := false
		end

	reset_routine
		do
			face_error:=false
			abort_on := false
			status_on := FALSE
			command_specific := false
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

	set_command_specific_on
		do
			command_specific := true
		end

	set_face_error_t
		do
			face_error := true
		end

feature -- defensive
--	-- check_error(action : ACTION)
--		--  DO
--		      if action.is_move then
--		      	-- if shared_info.og_exp.landed then
--		      		   -- main_msg.set_second(str)
--		      end

feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  ")
			result.append ("------------------%N") --debug
			if i > 0 or e > 0 then
				Result.append (main_msg.first)
			end
			if face_error or command_specific then -- command-specific or exp death msg
				Result.append (main_msg.second)
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
			if test_on and shared_info.og_exp.dead then
				Result.append(main_msg.eight)
			end
			Result.append ("%N"+shared_info.og_exp.id_out + "," + shared_info.og_exp.get_sector.print_sector+ "landed:"+ shared_info.og_exp.landed.out + ",fuel"+ shared_info.og_exp.fuel.out+"%N")
			result.append (shared_info.galaxy.movable_sorted_out+"%N")
			result.append (shared_info.out_removed_this_turn)
--			result.append (shared_info.destory_this_turn.out_destory_book)
		end

end




