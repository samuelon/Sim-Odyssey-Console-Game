note
	description: "Summary description for {LAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

 class
	LAND

inherit
	ACTION

create
	make

feature{NONE} -- constructor
	make
	do
		create act_name.make ("land")
		invalid := false
	end


feature -- action
	land
	local
		sec : SECTOR
		i : INTEGER
		found : BOOLEAN
		temp : ARRAY[ENTITY]
		has_life : BOOLEAN
	do
		sec := shared_info.og_exp.get_sector
		temp := sec.return_sorted_ent.deep_twin
		found := false
		has_life := false
		if
			sec.has_planet and sec.has_yellow_dwarf
		then
			from
				i := 1
			until
				i > temp.count or found
			loop
				if temp[i].is_planet then
					io.put_string ("is_planet")
					if attached{PLANET}temp[i] as p then
						io.put_string ("cast planet")
						if p.is_attached then
							io.put_string ("p attached")
							if not p.is_visited then
								io.put_string ("p vsited")
								shared_info.og_exp.set_true_landed
								p.set_visited_true
								found := true
								if p.is_support_life then
									---??????
--										---game ends movables will not act
									has_life := true
									shared_info.og_exp.set_wins
									model.set_command_specific_on
									model.main_msg.set_second (model.all_msg.land_life_found)
									model.set_in_game_false
--								else
									--model.command_specefic_on
--									model.main_msg.set_second (model.all_msg.land_no_life_found)
								end
							end
						end
					end
				end
				i := i+1
			end
--		
		end -- if sec

---msg
		if not found then
			model.main_msg.set_second (model.all_msg.error_land_no_visited_planet)
			model.set_face_error_t
		end

		if not has_life then
			model.main_msg.set_second (model.all_msg.land_no_life_found)
			model.set_command_specific_on
		end

	end--do

end
