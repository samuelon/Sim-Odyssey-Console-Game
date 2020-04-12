note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_LIFTOFF
inherit
	ETF_LIFTOFF_INTERFACE
create
	make
feature -- command
	liftoff
    	do
			-- perform some update on the model state

			-- IF NO ERRORS RUN THIS
			if model.end_game then
				model.set_in_game_false
				model.off_end_game
				model.liftoff
			else
				model.reset_action_routine
				model.liftoff
			end

			model.default_update
			etf_cmd_container.on_change.notify ([Current])

    	end

end
