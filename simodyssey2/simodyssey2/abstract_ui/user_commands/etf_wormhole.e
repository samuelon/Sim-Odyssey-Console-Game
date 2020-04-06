note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_WORMHOLE
inherit
	ETF_WORMHOLE_INTERFACE
create
	make
feature -- command
	wormhole
    	do
			-- perform some update on the model state

			model.wormhole
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
			if
				model.end_game
			then
				model.set_in_game_false
				model.reset
			end
    	end

end
