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

feature --quires
	first : STRING
	do
		create result.make_empty
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
				Result.append("  Movement:none%N")
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

					if
						i < shared_info.move_this_turn.count
					then
						Result.append("%N")
					end
				end
				Result.append ("%N")
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
				
			end

		end

	pic : STRING
	do
		create Result.make_empty
		if attached shared_info.galaxy as g_a then
			Result.append ( g_a.out)
		end
	end



end
