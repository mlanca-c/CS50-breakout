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

require 'src/Paddle'

-- constants.lua file contains most of the game constant variables
require 'src/constants'

-- utility functions, mainly for splitting our sprite sheet into various Quads
-- of differing sizes for paddles, balls, bricks, etc.
require 'src/Util'

-- Game State Machine Class that allows us to toggle in between game states
require 'src/StateMachine'

-- Each Game State
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/PlayState'
