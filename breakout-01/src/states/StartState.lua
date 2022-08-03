--------------------------------------------------------------------------------
--
-- StartState.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: game state class.
--------------------------------------------------------------------------------

StartState = Class{ __includes = BaseState }

-- toggles between 1, 2 and 3, highlights start, highscore or exit
local highlight = 1

-- updates a StartState object's attributes
function StartState:update( dt )

	if love.keyboard.wasPressed( 'up' ) then

		highlight = highlight - 1 == 0 and 3 or highlight - 1
		gSounds[ 'paddle-hit' ]:play()

	elseif love.keyboard.wasPressed( 'down' ) then

		highlight = highlight + 1 == 4 and 1 or highlight + 1
		gSounds[ 'paddle-hit' ]:play()

	elseif love.keyboard.wasPressed( 'escape' ) then
		love.event.quit()

	end

	if love.keyboard.wasPressed( 'enter' )
		or love.keyboard.wasPressed( 'return' ) then

		if highlight == 1 then

			gStateMachine:change( 'play' )
			gSounds[ 'confirm' ]:play()

		elseif highlight == 2 then
			-- gStateMachine:change( 'highscores' )

		elseif highlight == 3 then
			love.event.quit()
		end
	end
end

-- draws a StartState object to the screen
function StartState:render()

	-- title
	love.graphics.setFont( gFonts[ 'large' ] )
	love.graphics.printf(
		"BREAKOUT",
		-- position
		0, VIRTUAL_HEIGHT / 3,
		VIRTUAL_WIDTH, 'center'
	)

	-- instructions
	-- highlighting in 1
	love.graphics.setFont( gFonts[ 'medium' ] )
	if highlight == 1 then
        love.graphics.setColor( 103/255, 1, 1, 1 )
	end
	love.graphics.printf(
		"start",
		-- position
		0, VIRTUAL_HEIGHT / 3 * 2,
		VIRTUAL_WIDTH, 'center'
	)

	-- resetting color
	love.graphics.setColor( 1, 1, 1, 1 )

	-- highlighting in 2
	if highlight == 2 then
        love.graphics.setColor( 103/255, 1, 1, 1 )
	end
	love.graphics.printf(
		"highscores",
		-- position
		0, VIRTUAL_HEIGHT / 3 * 2 + 30,
		VIRTUAL_WIDTH, 'center'
	)

	-- resetting color
	love.graphics.setColor( 1, 1, 1, 1 )

	-- highlighting in 3
	if highlight == 3 then
        love.graphics.setColor( 103/255, 1, 1, 1 )
	end
	love.graphics.printf(
		"exit game",
		-- position
		0, VIRTUAL_HEIGHT / 3 * 2 + 60,
		VIRTUAL_WIDTH, 'center'
	)

	-- resetting color
	love.graphics.setColor( 1, 1, 1, 1 )

end
