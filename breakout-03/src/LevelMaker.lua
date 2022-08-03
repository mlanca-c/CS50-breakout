--------------------------------------------------------------------------------
--
-- LevelMaker.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: returns a table of bricks that the game can render, based on the
-- current level
--------------------------------------------------------------------------------

LevelMaker = Class{}

function LevelMaker.createMap( level )

	-- initialize brick table
	local bricks = {}

	-- Randomize number of rows and collums of 'bricks'
	local nuRows = math.random( 1, 5 )
	local nuCols = math.random( 7, 13 )

	for y = 1, nuRows do
		for x = 1, nuCols do

			b = Brick(

				-- x coordinate:
				-- decrement x by 1 because tables are 1-indexed, coordinatess
				-- are 0-indexed
				-- multiply by the brick's width
                -- the screen should have 8 pixels of padding;
				-- we can fit 13 cols + 16 pixels total
				-- left-side padding for when there are fewer than 13 columns
                ( x - 1 )
                * 32
                + 8
                + ( 13 - nuCols ) * 16,

				-- y coordinate:
				-- just use y * 16, since we need top padding anyway
                y * 16

			)
			table.insert( bricks, b )

		end
	end

	return bricks

end
