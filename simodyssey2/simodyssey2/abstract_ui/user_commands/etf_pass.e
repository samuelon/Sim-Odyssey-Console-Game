note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_PASS
inherit
	ETF_PASS_INTERFACE
create
	make
feature -- command
	pass
    	do
			-- perform some update on the model state
			if
				model.end_game
			then
				model.set_in_game_false
				model.off_end_game
				model.pass
			else
				model.pass
			end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
--			if
--				model.end_game
--			then
--				model.set_in_game_false
--			end

    	end

end
