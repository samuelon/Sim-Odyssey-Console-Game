note
	description: "Summary description for {MAIN_MESSAGE} display all msg."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

 class
	MAIN_MESSAGE

create
	make

feature{NONE} --constructor
	make
		do
			create error_ste.make_from_string ("")
			create second.make_empty
			create eight.make_empty
			create abort.make_empty
			create exp_death_msg.make_empty
		end

feature -- attributes
	m_model_access : ETF_MODEL_ACCESS

	model : ETF_MODEL
		attribute
				Result:= m_model_access.m
			end

	error_ste: STRING -- ok or error
	all_msg : ALL_MSG
	shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end

feature -- helper
	exp_death_msg : STRING

feature -- lines
	second : STRING
	eight : STRING

	abort : STRING

feature -- reset

	reset_all
		local
			none : STRING
		do
			create none.make_empty
			set_second (none)

		end

feature --quires

	first : STRING
		-- state
	do
		create result.make_empty
		result.append ("state:" + model.i.out + "." + model.e.out + ", ")

		if not model.in_game and model.face_error then
			result.append("error")
		elseif (not model.in_game) then
--			io.put_string ("lllllllll")
			result.append("ok")
		end

		if model.in_game then
			if model.play_on then
				result.append("mode:play, ")
			end
			if model.test_on then
				result.append("mode:test, ")
			end
			if not model.face_error then
				result.append("ok")
			else
				result.append("error")
			end
		end
		result.append ("%N")

	end

	set_second (str : STRING)
		-- death message or command_specific message
	do
		second := str
	end

	append_second(str : STRING)
	do
		second.append (str)
	end

	third : STRING -- MOVEMENT
		local
			ent : NON_STATIONARY
			temp_des : ARRAY[NON_STATIONARY]
		DO
			--exp
			create Result.make_empty
			create temp_des.make_empty
--			result.append ("%N")
			if
				shared_info.move_this_turn.is_empty
			then
				Result.append("  Movement:none")
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
						--- if destory -- if reproduce
						--- across  desrory_this_turn
						if attached{EBMJ_COMMON}ent as ebmj then
							if shared_info.reproduce_this_turn.has (ebmj) then
								if attached shared_info.reproduce_this_turn[ebmj]as r then
									result.append("%N      reproduced "+ r.id_out + " at " + r.cur_location_out )
								end
							end
						end
						 --if destory
						if shared_info.destory_this_turn.has_destructor (ent)then
							temp_des := shared_info.destory_this_turn.return_destoryed (ent)
							if ent.is_malevolent then
								result.append("%N      attacked " + temp_des[1].id_out +  " at " + temp_des[1].cur_location_out)
							else
								across
									temp_des is destoryed
								loop
									result.append("%N      destroyed " + destoryed.id_out +  " at " + destoryed.cur_location_out )
								end
							end

						end


					if
						i < shared_info.move_this_turn.count
					then
						Result.append("%N")
					end
				end
--				Result.append ("%N")
			end
		end

	fourth : STRING
		--SECTOR
		local
			row : INTEGER
			col: INTEGER
			temp : SECTOR
		DO
			create Result.make_empty
			Result.append ("%N  Sectors:%N")
				-------------------OUTPUT SECTORS ---------------------
			from
				row := 1
			until
				row > shared_info.number_rows
			loop
				from
					col:= 1
				until
					col> shared_info.number_columns
				loop
					temp := shared_info.galaxy.get_sector ([row,col])
					Result.append ("    [" + temp.print_sector + "]->" + temp.print_quadrant ) --temp.out_sorted_entity+temp.out_movable_list)
					Result.append ("%N")
					col:= col+ 1;
				end
				row := row + 1
			end
		end

	fifth : STRING
		-- DESCRIPTION
		local
			i : INTEGER
			B: ENTITY_ALPHABET
			Y: ENTITY_ALPHABET
			temp : LINKED_LIST[STATIONARY]
			temp2 : LINKED_LIST[NON_STATIONARY]
		do
			create B.make ('*')
			create Y.make ('Y')
			create result.make_empty
			Result.append ("  Descriptions:%N")
			if attached shared_info.galaxy as g_a then
				temp := g_a.stationary_stars_sorted.deep_twin
				from
					i := temp.count
				until
					i < 1
				loop
					Result.append ("    " + temp[i].id_out + "->")
					if attached{STAR}temp[i] as star then
						Result.append ("Luminosity:" + star.luminosity.out)
					end
					Result.append ("%N")
					i := i - 1
				end
				--- movable list
				temp2 := g_a.movable_sorted
				across
					1 |..| temp2.count is s
				loop
					result.append("    " + temp2[s].id_out+"->")
					if attached{EXPLORER}temp2[s] as e then
						result.append(e.current_status )
					elseif attached{BENIGN}temp2[s]as be then
						result.append (be.current_status )
					elseif attached{MALEVOLENT}temp2[s] as ma then
						result.append (ma.current_status)
					elseif attached{JANITAUR}temp2[s]as j then
						result.append (j.current_status)
					elseif attached{ASTEROID}temp2[s] as a then
						result.append(a.current_status)
					elseif attached{PLANET}temp2[s] as p then
						result.append(p.current_status)
					end
					if
						i < temp2.count
					then
						Result.append("%N")
					end
				end
			end
		end

	sixth : STRING --DEATH
		require
			all_dead : across shared_info.dead_this_turn.deep_twin is ent all ent.dead end
		local
			temp : LINKED_LIST[NON_STATIONARY]
		do
			create Result.make_empty
			temp := shared_info.dead_this_turn.deep_twin
			if
				temp.is_empty
			then
				Result.append("  Deaths This Turn:none")
			else
				Result.append("  Deaths This Turn:%N")
				across
					1 |..| temp.count is i
				loop
					Result.append("    " + temp[i].id_out+"->")
					result.append (temp[i].current_status+","+"%N")
					if temp[i].devoured then
						result.append (black_hole_common (temp[i]))
					else
						if attached{EBMJ_COMMON}temp[i] as ebmj then
							if ebmj.fuel = 0 then -- all
								--io.put_string ("sixth msg ebmj fuel:"+ebmj.id_out)
								result.append ("      " + ebmj.dmsg_out_of_fuel (ebmj))
								if ebmj.is_explorer then
									shared_info.set_exp_death_msg (ebmj.dmsg_out_of_fuel (ebmj))
								end
							elseif attached{EXPLORER}ebmj as e then -- exp
								if e.d_malevolent then
									result.append ("      " + e.dmsg_death_malevolent)
									shared_info.set_exp_death_msg(e.dmsg_death_malevolent)
								end
								if e.d_asteroid then
									result.append ("      " + temp[i].dmsg_reason (temp[i]))
									shared_info.set_exp_death_msg ( temp[i].dmsg_reason (temp[i]))
								end

							else -- other ebmj
								result.append ("      " + temp[i].dmsg_reason (temp[i]))
							end
						else -- a & p
							result.append ("      " + temp[i].dmsg_reason (temp[i]))
						end
					end

					if
						i < temp.count
					then
						result.append("%N")
					end
				end -- loop
			end
		end

	seventh : STRING --pic
	do
		create Result.make_empty
		if attached shared_info.galaxy as g_a then
			Result.append ( g_a.out)
		end
	end

	set_eight(str : STRING)
		-- ONLY TEST MODE --ONLY WHEN EXP DIES
	do
		eight := str
	end

feature -- death msg helper
	black_hole_common(ent : NON_STATIONARY) : STRING
		-- death message due to black_hole
		do
			create result.make_empty
			if ent.devoured then
				result.append ("      " + ent.dmsg_to_blackhole (ent))
			end
			if ent.is_explorer and ent.devoured then
				shared_info.set_exp_death_msg (ent.dmsg_to_blackhole (ent))
			end
		end

end
