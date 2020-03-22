note
	description: "Summary description for {SORT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SORT[T]

feature -- sort
--	sort
--	do
--		from
--			i := temp.lower
--			until
--				i>temp.upper
--			loop
--				from
--					j := temp.lower
--				until
--					j > (temp.upper-i)
--				loop
--					if
--						attached temp[j] as t1 and attached temp[j+1]as t2
--					then
--						if
--							t1.id > t2.id
--						then
--							temp_ent := t1
--							temp[j]:=t2
--							temp[j+1]:=temp_ent
--						end
--					end
--					j:=j+1
--				end
--			i := i+1
--			end
--	end


feature{NONE}
	need_s : LIST[T]

end
