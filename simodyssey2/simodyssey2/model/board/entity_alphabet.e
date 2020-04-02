note
    description: "[
       Alphabet allowed to appear on the galaxy board.
    ]"
    author: "Kevin Banh"
    date: "April 30, 2019"
    revision: "1"

class
    ENTITY_ALPHABET

inherit
    ANY
        redefine
            out,
            is_equal
        end

create
    make

feature -- Constructor

    make (a_char: CHARACTER)
        do
            item := a_char
        end

feature -- Attributes

    item: CHARACTER


feature -- Query

    out: STRING
            -- Return string representation of alphabet.
        do
            Result := item.out
        end

    is_equal(other : ENTITY_ALPHABET): BOOLEAN
        do
            Result := current.item.is_equal (other.item)
        end

    is_stationary: BOOLEAN
          -- Return if current item is stationary.
    	do
           if item = 'W' or item = 'Y' or item = '*' or item = 'O' then
           		Result := True
           end
        end
     is_star: BOOLEAN
          -- Return if current item is a star
    	do
           if item = 'Y' or item = '*' then
           		Result := True
           end
        end
     is_yellow_dwarf : BOOLEAN
     	do
           if item = 'Y' then
           		Result := True
           end
        end
      is_blackhole: BOOLEAN
          -- Return if current item is a star
    	do
           if item = 'O' then
           		Result := True
           end
        end
        is_planet: BOOLEAN
          -- Return if current item is a star
    	do
           if item = 'P' then
           		Result := True
           end
        end

        is_wormhole: BOOLEAN
          -- Return if current item is a star
    	do
           if item = 'W' then
           		Result := True
           end
        end

         is_explorer: BOOLEAN
          -- Return if current item is a star
    	do
           if item = 'E' then
           		Result := True
           end
        end

        is_benign : BOOLEAN
        DO
        	if item = 'B' then
           		Result := True
           end
        end

        is_empty : BOOLEAN
        do
        	if item = '-' then
        		Result := true
        	end
        end

invariant
    allowable_symbols:
        item = 'E' or item = 'P' or item = 'A' or item = 'M' or  item = 'J' or item = 'O' or item = 'W' or item = 'Y' or item = '*' or item='B'or item='-'
end
