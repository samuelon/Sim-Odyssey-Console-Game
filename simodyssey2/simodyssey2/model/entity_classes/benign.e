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
		s_name := "benign"
		turns_left := 0
		dead := false
		reproduction_interval := 1
		actions_left_until_reproduction:=1
		create old_pos.make
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		old_pos := current_pos.deep_twin
		max_fuel := 3
		fuel := max_fuel
		use_wormhole := false
		devoured := false

	end

	current_status : STRING
	do
		Result := fuel_str + actions_left_until_reproduction_str +", " + turns_left_str
	end



end
