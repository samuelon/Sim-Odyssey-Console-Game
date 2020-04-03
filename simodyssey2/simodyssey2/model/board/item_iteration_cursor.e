note
	description: "Summary description for {ITEM_ITERATION_CURSOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"


-- CAN IT BE THE SAME TYPE?
class
	ITEM_ITERATION_CURSOR[N,D]

inherit
	ITERATION_CURSOR[TUPLE[N,D]]

create
	make

feature{NONE} -- Attribute
	ms: ARRAY[N]
	ns: LINKED_LIST[D]
	i: INTEGER

feature
	make( ns_new:LINKED_LIST[D];ms_new:ARRAY[N])
	do
		ms:=ms_new
		ns:=ns_new
		i:= ms.lower
	end

feature -- Cursor feature
	item: TUPLE[N,D]
	local
		n : N
		d : D
	do
		n:= ms[i]
		d:= ns[i]
		create Result
		Result := [n,d]
	end

	after: BOOLEAN
	do
		Result:= (i > ms.upper)
	end

	forth
	do
		i := i + 1
	end

invariant
	consistent_arrays: ms.count ~ ns.count
end


