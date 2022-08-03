--------------------------------------------------------------------------------
--
-- main.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: Atari's Breakout remake game
--------------------------------------------------------------------------------

require 'src/Dependencies'

-- love.load() it's used to initialize game state at the very beginning.
function love.load()

	-- set default filter
	love.graphics.setDefaultFilter( 'nearest', 'nearest' )

	-- setting up title
	love.window.setTitle( 'Breakout' )

	-- initializing fonts
	gFonts = {
		[ 'small' ] = love.graphics.newFont( 'fonts/font.ttf', 8 ),
		[ 'medium' ] = love.graphics.newFont( 'fonts/font.ttf', 16 ),
		[ 'large' ] = love.graphics.newFont( 'fonts/font.ttf', 32 ),
	}
	-- setting up initial font
	love.graphics.setFont( gFonts[ 'small' ] )

	gFrames = {
		[ 'background' ] = love.graphics.newImage( 'graphics/background.png' )
	}

	push:setupScreen(
		-- virtual dimensions
		VIRTUAL_WIDTH,
		VIRTUAL_HEIGHT,
		-- window dimensions
		WINDOW_WIDTH,
		WINDOW_HEIGHT,
		-- parameters
		{ fullscreen = false, resizable = true, vsync = true }
	)

	gSounds = {
        [ 'paddle-hit' ] = love.audio.newSource( 'sounds/paddle_hit.wav',
			'static' ),
        [ 'score' ] = love.audio.newSource( 'sounds/score.wav', 'static' ),
        [ 'wall-hit' ] = love.audio.newSource( 'sounds/wall_hit.wav',
			'static' ),
        [ 'confirm' ] = love.audio.newSource( 'sounds/confirm.wav', 'static' ),
        [ 'select' ] = love.audio.newSource( 'sounds/select.wav', 'static' ),
        [ 'no-select' ] = love.audio.newSource( 'sounds/no-select.wav',
			'static' ),
        [ 'brick-hit-1' ] = love.audio.newSource( 'sounds/brick-hit-1.wav',
			'static' ),
        [ 'brick-hit-2' ] = love.audio.newSource( 'sounds/brick-hit-2.wav',
			'static' ),
        [ 'hurt' ] = love.audio.newSource( 'sounds/hurt.wav', 'static' ),
        [ 'victory' ] = love.audio.newSource( 'sounds/victory.wav', 'static' ),
        [ 'recover' ] = love.audio.newSource( 'sounds/recover.wav', 'static' ),
        [ 'high-score' ] = love.audio.newSource( 'sounds/high_score.wav',
			'static' ),
        [ 'pause' ] = love.audio.newSource( 'sounds/pause.wav', 'static' ),
		[ 'music' ] = love.audio.newSource( 'sounds/music.wav', 'static' )
	}
	gSounds[ 'music' ]:play()
	gSounds[ 'music' ]:setLooping( true )

	-- initializing Game State Machine
	gStateMachine = StateMachine {
		[ 'start' ] = function() return StartState() end
	}
	-- setting up current state to StartState()
	gStateMachine:change( 'start' )

	-- initializing keysPressed table
	love.keyboard.keysPressed = {}

end

-- love.update(dt) updates the state of the game every frame.
function love.update( dt )

	gStateMachine:update( dt )

	-- resetting keysPressed table
	love.keyboard.keysPressed = {}

end

-- love.draw() is called right after love.update(dt) and draws an image to the
-- window
function love.draw()

	push:start()
	-- drawing starts here

	-- rendering background image
	-- This image will appear in every state

	-- background dimensions
	local backgroundWidth = gFrames[ 'background' ]:getWidth()
	local backgroundHeight = gFrames[ 'background' ]:getHeight()

	love.graphics.draw(
		-- image
		gFrames[ 'background' ],
		-- image starting coordinates
		0, 0,
		-- image rotation
		0,
		-- images scaling
		VIRTUAL_WIDTH / ( backgroundWidth - 1 ),
		VIRTUAL_HEIGHT / ( backgroundHeight - 1 )
	)

	-- calling render() function of the current game state
	gStateMachine:render()

	-- drawing end here
	push:finish()

end

function love.keypressed( key )

	-- inserting pressed key in keysPressed table
	love.keyboard.keysPressed[ key ] = true

	-- handling escape key
	if key == 'escape' then
		-- quitting program
		love.event.quit()
	end
end

function love.keyboard.wasPressed( key )
	return love.keyboard.keysPressed[ key ]
end

function love.resize( w, h )
	push:resize( w, h )
end
