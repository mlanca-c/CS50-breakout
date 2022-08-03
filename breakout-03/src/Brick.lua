--------------------------------------------------------------------------------
--
-- Brick.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: Brick class, represents the bricks the Ball has to hit
--------------------------------------------------------------------------------

Brick = Class{}

-- initializes a Brick object with the right attributes
function Brick:init( x, y )
	-- color of the brick
	self.tier = 0
	self.color = 1

	-- init dimensions
	self.width = 32
	self.height = 16

	-- init coordinates
	self.x = x
	self.y = y

	-- inPlay flag
	self.inPlay = true

end

function Brick:hit()

	gSounds[ 'brick-hit-2' ]:play()
	self.inPlay = false

end

-- draws a Brick object to the screen
function Brick:render()

	if self.inPlay then

		love.graphics.draw(
			-- image
			gTextures[ 'main' ],
			-- multiply color by 4 (-1) to get our color offset, then add tier
			-- to that to draw the correct tier and color brick onto the screen
			gFrames[ 'bricks' ][ 1 + (( self.color - 1 ) * 4 ) + self.tier ],
			-- coordinates
			self.x, self.y
		)

	end
end
