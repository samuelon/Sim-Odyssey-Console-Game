note
	description: "Summary description for {BLACKHOLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BLACKHOLE

inherit
	STATIONARY

create
	make

feature {NONE} -- Initialization

	make(idv :INTEGER ; a_row : INTEGER ; a_col : INTEGER )
			-- Initialization for `Current'.
		do
			id := idv
			create  en.make ('O') --letter
			row := a_row
			col := a_col
			--sector := a_sector
			--create sector.make_dummy
		end

end
