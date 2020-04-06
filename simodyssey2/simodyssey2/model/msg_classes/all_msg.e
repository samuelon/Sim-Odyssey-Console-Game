note
	description: "Summary description for {ALL_MSG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	ALL_MSG

feature --attributes
shared_info_access: SHARED_INFORMATION_ACCESS

state_memory: SHARED_INFORMATION
	attribute
			Result := shared_info_access.shared_info
		end

feature -- welcom

welcome : STRING
	DO
		Result := "  state:0.0, ok%N  Welcome! Try test(3,5,7,15,30)"
	end


feature --command_msgs
--first line stuff
	status_not_landed : STRING
		--tracks explorer
		do
			create Result.make_empty
			Result.append ("  Explorer status report:Travelling at cruise speed at" + state_memory.og_exp.cur_location_out+"%N")
			Result.append ("  Life units left:"+ state_memory.og_exp.get_life_out + ", Fuel units left:" + state_memory.og_exp.get_fuel_out )
		end
	status_landed : STRING
		do
			create Result.make_empty
			Result.append("  Explorer status report:Stationary on planet surface at " + state_memory.og_exp.cur_location_out+"%N")
			Result.append (" Life units left:"+ state_memory.og_exp.get_life_out + ", Fuel units left:" + state_memory.og_exp.get_fuel_out)
		end

	land_life_found : STRING
		do
			Result := ("  Tranquility base here - we've got a life!")
		end
	land_no_life_found : STRING
		do
			Result := ("  Explorer found no life as we know it at Sector:"+state_memory.og_exp.get_sector.print_sector_spec)
		end

	lift_off : STRING
		do
			Result := ("  Explorer has lifted off from planet at Sector:"+state_memory.og_exp.get_sector.print_sector_spec)
		end

	abort_in_game : STRING
		do
			Result := ("  Mission aborted. Try test(3,5,7,15,30)" )
		end
	game_is_over : STRING
		do
			Result := ("  The game has ended. You can start a new game.")
		end


feature -- Error Messages

	error_not_in_mission :STRING
		do
			Result := ("  Negative on that request:no mission in progress.")
		end


	error_land_already_land: STRING --land wormhole
		do
		 Result := ("  Negative on that request:already landed on a planet at Sector:"+state_memory.og_exp.get_sector.print_sector_spec)
		end

	error_land_no_yellow_dwarf:STRING
		do Result := ("  Negative on that request:no yellow dwarf at Sector:"+state_memory.og_exp.get_sector.print_sector_spec) end

	error_land_no_planet: STRING
		do Result:= ("  Negative on that request:no planet at Sector:"+state_memory.og_exp.get_sector.print_sector_spec) end

	error_land_no_visited_planet:STRING
		 do Result := ("  Negative on that request:no visited planet at Sector:"+state_memory.og_exp.get_sector.print_sector_spec) end


	error_liftoff_not_on_a_planet : STRING
		do
			Result := ("  Negative on that request:you are not on a planet at Sector:"+state_memory.og_exp.get_sector.print_sector_spec)
		end

	error_move_landed : STRING
		do
			Result := ("  Negative on that request: you are currently landed at Sector:" +state_memory.og_exp.get_sector.print_sector_spec)
		end
	error_move_full : STRING
		do
			Result := ("  Cannot transfer to new location as it is full." )
		end
	error_mode_in_game : STRING --play -test
		do
			Result := ("  To start a new mission, please abort the current one first.")
		end

	error_test : STRING
		DO
			RESULT := "  Thresholds should be non-decreasing order."
		end

	error_wormhole_landed : STRING
		do
			Result := ("  Negative on that request: you are currently landed at Sector:" +state_memory.og_exp.get_sector.print_sector_spec)
		end

	error_wormhole_not_find : STRING
		--call wormhole when not wormhole
		do
			Result := ("  Explorer couldn't find wormhole at Sector:"+state_memory.og_exp.get_sector.print_sector_spec)
		end


end
