--------------------------------------------------------------------------------
--
-- StartState.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: game state class.
--------------------------------------------------------------------------------

StartState = Class{ __includes = BaseState }

-- toggles between 1 and 2, highlights start or highscore
local highlight = 1

-- updates a StartState object's attributes
function StartState:update( dt )

	if love.keyboard.wasPressed( 'up' )
		or love.keyboard.wasPressed( 'down' ) then
		highlight = highlight == 1 and 2 or 1
	end
end

-- draws a StartState object to the screen
function StartState:render()

	-- title
	love.graphics.setFont( gFonts[ 'large' ] )
	love.graphics.printf(
		"BREAKOUT",
		0,
		VIRTUAL_HEIGHT / 3,
		VIRTUAL_WIDTH,
		'center'
	)

	-- instructions
	love.graphics.setFont( gFonts[ 'medium' ] )

	-- highlighting in 1
	if highlight == 1 then
        love.graphics.setColor( 103/255, 1, 1, 1 )
	end
	love.graphics.printf(
		"start",
		0,
		VIRTUAL_HEIGHT / 3 * 2,
		VIRTUAL_WIDTH,
		'center'
	)

	-- resetting color
	love.graphics.setColor(1, 1, 1, 1)

	-- highlighting in 2
	if highlight == 2 then
        love.graphics.setColor( 103/255, 1, 1, 1 )
	end

	love.graphics.printf(
		"highscores",
		0,
		VIRTUAL_HEIGHT / 3 * 2 + 30,
		VIRTUAL_WIDTH,
		'center'
	)

	-- resetting color
	love.graphics.setColor(1, 1, 1, 1)

end
