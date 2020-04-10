note
	description: "Summary description for {EXPLORER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPLORER

inherit
	EBMJ_COMMON


create
	make

feature  -- Initialization
		life : INTEGER
		landed : BOOLEAN
		face_error : BOOLEAN
		d_malevolent : BOOLEAN
		wins : BOOLEAN --land_on_planet_support_life

	make(idv :INTEGER;a_row : INTEGER ; a_col : INTEGER) --how do we make the sector while referring to itself.
			-- Initialization for `Current'.
		do
			id := idv
			fuel := 3
			life := 3
			landed := FALSE
			dead := false
			wins := FALSE
			d_malevolent := FALSE
			create en.make ('E') --letter
			row := a_row
			col := a_col
			max_fuel := 3
			--create sector.make_dummy
--			create death_message.make_empty
			face_error := false
			--take from the created message file
			create old_pos.make
			create current_pos.make
			set_location (1,1,1)
			old_pos :=  current_pos.deep_twin
			use_wormhole := false
			devoured := false
			name := "Explorer"
			s_name := "explorer"
		end
feature -- modifiers
	set_wins
	do
		wins := true
	end

	set_d_malevolent
	do
		d_malevolent := true
	end

	set_life( i : INTEGER)
		do
			life := i
		end
	set_face_error
	do
		face_error := true
	end
	set_true_landed
		do
			landed := true
		end
	set_false_landed
		do
			landed := false
		end
	get_life_out : STRING
		do
			Result := life.out
		end
	get_fuel_out : STRING
		do
			Result := fuel.out
		end
	dec_life
		do
			life := life -1
		end

feature
	return_landed : STRING
	do
		if
			landed
		then
			Result := "T"
		else
			Result := "F"
		end

	end

feature --message

	dmsg_death_malevolent : STRING
	do
		result := "Explorer got lost in space - out of life support at Sector:" +  current.get_sector.print_sector_spec
	end

	current_status : STRING
		DO
			result := fuel_str + "life:"+life.out+"/3, " +"landed?:" + return_landed
		end




end
