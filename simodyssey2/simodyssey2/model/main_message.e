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
			create abort.make_empty
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

feature -- lines
	second : STRING
--	eighth :
	abort : STRING


feature --quires
	first : STRING
	do
		create result.make_empty
		result.append ("  state:" + model.i.out + "." + model.e.out + ", ")
		---others
		if not model.in_game and model.face_error then
			result.append("error")
		elseif (not model.in_game) then

			result.append("ok")
		end


		if model.in_game then
			if model.play_on then
				result.append("model:play, ")
			end
			if model.test_on then
				result.append("model:test, ")
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
	do
		second := str
	end

	third : STRING -- MOVEMENT
		local
			ent : NON_STATIONARY
		DO
			--exp
			create Result.make_empty
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
						--- if destory
						--- across  desrory_this_turn
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

	fourth : STRING --SECTOR
		local
			row : INTEGER
			col: INTEGER
			temp : SECTOR
		DO
			create Result.make_empty
			Result.append ("  Sectors:%N")
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
					Result.append ("    [" + temp.print_sector + "]->" + temp.print_quadrant + temp.out_sorted_entity)
					Result.append ("%N")
					col:= col+ 1;
				end
				row := row + 1
			end
		end

	fifth : STRING -- DESCRIPTION
		local
			i : INTEGER
			B: ENTITY_ALPHABET
			Y: ENTITY_ALPHABET
			temp : LINKED_LIST[STATIONARY]
			temp2 : ARRAY[NON_STATIONARY]
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
				temp2 := g_a.movable_sorted.deep_twin
				across
					1 |..| temp2.count is s
				loop
					result.append("    " + temp2[s].id_out+"->")
					if attached{EXPLORER}temp2[s] as e then
						result.append(e.current_status)
					elseif attached{BENIGN}temp2[s]as be then
						result.append (be.current_status)
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
		local
			temp : LINKED_LIST[NON_STATIONARY]
		do
			create Result.make_empty
			temp := shared_info.dead_this_turn.deep_twin
			if
				temp.is_empty
			then
				Result.append("  Deaths This Turn:none ")
			else
				Result.append("  Deaths This Turn:%N")
				across
					1 |..| temp.count is i
				loop
					Result.append(temp[i].id_out+"->")
					if attached{EXPLORER}temp[i]as e then
						result.append(e.current_status+",")
						--add reason
					elseif attached{BENIGN}temp[i] as be then
						result.append (be.current_status+",")
						--add reason
					elseif attached{MALEVOLENT}temp[i] as ma then
						result.append (ma.current_status+",")
						--add reason
					elseif attached{JANITAUR}temp[i] as j then
						result.append (j.current_status+",")
						--add reason
					elseif attached{ASTEROID}temp[i] as a then
						result.append(a.current_status+",")
						--add reason
					elseif attached{PLANET}temp[i] as p then
						result.append(p.current_status+",")
						--add reason
					end
					if
						i < temp.count
					then
						result.append("%N")
					end
				end
			end
		end

	seventh : STRING --pic
	do
		create Result.make_empty
		if attached shared_info.galaxy as g_a then
			Result.append ( g_a.out)
		end
	end

	eighth : STRING -- ONLY TEST MODE --ONLY WHEN EXP DIES
	do
		create result.make_empty
		--same as second
		result.append(second)
		result.append(all_msg.game_is_over)
	end


end
