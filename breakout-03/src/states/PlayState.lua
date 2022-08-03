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
	-- init Paddle
	self.paddle = Paddle()

	-- init Ball
	self.ball = Ball( 1 )

	-- init Ball
	self.bricks = LevelMaker.createMap()

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

	-- update game if not paused
	if not self.paused then
		-- update Paddle
		self.paddle:update( dt )

		-- update Ball
		self.ball:update( dt )
		-- detect Ball collision with the Paddle
		if self.ball:collides( self.paddle ) then

			self.ball.dy = -self.ball.dy
			gSounds[ 'paddle-hit' ]:play()
		end

		-- detect Ball collision with all the Bricks
		for _, brick in pairs( self.bricks ) do

			if brick.inPlay and self.ball:collides( brick ) then
				brick:hit()
			end
		end
	end

	-- toggle to start state
	if love.keyboard.wasPressed( 'escape' ) then
		gStateMachine:change( 'start' )
	end
end

-- draws a PlayState object to the screen
function PlayState:render()
	-- render Paddle
	self.paddle:render()

	-- render Ball
	self.ball:render()

	-- render Bricks
	for _, brick in pairs( self.bricks ) do
		brick:render()
	end

	if self.paused then
		love.graphics.setFont( gFonts[ 'large' ] )
		love.graphics.printf(
			"paused",
			0, VIRTUAL_HEIGHT / 2 - 16,
			VIRTUAL_WIDTH, 'center'
		)
	end
end
