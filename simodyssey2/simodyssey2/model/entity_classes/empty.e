note
	description: "Summary description for {EMPTY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EMPTY

inherit
	ENTITY

create
	make

feature
	make
		do
			create en.make ('-')
			id := -10000000
		end

end
