--------------------------------------------------------------------------------
--
-- BaseState.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: used as the base class for all states
--------------------------------------------------------------------------------

BaseState = Class{}

function BaseState:init() end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update( dt ) end
function BaseState:render() end
