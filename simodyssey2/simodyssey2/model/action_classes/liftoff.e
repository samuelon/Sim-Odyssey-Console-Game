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
	end

end
