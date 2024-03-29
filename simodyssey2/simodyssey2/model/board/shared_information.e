note
	description: "[
		Common variables such as threshold for planet
		and constants such as number of stationary items for generation of the board.
		]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SHARED_INFORMATION

create {SHARED_INFORMATION_ACCESS}
	make

feature{GALAXY,ENTITY}
	make
		do
		create og_exp.make (0,1,1)
		create black_hole.make (-1,3,3)
		stationary_id := -2
		movable_id := 1
		create move_this_turn.make
		create dead_this_turn.make
		create reproduce_this_turn.make (100)
		reproduce_this_turn.compare_objects
		create galaxy.make_empty
		create destory_this_turn.make
		create exp_death_msg.make_empty
		--create 2 linkedlist
		end

feature -- singleleton pattern
model_access: ETF_MODEL_ACCESS

	model: ETF_MODEL
		attribute
			Result := model_access.m
		end

feature

	number_rows: INTEGER = 5
        	-- The number of rows in the grid

	number_columns: INTEGER = 5
        	-- The number of columns in the  grid

	number_of_stationary_items: INTEGER = 10
			-- The number of stationary_items in the grid

    asteroid_threshold: INTEGER
		-- used to determine the chance of an asteroid being put in a location
		attribute
			Result := 10
		end

	janitaur_threshold: INTEGER
		-- used to determine the chance of a janitaur being put in a location
		attribute
			Result := 20
		end

	malevolent_threshold: INTEGER
		-- used to determine the chance of a malevolent being put in a location
		attribute
			Result := 30
		end

	benign_threshold: INTEGER
		-- used to determine the chance of a benign being put in a location
		attribute
			Result := 40
		end

    planet_threshold: INTEGER
		-- used to determine the chance of a planet being put in a location
		attribute
			Result := 50
		end


	max_capacity: INTEGER = 4
		 -- max number of objects that can be stored in a location

	stationary_id : INTEGER
		-- the stationary id

	movable_id : INTEGER

	og_exp : EXPLORER

	black_hole : BLACKHOLE

	exp_death_msg : STRING
		-- the exploer specific death message

feature -- helper

	move_this_turn : LINKED_LIST[NON_STATIONARY]
		-- all entities moved this turn

	dead_this_turn : LINKED_LIST[NON_STATIONARY]
		-- all entities dead this turn

	reproduce_this_turn : HASH_TABLE[EBMJ_COMMON,EBMJ_COMMON]
		-- all entities behaves reproduce and the new reproduced entity this turn

	destory_this_turn : DESTORY_BOOK
		-- all destoried entities this turn

	galaxy : GALAXY
feature
	stationary_id_sub_one
		-- update stationary entity id
		do
			stationary_id := stationary_id - 1
		end

	movable_id_plus_one
		-- update movable entity id
		do
			movable_id := movable_id + 1

		end

feature -- set_galaxy
--	og_exp : EXPLORER
set_galaxy
do
	create galaxy.make
--	reset_ent_id
end

feature -- reset
	reset_key_info
		-- reset every collections each turn
	do
--		stationary_id := -2
--		movable_id := 1
		reset_dead_this_turn
		reset_destory_this_turn
		reset_move_this_turn
		reset_reproduce_this_turn
		og_exp.make (0, 1, 1)
	end

	reset_ent_id
		-- reset stationary entities and movable entities when restart play or test
	do
		stationary_id := -2
		movable_id := 1
	end

feature -- add items
	add_move_this_turn(ent : NON_STATIONARY)
		do
			if
				not move_this_turn.has (ent)
			then
				move_this_turn.extend (ent)
			end
		end

	add_dead_this_turn(ent : NON_STATIONARY)
		do
			if
				not dead_this_turn.has (ent)
			then
				dead_this_turn.extend (ent)
			end
		end

feature -- reset every collections
	reset_move_this_turn
	do
		create move_this_turn.make

	end

	reset_dead_this_turn
	do
		create dead_this_turn.make

	end

	reset_reproduce_this_turn
	do
		create reproduce_this_turn.make (100)
		reproduce_this_turn.compare_objects
	end

	reset_destory_this_turn
	do
		create destory_this_turn.make
	end

feature --commands
	test(a_threshold: INTEGER; j_threshold: INTEGER; m_threshold: INTEGER; b_threshold: INTEGER; p_threshold: INTEGER)
		--sets threshold values
		require
			valid_threshold:
				0 < a_threshold and a_threshold <= j_threshold and j_threshold <= m_threshold
				and m_threshold <= b_threshold and b_threshold <= p_threshold and p_threshold <= 101
		do
				set_asteroid_threshold (a_threshold)
				set_benign_threshold (b_threshold)
				set_janitaur_threshold (j_threshold)
				set_malevolent_threshold (m_threshold)
				set_planet_threshold (p_threshold)
				reset_ent_id
				reset_key_info

		end

	set_exp_death_msg(str : STRING)
		DO
			exp_death_msg := str
		end

	set_malevolent_threshold(threshhold:INTEGER)
		do
			malevolent_threshold:=threshhold
		end

	set_janitaur_threshold(threshhold:INTEGER)
		do
			janitaur_threshold:=threshhold
		end

	set_asteroid_threshold(threshhold:INTEGER)
		do
			asteroid_threshold:=threshhold
		end
	set_planet_threshold(threshhold:INTEGER)
		do
			planet_threshold:=threshhold
		end

	set_benign_threshold(threshhold:INTEGER)
		do
			benign_threshold:=threshhold
		end

feature -- out helper
	out_removed_this_turn : STRING
		-- print out removed_this_turn
		local
			i : INTEGER
		do
			create result.make_empty
			across
			    reproduce_this_turn.current_keys is k
			loop
				if attached reproduce_this_turn[k] as p then
					result.append("[keys:"+ k.id_out +  ",result:" + p.id_out )
				end

			end
		end

	out_dead_this_turn : STRING
		-- debug for dead_this_turn
		local
			i : INTEGER
		do
			create result.make_empty
			across
			    dead_this_turn is k
			loop
				result.append("dead-this-turn:"+k.id_out+",")

			end
		end


end
