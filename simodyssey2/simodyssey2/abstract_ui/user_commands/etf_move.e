note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE
inherit
	ETF_MOVE_INTERFACE
create
	make
feature -- command
	move(dir: INTEGER_32)
		require else
			move_precond(dir)
    	do
			-- perform some update on the model state
			if model.end_game then
				model.set_in_game_false
				model.off_end_game
				model.move (dir)
			else
				model.move(dir)
			end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
