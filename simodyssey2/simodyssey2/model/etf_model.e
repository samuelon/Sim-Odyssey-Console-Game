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
			io.put_string (all_msg.welcome)

		end

feature -- model attributes
	i : INTEGER
	status_num : INTEGER
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
	move_dir : INTEGER
	--g : detachable GALAXY

feature -- model operations
	default_update
			-- Perform update to the model state.
			-- main msg number + 1
		do
			-- if no error
			i := i + 1
			-- othewise, increment the .x
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
		create m.make
		if
			attached p as p1
		then
			-- put in the act afterwards
--			create m.make
			move_dir := dir
			p1.g.turn (m)
		end

	end

	land
		local
			l : LAND
		do
			create l.make
			if	attached p as p1 then
--				p1.g.turn ("land")

				p1.g.turn (l)
--				p1.shared_info.galaxy.movable_entity_move
			end
		end

	liftoff
		local
			li : LIFTOFF
		do
			create li.make
			if	attached p as p1 then
--				p1.g.turn ("liftoff")
				p1.g.turn (li)
			end

		end
	pass
		local
			pa : PASS
		do
			create pa.make
			if	attached p as p1 then
				p1.g.turn (pa)
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
				Result.append (main_msg.fourth)
				Result.append (main_msg.fifth)
				Result.append (main_msg.pic)
			end
			Result.append (shared_info.og_exp.id_out + "," + "landed:"+ shared_info.og_exp.landed.out + ",fuel"+ shared_info.og_exp.fuel.out)


		end

end




