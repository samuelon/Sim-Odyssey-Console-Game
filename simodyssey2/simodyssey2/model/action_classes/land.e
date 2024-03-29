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
		temp : LINKED_LIST[ENTITY]
		has_life : BOOLEAN
		p_num : INTEGER
		not_attached_n : INTEGER
	do
		sec := shared_info.og_exp.get_sector
		temp := sec.return_sorted_ent
		found := false
		has_life := false
		p_num := 0
		not_attached_n := 0
		if
			sec.has_planet and sec.has_yellow_dwarf
		then
			from
				i := 1
			until
				i > temp.count or found
			loop
				if temp[i].is_planet then
					if attached{PLANET}temp[i] as p then
						p_num := p_num + 1
						if p.is_attached then
--							io.put_string ("p attached")
							if not p.is_visited then
								shared_info.og_exp.set_true_landed
								p.set_visited_true
								--io.put_string (p.id_out+"visited")
								found := true
								if p.is_support_life then
									---??????
--										---game ends movables will not act
									has_life := true
									shared_info.og_exp.set_wins
								end
							end
						else
							not_attached_n := not_attached_n + 1
						end
					end
				end
				i := i+1
			end
--		
		end -- if sec

---msg

--		if not_attached_n = p_num then -- outside
--			model.main_msg.set_second (model.all_msg.error_land_no_visited_planet)
--			model.set_face_error_t
		if not has_life then
			model.main_msg.set_second (model.all_msg.land_no_life_found)
			model.set_command_specific_on
		end

	end--do

end
