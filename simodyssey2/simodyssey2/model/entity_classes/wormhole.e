note
	description: "Summary description for {WORMHOLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WORMHOLE

inherit
	STATIONARY

create
	make

feature {NONE} -- Initialization

	make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER)
			-- Initialization for `Current'.
		do
			id := idv
			create en.make ('W') --letter
			row := a_row
			col := a_col
			--create sector.make_dummy
		--	sector := a_sector
		end

feature --queries

end
