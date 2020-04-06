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

			model.pass
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
			if
					model.end_game
				then
					model.set_in_game_false
				end

    	end

end
