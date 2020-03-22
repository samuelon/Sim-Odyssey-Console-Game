note
	description: "Summary description for {MAIN_MESSAGE} display all msg."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

 class
	MAIN_MESSAGE

create
	make

feature{NONE} --constructor
	make
		do
			state_number := 0
			status_num := 0
			create error_ste.make_from_string ("")
		end

feature -- attributes
	m_model_access : ETF_MODEL_ACCESS

	model : ETF_MODEL
		attribute
				Result:= m_model_access.m
			end
	state_number : INTEGER
	status_num : INTEGER
	error_ste: STRING -- ok or error
	all_msg : ALL_MSG
	shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end

feature --quires


	pic : STRING
	do
		create Result.make_empty
		if attached shared_info.galaxy as g_a then
--				Result.append (g_a.g.abstract_test_string)
			Result.append(g_a.movement_str) -- uncomment when movement ok
			if
				model.test_on
			then
				Result.append (g_a.abstract_test_string)
				Result.append (g_a.death_string)
			end

			Result.append ( g_a.out)
		end
	end



end
