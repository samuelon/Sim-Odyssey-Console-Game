note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ABORT
inherit
	ETF_ABORT_INTERFACE
create
	make
feature -- command
	abort
    	do
			-- perform some update on the model state
			model.abort


			model.default_status_update

			etf_cmd_container.on_change.notify ([Current])
    	end

end
