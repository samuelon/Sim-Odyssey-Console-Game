note
	description: "Summary description for {MOVE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE

inherit
	ACTION

create
	make

feature{NONE} -- constructor
	make
	do
		create act_name.make ("move")
		invalid := false
	end

feature-- function
	move_routine(dir : INTEGER ; ent : NON_STATIONARY)
	local
			dir_coord: TUPLE [row: INTEGER; col: INTEGER]
			suppose_coord: TUPLE [row: INTEGER; col: INTEGER]
			g : GALAXY
			du : DIRECTION_UTILITY
		do
			g := shared_info.galaxy
			shared_info.add_move_this_turn (ent)
			ent.set_old_location (ent.row,ent.col, ent.current_pos.at (3))
			dir_coord := du.num_dir (dir)
			suppose_coord := [(ent.row + dir_coord.row), (ent.col + dir_coord.col)]
			if suppose_coord.row = 6 then
				suppose_coord.row := 1
			end
			if suppose_coord.row = 0 then
				suppose_coord.row := 5
			end
			if suppose_coord.col = 6 then
				suppose_coord.col := 1
			end
			if suppose_coord.col = 0 then
				suppose_coord.col := 5
			end
--			if not grid [suppose_coord.row, suppose_coord.col].is_full then
			if not  g.get_sector ([suppose_coord.row,suppose_coord.col]).is_full then
				g.place_ent ([ent.row,ent.col],[suppose_coord.row,suppose_coord.col], ent)

			end

		end


end
