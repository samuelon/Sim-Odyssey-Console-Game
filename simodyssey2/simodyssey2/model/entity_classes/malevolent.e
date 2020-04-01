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
		name := "Malevolent"
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

feature -- death reason
	d_benign : BOOLEAN

feature -- helper
	set_d_benign
		do
			d_benign := true
		end

feature -- death msg
	dmsg_benign:STRING
		local
		ide : INTEGER
	do
		across
			current.get_sector.entity_quad is entity
		loop
			if
				entity.is_benign
			then
				ide := entity.id
			end
		end
		Result :="Malevolent got destroyed by benign" + "(" + ide.out +")" + " at " + "Sector:" + current.get_sector.print_sector

	end

	current_status : STRING
	do
		Result := fuel_str+ actions_left_until_reproduction_str +", " + turns_left_str
	end

end
