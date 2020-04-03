note
	description: "Summary description for {PASS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PASS

inherit
	ACTION

create
	make

feature{NONE} -- constructor
	make
	do
		create act_name.make ("pass")
		invalid := false
	end

end
