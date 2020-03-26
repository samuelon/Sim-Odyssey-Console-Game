note
	description: "Summary description for {PLANET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLANET

inherit
	NON_STATIONARY


create
	make

feature  -- Initialization

	make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER )
			-- Initialization for `Current'.
		do
			id := idv
			is_attached := FALSE
			is_support_life := FALSE
			is_visited := FALSE
			name := "Planet"
			create en.make ('P') --letter
		--	sector := a_sector
			row := a_row
			col := a_col
			turns_left := 0
			create old_pos.make
			create current_pos.make
			dead := false
--			create death_message.make_empty
			create quad.default_create
			landed_on := false
			set_location (row, col, get_sector.return_quad (current))
			old_pos := current_pos.deep_twin
--			set_location (row, col,current.get_sector.return_quad (current))
			use_wormhole := false
			devoured := false
			check_supp_life_already := false

--			set_location(0,0,0)


		end

feature -- queries
	check_supp_life_already : BOOLEAN
	landed_on : BOOLEAN
	is_attached :BOOLEAN
	is_support_life : BOOLEAN
	is_visited: BOOLEAN
--	turns_left : INTEGER
--	dead : BOOLEAN

feature --modifiers
	set_true_check_supp_life_already
		do
			check_supp_life_already := true
		end

	set_true_is_attached
		do
			is_attached := true
		end

	set_true_is_support_life
		do
			is_support_life := true
		end

	set_landed_on_true
		do
			landed_on := true
		end

	set_visited_true
		do
			is_visited := true
		end
feature -- Access

	out_is_attached :STRING
		do
			if is_attached then
				Result := "T"
			else
				Result := "F"
			end
		end
	out_is_support_life : STRING
		do
			if is_support_life then
				Result := "T"
			else
				Result := "F"
			end
		end
	out_is_visited: STRING
		do
			if is_visited then
				Result := "T"
			else
				Result := "F"
			end
		end

feature -- death msg
	dmsg_death_to_blackhole:STRING
		do
			Result := ("Planet got devourded by blackhole (id: -1) at Sector:3:3"+ "%N")
		end
end
