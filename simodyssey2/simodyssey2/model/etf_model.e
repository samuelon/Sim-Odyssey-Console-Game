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
			status_on := FALSE
			test_on:=false
			play_on:=false
			face_error:=false
			i := 0
			e:=0
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
	--g : detachable GALAXY

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
	DO
		create m.make

		if attached p as p1 then
			move_dir := dir
			p1.g.turn (m)
		end
--		if not in_game then
--			main_msg.set_second (all_msg.error_mode_in_game)
--			face_error := true
--		elseif shared_info.og_exp.landed then
--			main_msg.set_second (all_msg.error_move_landed)
--			face_error := true
--		else
--			-- sector is full inside m
--			move_dir := dir
--			if attached p as p1
--			then
--				p1.g.turn (m)
--			end
--		end -- if

	end --do

	land
		local
			l : LAND
		do
			create l.make
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
			end

		end
	pass
		local
			pa : PASS
		do
			create pa.make
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
			create w.make
			if	attached p as p1 then
				p1.g.turn (w)

				end
		end
	abort
		do
			abort_on := TRUE
			if in_game = false then
				main_msg.abort_only("error")
				main_msg.set_second (all_msg.error_not_in_mission)
			else
				main_msg.abort_only("ok")
				main_msg.set_second (all_msg.abort_in_game)
				face_error := true
				in_game := False
				play_on := false
				test_on := false
			end
		end

	test(a_threshold, j_threshold, m_threshold, b_threshold, p_threshold : INTEGER)
		do
--			create t.make
	-- need test sth wrong with generator
			create p.make_test (a_threshold, j_threshold, m_threshold, b_threshold, p_threshold)
			test_on:= True
			in_game := true
			face_error:=false
			abort_on := false
			status_on := FALSE
			i := 0
			e := 0
		end

	play
	DO
--		if in_game then
--			main_msg.set_second (all_msg.error_mode_in_game)
--			face_error := true
--		else
			create p.make
			play_on := True
			in_game := true
			face_error:=false
			abort_on := false
			status_on := FALSE
			i := 0
			e := 0

--		end

	end

	status
		do
			if in_game then
				main_msg.set_second (all_msg.error_mode_in_game)
				face_error := true
			else
				status_on := true
				--print/set status
			end
		end

feature -- helper
	check_land : BOOLEAN
		do

		end
	reset_routine
		do
			face_error:=false
			abort_on := false
			status_on := FALSE
			i := 0
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
			if face_error then -- command-specific or exp death msg
				Result.append (main_msg.second)
			end

			if
				in_game and not face_error
			then
				result.append (main_msg.third)
				if test_on then
					Result.append (main_msg.fourth)
					Result.append (main_msg.fifth)
					result.append (main_msg.sixth)
				end
				Result.append (main_msg.seventh)
			end
			Result.append ("%N"+shared_info.og_exp.id_out + "," + shared_info.og_exp.get_sector.print_sector+ "landed:"+ shared_info.og_exp.landed.out + ",fuel"+ shared_info.og_exp.fuel.out)

		end

end




