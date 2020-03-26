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
		name := "Asteroid"
		dead := false
		create old_pos.make
		create current_pos.make
		set_location (row, col, get_sector.return_quad (current))
		old_pos := current_pos.deep_twin
		use_wormhole := false
		devoured := false
	end

feature --dmsg
	dmsg_janitaur:STRING
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
		Result :="Asteroid got imploded by janitaur" + "(" + ide.out +")" + " at " + "Sector:" + current.get_sector.print_sector

	end

end
