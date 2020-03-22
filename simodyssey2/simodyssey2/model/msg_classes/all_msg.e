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
		Result := "state 0.0,ok %N  Welcome! Try test(30)"
	end

feature --extra
	game_end_start_new : STRING
		do
			Result := ("The game has ended. You can start a new game.")
		end

feature --command_msgs
--first line stuff
	status_not_landed : STRING
		--tracks explorer
		do
			create Result.make_empty
			Result.append ("Explorer status report : Travelling at cruise speed at" + state_memory.og_exp.cur_location_out + "%N")
			Result.append ("Life units left:"+ state_memory.og_exp.get_life_out + ", Fuel units left:" + state_memory.og_exp.get_fuel_out + "%N")
		end
	status_landed : STRING
		do
			create Result.make_empty
			Result.append("Explorer status report : Stationary on planet surface at " + state_memory.og_exp.cur_location_out)
			Result.append ("Life units left:"+ state_memory.og_exp.get_life_out + ", Fuel units left:" + state_memory.og_exp.get_fuel_out+ "%N")
		end

	land_life_found : STRING
		do
			Result := ("Tranquility base here - we've got a life!"+ "%N")
		end
	land_no_life_found : STRING
		do
			Result := ("Explorer found no life as we know it at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end
	lift_off : STRING
		do
			Result := ("Explorer has lifted off from planet at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end

	abort_in_game : STRING
		do
			Result := ("Mission aborted. Try test(30)"+ "%N")
		end
	abort_out_of_game : STRING
		do
			Result := ("The game has ended. You can start a new game."+ "%N")
		end

feature -- Death Messages
--exp deaths

	exp_out_of_fuel :STRING
		do
			Result := ("Explorer got lost in space - out of fuel at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end
	exp_death_to_blackhole:STRING
		do
			--blackhole isnt allowed to be wrong
			Result := ("Explorer got devoured by blackhole (id: -1) at Sector:3:3"+ "%N")
		end
	planet_death_to_blackhole:STRING
		do
			Result := ("Planet got devourded by blackhole (id: -1) at Sector:3:3"+ "%N")
		end
feature -- Error Messages

	error_not_in_mission :STRING
		do
			Result := ("  Negative on that request:no mission in progress.")
		end

	error_abort_1 : STRING
		do
			--create Result.make_from_string( error_not_in_mission)
			Result := error_not_in_mission
		end
	error_land_1: STRING
		do
			Result := error_not_in_mission
		end

	error_land_wormhole: STRING --land wormhole
		do
		 Result := ("Negative on that request:already landed on a planet at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end

	error_land_no_yellow_dwarf:STRING
		do Result := ("Negative on that request:no yellow dwarf at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N") end

	error_land_no_planet: STRING
		do Result:= ("Negative on that request:no planet at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N") end

	error_land_no_visited_planet:STRING
		 do Result := ("Negative on that request:no visited planet at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N") end

	error_liftoff_1 : STRING
		do
			Result := error_not_in_mission
		end
	error_liftoff_not_on_a_planet : STRING
		do
			Result := ("Negative on that request:you are not on a planet at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end
	error_move_1 : STRING
		do
			Result := error_not_in_mission
		end
	error_move_landed : STRING
		do
			Result := ("Negative on that request: you are currently landed at Sector:" +state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end
	error_move_full : STRING
		do
			Result := ("Cannot transfer new location as it is full." + "%N")
		end
	error_pass_1 : STRING
		do
			Result := error_not_in_mission
		end

	error_status_no_mission : STRING
		do
			Result := ("Negative on that request: no mission in progress."+ "%N")
		end
	error_mode_in_game : STRING
		do
			Result := ("To start a new mission, please abort the current one first."+ "%N")
		end
	error_wormhole_1 : STRING
		do
			Result := error_not_in_mission
		end
	error_wormhole_landed : STRING
		do
			Result := ("Negative on that request: you are currently landed at Sector:" +state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end
	error_wormhole_not_find : STRING
		--call wormhole when not wormhole
		do
			Result := ("Explorer couldn't find wormhole at Sector:"+state_memory.og_exp.row.out + ":" + state_memory.og_exp.col.out+ "%N")
		end


end
