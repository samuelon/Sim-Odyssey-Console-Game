note
	description: "Summary description for {ACT_WORMHOLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACT_WORMHOLE

inherit
	ACTION

create
	make

feature{NONE} -- constructor
	make
	do
		create act_name.make ("wormhole")
		invalid := false
	end

feature
	wormhole(ent : NON_STATIONARY)
	local
		added : BOOLEAN
		gen : RANDOM_GENERATOR_ACCESS
		temp_row : INTEGER
		temp_col : INTEGER
		g : GALAXY
		name : ACTION_NAME
	do

		g := shared_info.galaxy
		--check wormhole
		if
			ent.get_sector.has_wormhole
		then
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
					io.put_string (ent.id_out +"want to use wormhole"+ "("+temp_row.out + "," + temp_col.out+")")
					if (not g.get_sector ([temp_row,temp_col]).is_full) then
						g.place_ent ([ent.row,ent.col],[temp_row,temp_col], ent)
						shared_info.add_move_this_turn (ent)
						added := true
						ent.set_use_wormhole
						io.put_string (ent.id_out+"use wormhole successully" + ent.old_location_out+ent.cur_location_out)
					end
				end
			end
		end

	end

end

