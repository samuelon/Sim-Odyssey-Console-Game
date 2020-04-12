note
	description: "Summary description for {ACTION_NAME}.ACTION_NAME is the name string of each action"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACTION_NAME

inherit
    ANY
        redefine
            out
        end
create
	make

feature
	item : STRING

feature -- Initialization

	make(name : STRING)
			-- Initialization for `Current'.
		do
			create item.make_empty
			item := name
		end

feature
	 out: STRING
            -- Return string representation of action name
        do
            Result := item.out
        end

     is_pass:BOOLEAN
     do
     	if
     		current.item.is_equal ("pass")
     	then
     		result := true
     	end
     end

     is_move:BOOLEAN
     do
     	if
     		current.item ~ "move"
     	then
     		result := true
     	end
     end

     is_wormhole:BOOLEAN
     do
     	if
     		current.item ~ "wormhole"
     	then
     		result := true
     	end
     end

     is_land:BOOLEAN
     do
     	if
     		current.item ~ "land"
     	then
     		result := true
     	end
     end

     is_liftoff:BOOLEAN
     do
     	if
     		current.item ~ "liftoff"
     	then
     		result := true
     	end
     end


end
