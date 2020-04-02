note
	description: "Summary description for {YELLOW_DWARF}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YELLOW_DWARF

inherit
	STAR

create
	make

feature {GALAXY} -- Initialization

	make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER)
			-- Initialization for `Current'.
		do
			id := idv
			luminosity := 2
			create en.make ('Y') --letter
			row := a_row
			col := a_col
--			create sector.make_dummy
--			sector := a_sector
		end
feature --queries
end
