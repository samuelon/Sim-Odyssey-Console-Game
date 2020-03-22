note
	description: "Summary description for {ENTITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ENTITY

inherit
	ANY


feature --attributes
	id: INTEGER
	row : INTEGER
	col : INTEGER

	en : ENTITY_ALPHABET
	shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end
	quad: INTEGER --make sure

feature --compare
	set_quad(a_quad: INTEGER)
	do
		quad := a_quad
	end

	set_row(i:INTEGER)
	do
		row := i
	end

	set_col(i:INTEGER)
	do
		col := i
	end

	is_stationary:BOOLEAN
	local
		B : ENTITY_ALPHABET
		Y : ENTITY_ALPHABET
		W : ENTITY_ALPHABET
		O : ENTITY_ALPHABET
	do
		create B.make ('*')
		create O.make ('O')
		create W.make ('W')
		create Y.make ('Y')
		if (en = B or en = W or en = O or en = Y)  then
					Result := TRUE
		end

	end


	is_blackhole:BOOLEAN
	local

		O : ENTITY_ALPHABET
	DO
		create O.make ('O')
		if en.is_equal (O)then
				Result := TRUE
		end

	end
	is_yellow_dwarf:BOOLEAN
	local

		Y : ENTITY_ALPHABET

	DO
		create Y.make ('Y')
		if en.is_equal (Y) then
				Result := TRUE
		end

	end
	is_blue_giant:BOOLEAN
	local
		B : ENTITY_ALPHABET
	DO
		create B.make ('*')
		if en.is_equal (B) then
				Result := TRUE
		end

	end
	is_wormhole:BOOLEAN
	local
		W : ENTITY_ALPHABET
	DO
		create W.make ('W')
		if en.is_equal (W) then
				Result := TRUE
		end

	end

	is_star:BOOLEAN

	DO
		if (current.is_blue_giant or current.is_yellow_dwarf) then
				Result := TRUE
		end

	end



feature
	sector_out : STRING
	DO
		create Result.make_empty
		Result.append (row.out+","+col.out)
	end

	id_out : STRING
	do
		Result := "[" + id.out + "," + en.out + "]"
	end

	get_sector : SECTOR
	do
		Result := shared_info.galaxy.get_sector ([row,col])
	end


end
