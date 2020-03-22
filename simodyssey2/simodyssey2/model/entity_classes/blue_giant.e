note
	description: "Summary description for {BLUE_GIANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BLUE_GIANT

inherit
	STAR

create
	make

feature {GALAXY} -- Initialization

	make(idv : INTEGER; a_row : INTEGER ; a_col : INTEGER)
			-- Initialization for `Current'.
		do
			id := idv
			luminosity := 5
			create en.make ('*') --letter
			row := a_row
			col := a_col
--			create sector.make (a_row,a_col)
		--	sector := a_sector
		end


end
