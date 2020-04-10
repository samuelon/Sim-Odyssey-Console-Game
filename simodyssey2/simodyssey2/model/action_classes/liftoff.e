note
	description: "Summary description for {LIFTOFF}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LIFTOFF

inherit
	ACTION

create
	make

feature{NONE} -- constructor
	make
	do
		create act_name.make ("liftoff")
		invalid := false
	end

feature
	liftoff
	require
		already_landed : shared_info.og_exp.landed
	do
		shared_info.og_exp.set_false_landed
		model.main_msg.set_second (model.all_msg.lift_off)
		model.set_command_specific_on
	end

end
