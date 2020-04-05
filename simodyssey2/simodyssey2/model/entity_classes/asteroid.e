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
		create en.make('A')
		id := idv
		row := a_row
		col := a_col
		turns_left := 0
		name := "Asteroid"
		s_name := "asteroid"
		dead := false
		create old_pos.make
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		old_pos := current_pos.deep_twin
		use_wormhole := false
		devoured := false
		d_janitaur := false
	end

FEATURE
	d_janitaur : BOOLEAN

	set_d_janitaur
		do
			d_janitaur := true
		end

feature --msg
	dmsg_janitaur:STRING -- need change
		local
		ide : INTEGER
	do
		across
			current.get_sector.entity_quad is entity
		loop
			if
				entity.is_janitaur
			then
				ide := entity.id
			end
		end
		Result :="Asteroid got imploded by janitaur" + "(id:" + ide.out +")" + " at " + "Sector:" + current.get_sector.print_sector_spec
	end

	current_status:STRING
		do
			result := turns_left_str
		end

end
