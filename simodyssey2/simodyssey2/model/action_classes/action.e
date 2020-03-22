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
	
end
