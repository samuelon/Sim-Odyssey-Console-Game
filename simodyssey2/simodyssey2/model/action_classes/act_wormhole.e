note
	description: "Summary description for {ACT_WORMHOLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	ACT_WORMHOLE

inherit
	ACTION

feature
	wormhole(ent : NON_STATIONARY)
	local
		added : BOOLEAN
		gen : RANDOM_GENERATOR_ACCESS
		temp_row : INTEGER
		temp_col : INTEGER
		g : GALAXY
	do
		g := shared_info.galaxy
		if
			ent.is_explorer or ent.is_benign or ent.is_malevolent
		then
			from
				added := false
			until
				added
			loop
				temp_row := gen.rchoose (1,5)
				temp_col := gen.rchoose (1,5)
				if (not g.get_sector ([temp_row,temp_col]).is_full) then
					g.place_ent ([ent.row,ent.col],[temp_row,temp_col], ent)
					shared_info.add_move_this_turn (ent)
					added := true
					ent.set_use_wormhole
				end
			end
		end
	end

end

