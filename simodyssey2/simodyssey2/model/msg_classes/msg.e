note
	description: "Summary description for {MSG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	MSG



feature
	state_out : STRING
	DO
		create Result.make_empty
		Result.append ("state:")
		Result.append (m_model.return_i.out)
		if
			not  m_model.status_on
		then
			Result.append (".0")
		else
			Result.append(".")
			Result.append (m_model.return_i_s.out)
		end
		
		Result.append (", mode:")
		check_mode
		Result.append (tag)
		Result.append (",")
		Result.append ("%N")
	end

feature -- helper command
	check_mode
		do
			if
				m_model.return_play_on
			then
				tag := "play"
			end

			if
				m_model.return_test_on
			then
				tag := "test"
			end
		end


--	comm_out : STRING
--	DO
--		
--	end
feature -- attribute

	m_model_access : ETF_MODEL_ACCESS

	m_model : ETF_MODEL
		attribute
				Result:= m_model_access.m
			end
	tag : STRING
		attribute
			create Result.make_empty
		end



end
