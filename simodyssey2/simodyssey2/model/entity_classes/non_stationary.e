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
	name : STRING
	s_name : STRING
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
			else
				turns_left := -1
			end
		end

	set_use_wormhole
	do
		use_wormhole := true
	end

	off_use_wormhole
	do
		use_wormhole := false
	end

	dies -- check_death
	do
		dead := true
		current.set_turns_left (-1)
		shared_info.dead_this_turn.extend (current)
		current.get_sector.remove(current)
--		shared_info.galaxy.movable_sorted.prune_all (current)
-- store it
		shared_info.galaxy.temp_dies.extend (current)

	end

feature -- quires
	out_turns_left : STRING

		do
			if turns_left = -1  then
				Result := "N/A"
			else
				Result := turns_left.out
			end
		end

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

feature -- msg common
	dmsg_to_blackhole(ent : NON_STATIONARY):STRING
		do
			--blackhole isnt allowed to be wrong
			Result := ent.name +  " got devoured by blackhole (id: -1) at Sector:3:3"
		end

	current_status : STRING
		deferred end

	dmsg_reason(d : NON_STATIONARY ):STRING
	-- d destoryed r destructor
		local
			ide : INTEGER
			r : ARRAY[NON_STATIONARY]
			r1 : NON_STATIONARY
		do
			create result.make_empty
			create r.make_empty
			r := shared_info.destory_this_turn.check_destructor (d)
			if not r.is_empty then
				r1 := r[1]
				ide := r[1].id
				if r1.is_janitaur then
					result := d.name + " got imploded by " + r1.s_name + " (id: " + ide.out +")" + " at " + "Sector:" + current.get_sector.print_sector_spec

				else
					result := d.name + " got destroyed by " + r1.s_name + " (id: " + ide.out +")" + " at " + "Sector:" + current.get_sector.print_sector_spec
				end

			end

		end

feature -- helper
	turns_left_str : STRING
	do
		create Result.make_empty
		Result := "turns_left:" + out_turns_left
	end

feature{GALAXY} -- GALAXY ONLY
	behave
	local
		num : INTEGER
		num_turn_a : INTEGER
		num_turn_b : INTEGER
		num_turn_j : INTEGER
		num_turn_m : INTEGER
		num_turn_p : INTEGER
	do
		if
			current.is_asteroid
		then
			across
				current.get_sector.return_sorted_ent is item
			loop
				if attached{EBMJ_COMMON}item as ebmj then
					if ebmj.is_explorer then
						if attached{EXPLORER}ebmj as exp then
							if not exp.landed then
								exp.dies
							end
						end
					else
						ebmj.dies
						ebmj.set_d_asteroid
						shared_info.destory_this_turn.put (ebmj,current)
						-- d : destoryed r :destructor
					end

				end
			end
			num_turn_a := gen.rchoose (0, 2)
			current.set_turns_left (num_turn_a)
			io.put_string ("(A->"+ current.id_out +num_turn_a.out + ":[0,2])"+ "%N")

		elseif current.is_janitaur then
			if attached{JANITAUR}current as jan then
				across
					current.get_sector.return_sorted_ent is item
				loop
					if attached{NON_STATIONARY}item as mov then
						if
							attached{ASTEROID}mov as a and jan.load < 2
						then
								a.dies
								a.set_d_janitaur
								jan.add_load
								shared_info.destory_this_turn.put (a,current)
								-- d : destoryed r :destructor
						end
					end
				end
				--wormhole
				if
					current.get_sector.has_wormhole
				then
					jan.set_load (0)
				end

			num_turn_j := gen.rchoose (0, 2)
				jan.set_turns_left (num_turn_j)
				io.put_string ("(J->"+  current.id_out +num_turn_j.out + ":[0,2])"+ "%N")
			end

		elseif current.is_benign then
			if attached{BENIGN}current as ben then
				across
					current.get_sector.return_sorted_ent is item
				loop
					if item.is_malevolent then
						if attached{MALEVOLENT}item as m then
							m.dies
							m.set_d_benign
							shared_info.destory_this_turn.put (m,current)
							-- d : destoryed r :destructor
							-- store destry info
						end
					end
				end
				num_turn_b := gen.rchoose (0, 2)
				ben.set_turns_left (num_turn_b)
				io.put_string ("(B->"+  current.id_out +num_turn_b.out + ":[0,2])"+ "%N")
			end

		elseif current.is_malevolent then
			if
				current.get_sector.has_explorer and (not current.get_sector.has_benign) and not shared_info.og_exp.landed
			then
				shared_info.og_exp.dec_life
				if shared_info.og_exp.life = 0 then
					shared_info.og_exp.dies

				end
				shared_info.destory_this_turn.put (shared_info.og_exp, current) -- put it in check_alive???

			end
			num_turn_m := gen.rchoose (0, 2)
			current.set_turns_left (num_turn_m)
			io.put_string ("(M->"+  current.id_out +num_turn_m.out + ":[0,2])"+ "%N")

		elseif attached{PLANET}current as planet then
			if
				planet.get_sector.has_star
			then
				planet.set_true_is_attached
				planet.set_turns_left (0-1)
				if
					planet.get_sector.has_yellow_dwarf and not planet.check_supp_life_already
				then
					num:= gen.rchoose (1,2)
					io.put_string ("(P->"+ num.out + ":[1,2])"+ "%N")
					if num = 2 then
						planet.set_true_is_support_life
						planet.set_true_check_supp_life_already
					end
				end
			else
				num_turn_p := gen.rchoose (0,2)
				planet.set_turns_left (num_turn_p)
				io.put_string ("(P->"+  current.id_out +num_turn_p.out + ":[0,2])"+ "%N")

			end
		end
		---
	end

end
