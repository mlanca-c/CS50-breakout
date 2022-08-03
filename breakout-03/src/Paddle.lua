--------------------------------------------------------------------------------
--
-- Paddle.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: Paddle class, represents a paddle that can move left and right
--------------------------------------------------------------------------------

Paddle = Class{}

-- initializes a Paddle object with the right attributes
function Paddle:init()

	-- starting dimensions
	self.width = 64
	self.height = 16

	-- init coordinates and speed (delta)
	self.x = VIRTUAL_WIDTH / 2 - ( self.width / 2 )
	self.y = VIRTUAL_HEIGHT - self.height * 2
	self.dx = 0

	-- color skin of the paddle
	self.skin = 1

	-- sie of the paddle, it starts with 2 because 1 is too dificult
	self.size = 2

end

-- updates a Paddle object's attributes
function Paddle:update( dt )

	-- setting up speed
	if love.keyboard.isDown( 'left' ) then
		self.dx = -PADDLE_SPEED
	elseif love.keyboard.isDown( 'right' ) then
		self.dx = PADDLE_SPEED
	else
		self.dx = 0
	end

	-- updating x according to speed
	self.x = self.x + self.dx * dt

	-- handling vertical boundaries
	if self.dx < 0 then
		self.x = math.max( 0, self.x )
	else
		self.x = math.min( VIRTUAL_WIDTH - self.width, self.x )
	end
end

-- draws a Paddle object to the screen
function Paddle:render()

    love.graphics.draw(
		-- image
		gTextures[ 'main' ],
		-- quad
		gFrames[ 'paddles' ][ self.size + 4 * ( self.skin - 1 ) ],
		-- coordinates
        self.x, self.y
	)

end
