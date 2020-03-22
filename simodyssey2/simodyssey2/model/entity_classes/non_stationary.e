note
	description: "Summary description for {NON_STATIONARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	NON_STATIONARY

inherit
	ENTITY


feature
--	death_message : STRING
	current_pos : LINKED_LIST[INTEGER]
	old_pos : LINKED_LIST[INTEGER]
	turns_left : INTEGER
	dead : BOOLEAN
	devoured : BOOLEAN
	use_wormhole : BOOLEAN
	model_access: ETF_MODEL_ACCESS
	model: ETF_MODEL
		attribute
			Result := model_access.m
		end
	gen: RANDOM_GENERATOR_ACCESS


feature --boolean
is_planet:BOOLEAN
	local

		P : ENTITY_ALPHABET
	do
		create P.make ('P')
		if en.is_equal (P) then
					Result := TRUE
		end

	end

	is_explorer :BOOLEAN
	local
		E : ENTITY_ALPHABET
	DO
		create E.make ('E')
		if en.is_equal (E) then
				Result := TRUE
		end

	end

 is_malevolent :BOOLEAN
	local
		E : ENTITY_ALPHABET
	DO
		create E.make ('M')
		if en.is_equal (E) then
				Result := TRUE
		end
	end

  is_benign :BOOLEAN
	local
		E : ENTITY_ALPHABET
	DO
		create E.make ('B')
		if en.is_equal (E) then
				Result := TRUE
		end
	end

	  is_janitaur :BOOLEAN
	local
		E : ENTITY_ALPHABET
	DO
		create E.make ('J')
		if en.is_equal (E) then
				Result := TRUE
		end
	end

	is_asteroid :BOOLEAN
	local
		E : ENTITY_ALPHABET
	DO
		create E.make ('A')
		if en.is_equal (E) then
				Result := TRUE
		end
	end

feature -- function
	set_location(r:INTEGER;c:INTEGER;q:INTEGER)
		do
			create current_pos.make
			current_pos.extend (r)
			current_pos.extend (c)
			current_pos.extend (q)
		end

	set_old_location(ro:INTEGER;co:INTEGER;qu:INTEGER)
		do
			create old_pos.make
			old_pos.extend (ro)
			old_pos.extend (co)
			old_pos.extend (qu)
		end

	set_turns_left ( i : INTEGER) -- for sectors
	do
			turns_left := i
	end

	set_devoured
	do
		devoured := true
	end

	dec_turns_left
		do
			if turns_left > 0 then
			turns_left := turns_left - 1
			end
		end

	set_use_wormhole
	do
		use_wormhole := true
	end

	dies --
	do
		dead := true
		shared_info.dead_this_turn.extend (current)
		current.get_sector.remove(current)
		if
			current.is_explorer
		then
			model.set_in_game_false
		end
	end

feature -- quires

	location_equals:BOOLEAN
	do
		Result := across 1 |..| 3 is i all
		current_pos[i] ~ old_pos[i]
		 end
	end

	cur_location_out : STRING
	do
		create Result.make_empty
		Result := "[" + current_pos[1].out + "," + current_pos[2].out+"," + current_pos[3].out+ "]"
	end

	old_location_out : STRING
	do
		create Result.make_empty
		Result := "[" + old_pos[1].out + "," + old_pos[2].out+"," + old_pos[3].out+ "]"
	end

feature{GALAXY} -- GALAXY ONLY
	behave
	local
		num : INTEGER
		num_turn : INTEGER
		num_turn_p : INTEGER
	do
		if
			current.is_asteroid
		then
			across
				current.get_sector.return_sorted_ent is item
			loop
				if attached{EBMJ_COMMON}item as ebmj then
					ebmj.dies -- explorer?
				end
			end
			num_turn := gen.rchoose (0, 2)
			current.set_turns_left (num_turn)
			io.put_string ("(A->"+ num_turn.out + ":[0,2])"+ "%N")
		elseif current.is_janitaur then
			if attached{JANITAUR}current as jan then
				across
					current.get_sector.return_sorted_ent is item
				loop
					if attached{NON_STATIONARY}item as mov then
						if
							mov.is_asteroid
						then
								mov.dies
								jan.add_load
						end
					end
				end
				--wormhole
				if
					current.get_sector.has_wormhole
				then
					jan.set_load (0)
				end

			num_turn := gen.rchoose (0, 2)
				jan.set_turns_left (num_turn)
				io.put_string ("(J->"+ num_turn.out + ":[0,2])"+ "%N")
			end

		elseif current.is_benign then
			if attached{BENIGN}current as ben then
				across
					current.get_sector.return_sorted_ent is item
				loop
					if attached{NON_STATIONARY}item as mov then
						if
							mov.is_malevolent
						then
							mov.dies
						end
					end
				end
				num_turn := gen.rchoose (0, 2)
				ben.set_turns_left (num_turn)
				io.put_string ("(B->"+ num_turn.out + ":[0,2])"+ "%N")
			end

		elseif current.is_malevolent then
			if
				current.get_sector.has_explorer and (not current.get_sector.has_benign) and not shared_info.og_exp.landed
			then
				shared_info.og_exp.dec_life
			end
			num_turn := gen.rchoose (0, 2)
			current.set_turns_left (num_turn)
			io.put_string ("(M->"+ num_turn.out + ":[0,2])"+ "%N")

		elseif attached{PLANET}current as planet then
			if
				planet.get_sector.has_star
			then
				planet.set_true_is_attached
				if
					planet.get_sector.has_yellow_dwarf
				then
					num:= gen.rchoose (1,2)
					io.put_string ("(P->"+ num.out + ":[1,2])"+ "%N")
					if num = 2 then
						planet.set_true_is_support_life
					end
				end
			else
				num_turn_p := gen.rchoose (0,2)
				planet.set_turns_left (num_turn_p)
				io.put_string ("(P->"+ num_turn_p.out + ":[0,2])"+ "%N")

			end
		end
		---
	end

end
