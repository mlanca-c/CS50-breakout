--------------------------------------------------------------------------------
--
-- StateMachine.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: StateMachine Class that toggles between game states
--------------------------------------------------------------------------------

StateMachine = Class{}

-- initializes StateMachine with `states`
function StateMachine:init( states )

	-- create empty state that will serve as the default state
	self.empty = {
		render = function() end,
		update = function() end,
		enter  = function() end,
		exit   = function() end
	}

	-- initialize states variable
	self.states = states or {}

	-- current state will start with the deafult empty state
	self.current = self.empty

end

-- changes self.current state for self.states[ `stateName` ]
function StateMachine:change( stateName, enterParams )

	-- making sure state exists
	assert( self.states[ stateName ] )

	-- changing self.current state
	self.current:exit()
	self.current = self.states[ stateName ]()
	self.current:enter( enterParams )

end

-- updates StateMachine's self.current state
function StateMachine:update( dt )
	self.current:update( dt )
end

-- renders StateMachine's self.current state
function StateMachine:render()
	self.current:render()
end
