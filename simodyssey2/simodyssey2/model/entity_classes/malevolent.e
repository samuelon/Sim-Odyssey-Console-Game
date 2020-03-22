note
	description: "Summary description for {MALEVOLENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MALEVOLENT

inherit

	 	EBMJ_COMMON

create
	make

feature
make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER )
	do
		create en.make('M')
		id := idv
		row := a_row
		col := a_col
		turns_left := 0
		dead := false
		create old_pos.make
		set_old_location (-1, -1, -1)
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		max_fuel := 3
		fuel := max_fuel
		use_wormhole := false
		devoured := false
	end

end
