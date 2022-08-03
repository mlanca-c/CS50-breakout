--------------------------------------------------------------------------------
--
-- Ball.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: Ball class, represents the ball that can be bounced by the
-- paddle
--------------------------------------------------------------------------------

Ball = Class{}

-- initializes a Ball object with the right attributes
function Ball:init( skin )

	-- dimensions
	self.width = 8
	self.height = 8

    -- give ball random starting velocity
    self.dx = math.random(-200, 200)
    self.dy = math.random(-50, -60)

    self.x = VIRTUAL_WIDTH / 2 - 4
    self.y = VIRTUAL_HEIGHT - 42

	-- color skin of the paddle
	self.skin = skin

end

-- updates a Ball object's attributes
function Ball:update( dt )

	self.x = self.x + self.dx * dt
	self.y = self.y + self.dy * dt

	-- ball bounce through walls
	if self.x <= 0 then
		self.x = 0
		self.dx = -self.dx
		gSounds[ 'wall-hit' ]:play()
	end

	if self.x >= VIRTUAL_WIDTH - self.width then
		self.x = VIRTUAL_WIDTH - self.width
		self.dx = -self.dx
		gSounds[ 'wall-hit' ]:play()
	end

	if self.y <= 0 then
		self.y = 0
		self.dy = -self.dy
		gSounds[ 'wall-hit' ]:play()
	end
end

-- draws a Ball object to the screen
function Ball:render()

    love.graphics.draw(
		-- image
		gTextures[ 'main' ],
		-- quad
		gFrames[ 'balls' ][ self.skin ],
		-- coordinates
        self.x, self.y
	)

end

function Ball:collides( target )

	-- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end

    -- if the above aren't true, they're overlapping
    return true

end

function Ball:reset()

    self.x = VIRTUAL_WIDTH / 2 - 4
    self.y = VIRTUAL_HEIGHT - 42

	self.dx = 0
	self.dy = 0
end
