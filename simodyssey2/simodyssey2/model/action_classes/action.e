note
	description: "Summary description for {ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ACTION


feature -- source
	shared_info_access: SHARED_INFORMATION_ACCESS

	shared_info: SHARED_INFORMATION
		attribute
			Result := shared_info_access.shared_info
		end

	model_access: ETF_MODEL_ACCESS

	model: ETF_MODEL
		attribute
			Result := model_access.m
		end

feature
	act_name : ACTION_NAME
	invalid : BOOLEAN

feature
	set_invalid
		do
			invalid := true
		end

end
