note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_LAND
inherit
	ETF_LAND_INTERFACE
create
	make
feature -- command
	land
    	do
			-- perform some update on the model state
			if model.end_game then
				model.set_in_game_false
				model.off_end_game
				model.land
			else
				model.reset_action_routine
				model.land
			end

			model.default_update

			etf_cmd_container.on_change.notify ([Current])
    	end

end
