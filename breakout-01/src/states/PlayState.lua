--------------------------------------------------------------------------------
--
-- PlayState.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: game state class.
--------------------------------------------------------------------------------

PlayState = Class{ __includes = BaseState }

-- initializes a PlayState object with the right attributes
function PlayState:init()

	self.paddle = Paddle()
	self.paused = false

end

-- updates a PlayState object's attributes
function PlayState:update( dt )

	if self.paused and love.keyboard.wasPressed( 'space' ) then

		self.paused = false
		gSounds[ 'pause' ]:play()

	elseif love.keyboard.wasPressed( 'space' ) then

		self.paused = true
		gSounds[ 'pause' ]:play()

	end

	-- update Paddle
	if not self.paused then
		self.paddle:update( dt )
	end

	-- toggle to start state
	if love.keyboard.wasPressed( 'escape' ) then
		gStateMachine:change( 'start' )
	end
end

-- draws a PlayState object to the screen
function PlayState:render()

	self.paddle:render()

	if self.paused then
		love.graphics.setFont( gFonts[ 'large' ] )
		love.graphics.printf(
			"paused",
			0, VIRTUAL_HEIGHT / 2 - 16,
			VIRTUAL_WIDTH, 'center'
		)
	end
end
