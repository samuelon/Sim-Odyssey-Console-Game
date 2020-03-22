note
	description: "Summary description for {ASTEROID}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ASTEROID

inherit
	NON_STATIONARY

create
	make

feature
	make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER )
	do
		create en.make('B')
		id := idv
		row := a_row
		col := a_col
		turns_left := 0
		dead := false
		create old_pos.make
		set_old_location (-1, -1, -1)
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		use_wormhole := false
		devoured := false
	end

end
