note
	description: "Summary description for {EBMJ_COMMON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	EBMJ_COMMON

inherit
	NON_STATIONARY

feature
	fuel : INTEGER
	max_fuel : INTEGER

	actions_left_until_reproduction: INTEGER
	reproduction_interval : INTEGER
feature -- function
	lose_fuel
	do
		fuel := fuel -1 -- need to check?
--		ensure
--			fuel_vaild : fuel >= 0
		--
	end

	set_fuel(i : INTEGER)
		do
			fuel := i
		end

	is_e_b_m : BOOLEAN
	local
		e : ENTITY_ALPHABET
		b : ENTITY_ALPHABET
		m : ENTITY_ALPHABET
	do
		create b.make ('B')
		create m.make ('M')
		create e.make ('E')
		if
			en.is_equal (b) or en.is_equal (m) or en.is_equal (e)
		then
			Result := true
		end
	end

	set_actions_left_until_reproduction(i : INTEGER)
	do
		actions_left_until_reproduction := i
	end

	dec_actions_left_until_reproduction
	do
		actions_left_until_reproduction := actions_left_until_reproduction - 1
		ensure
			act_left_until_reproduction_valid : actions_left_until_reproduction >= 0
	end

feature -- death msg common
	dmsg_asteroid(ent : EBMJ_COMMON) : STRING
	local
		ide : INTEGER
	do
		across
			ent.get_sector.entity_quad is entity
		loop
			if
				entity.is_asteroid
			then
				ide := entity.id
			end
		end
		Result := ent.name + " got destroyed by asteroid " + "(" + ide.out +")" + " at " + "Sector:" + ent.get_sector.print_sector

	end

	--dmsg out of fuel
	dmsg_out_of_fuel(ent : EBMJ_COMMON) :STRING
		do
			Result := ent.name + " got lost in space - out of fuel at Sector:"+ current.get_sector.print_sector
		end




end
