note
	description: "Summary description for {JANITAUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JANITAUR

inherit

	EBMJ_COMMON
create
	make

feature --local
	load : INTEGER
	max_load : INTEGER

feature
	make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER )
	do
		create en.make('J')
		id := idv
		row := a_row
		col := a_col
		turns_left := 0
		dead := false
		create old_pos.make
		set_old_location (-1, -1, -1)
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		max_fuel := 5
		fuel := max_fuel
		use_wormhole := false
		devoured := false
		load := 0
		max_load := 2
	end

feature
	add_load
	do
		load := load + 1
		ensure
			valid : load <= 2
	end

	set_load(i : INTEGER)
	do
		load := i
	end

end
