note
	description: "Summary description for {MODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MODE

inherit
	ANY
	redefine
		out
	end

create
	make , make_test

feature-- Attributes

g: GALAXY -- has access to shared information

shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end


feature -- constructor

	make

        do
			shared_info.test (3, 5, 7, 15, 30)
        	shared_info.set_galaxy
        	g := shared_info.galaxy

        end

	make_test(a_threshold: INTEGER; j_threshold: INTEGER; m_threshold: INTEGER; b_threshold: INTEGER; p_threshold: INTEGER)
	--???
--	require
--		valid : a_threshold < j_threshold and j_threshold < m_threshold and m_threshold < b_threshold and b_threshold < p_threshold
        do
        	shared_info.test (a_threshold, j_threshold, m_threshold, b_threshold, p_threshold)
        	shared_info.set_galaxy
        	g := shared_info.galaxy
--
        end



feature -- query
	out : STRING
		do
			create Result.make_empty
--			Result.append (share.out)
			Result.append (shared_info.galaxy.out)
			Result.append ("%N")
		end


end
