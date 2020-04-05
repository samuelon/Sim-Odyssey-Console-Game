note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_PLAY
inherit
	ETF_PLAY_INTERFACE
create
	make
feature -- command
	play
    	do
			-- perform some update on the model state

			model.play
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
--			if
--				model.end_game
--			then
--				model.set_in_game_false
--			end
    	end

end
