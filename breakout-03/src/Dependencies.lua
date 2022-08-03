--------------------------------------------------------------------------------
--
-- Dependencies.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: includes file with all of main.lua's dependencies.
--------------------------------------------------------------------------------

-- library used for a more retro looking game.
-- source: https://github.com/Ulydev/push
push = require 'lib/push'

-- library used for a more OOP aproach
-- source: https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

-- the rectangular entity the player controls, which deflects the ball
require 'src/Paddle'

-- the ball that travels around, breaking bricks and triggering lives lost
require 'src/Ball'

-- the entities in our game map that give us points when we collide with them
require 'src/Brick'

-- constants.lua file contains most of the game constant variables
require 'src/constants'

-- a class used to generate our brick layouts (levels)
require 'src/LevelMaker'

-- utility functions, mainly for splitting our sprite sheet into various Quads
-- of differing sizes for paddles, balls, bricks, etc.
require 'src/Util'

-- Game State Machine Class that allows us to toggle in between game states
require 'src/StateMachine'

-- Each Game State
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/PlayState'
