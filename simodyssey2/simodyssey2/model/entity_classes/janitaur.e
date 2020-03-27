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
		name:="Janitaur"
		turns_left := 0
		dead := false
		reproduction_interval := 2
		actions_left_until_reproduction:=2
		create old_pos.make
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		old_pos := current_pos.deep_twin
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

feature --str
	current_status : STRING
	do
		Result := fuel_str+"load:"+ load.out + "/" + max_load.out +", " + actions_left_until_reproduction_str +", " + turns_left_str
	end

end
