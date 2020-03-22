note
	description: "A default business model."
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
			status_num:=0
			create main_msg.make

		end

feature -- model attributes
	i : INTEGER
	status_num : INTEGER
	p : detachable MODE
	main_msg:MAIN_MESSAGE
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
	move_dir : INTEGER
	--g : detachable GALAXY

feature -- model operations
	default_update
			-- Perform update to the model state.
			-- main msg number + 1
		do
			i := i + 1
		end

	default_status_update
			-- Perform update to the model state.
			-- main msg number + 1
		do
			status_num := status_num + 1
		end


	reset
			-- Reset model state.
		do
			make
		end
	move(dir : INTEGER)
	local
		m : MOVE
	DO
		if
			attached p as p1
		then
			m.move_routine(dir,shared_info.og_exp)
--			p1.g.turn("move")
			p1.shared_info.galaxy.movable_entity_move

		end

	end

	land
		do
			if	attached p as p1 then
--				p1.g.turn ("land")
			end
		end
	liftoff
		do
			if	attached p as p1 then
--				p1.g.turn ("liftoff")
			end

		end
	pass
		do
			if	attached p as p1 then
--				p1.g.turn ("pass")
				end

		end
	wormhole
		local
			w : ACT_WORMHOLE
		do
			if	attached p as p1 then
--				p1.g.turn ("wormhole")
				w.wormhole(shared_info.og_exp)
				end
		end
	abort
		do
			in_game := False
			face_error := true
		end

	test(a_threshold, j_threshold, m_threshold, b_threshold, p_threshold : INTEGER)
		do
--			create t.make
	-- need test sth wrong with generator
			create p.make_test (a_threshold, j_threshold, m_threshold, b_threshold, p_threshold)
			test_on:= True
			in_game := true
			face_error := false
		end

	play
	DO

		create p.make
		play_on := True
		in_game := true
		face_error := false

	end
	status
		do
			status_on := true
		end

feature -- helper
	return_i : INTEGER
	do
		result := i
	end

	set_in_game_false
	do
		in_game := false
	end

feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  ")
			if
				in_game and not face_error
			then
				Result.append (main_msg.pic)
			end

		end

end




