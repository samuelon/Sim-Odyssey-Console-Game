note
	description: "Summary description for {LIFTOFF}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LIFTOFF

inherit
	ACTION

create
	make

feature{NONE} -- constructor
	make
	do
		create act_name.make ("liftoff")
		invalid := false
	end

feature
	liftoff
	do
		across
			 shared_info.og_exp.get_sector.return_sorted_ent is e
		loop
			if e.is_planet then
				if attached{PLANET}e as p then
					if p.is_visited then
						shared_info.og_exp.set_false_landed
					end
				end
			end
		end
--		
	end

end
