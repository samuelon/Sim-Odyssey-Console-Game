note
	description: "Summary description for {BENIGN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BENIGN

inherit
	EBMJ_COMMON

create
	make

feature
	make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER )
	do
		create en.make('B')
		id := idv
		row := a_row
		col := a_col
		name := "Benign"
		turns_left := 0
		dead := false
		create old_pos.make
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		old_pos := current_pos.deep_twin
		max_fuel := 3
		fuel := max_fuel
		use_wormhole := false
		devoured := false

	end



end
