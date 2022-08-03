--------------------------------------------------------------------------------
--
-- Util.lua
--
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/CS50-breakout
-- Description: helper function
--------------------------------------------------------------------------------

-- splits all the texture into all the quads by dividing it equally
function GenerateQuads( atlas, tilewidth, tileheight )

	local sheetWidth = atlas:getWidth() / tilewidth
	local sheetHeight = atlas:getHeight() / tileheight

	local counter = 1
	local spriteSheet = {}

	for y = 0, sheetHeight - 1 do
		for x = 0, sheetWidth - 1 do
			spriteSheet[ counter ] = love.graphics.newQuad(
				-- coordinates
				x * tilewidth, y * tileheight,
				-- dimensions
				tilewidth, tileheight,
				atlas:getDimensions()
			)
			counter = counter + 1
		end
	end

	return spriteSheet

end

-- Utility function for slicing tables.
-- source: https://stackoverflow.com/questions/24821045/does-lua-have-something-like-pythons-slice
function table.slice( tbl, first, last, step )

    local sliced = {}

    for i = first or 1, last or #tbl, step or 1 do
      sliced[ #sliced + 1 ] = tbl[ i ]
    end

    return sliced

end

-- pieces out the paddles from atlas
function GenerateQuadsPaddles( atlas )
	local x = 0
	local y = 64

	local counter = 1
	local quads = {}

	for i = 0, 3 do

		-- small
		quads[ counter ] = love.graphics.newQuad(
			-- coordinates
			x, y,
			-- dimensions
			32, 16,
			atlas:getDimensions()
		)
		counter = counter + 1

		-- medium
		quads[ counter ] = love.graphics.newQuad(
			-- coordinates
			x + 32, y,
			-- dimensions
			64, 16,
			atlas:getDimensions()
		)
		counter = counter + 1

		-- large
		quads[ counter ] = love.graphics.newQuad(
			-- coordinates
			x + 96, y,
			-- dimensions
			96, 16,
			atlas:getDimensions()
		)
		counter = counter + 1

		-- huge
		quads[ counter ] = love.graphics.newQuad(
			-- coordinates
			x, y + 16,
			-- dimensions
			128, 16,
			atlas:getDimensions()
		)
		counter = counter + 1

		x = 0
		y = y + 32

	end

	return quads

end

-- pieces out the balls from atlas
function GenerateQuadsBalls( atlas )

	local x = 96
	local y = 48

	local counter = 1
	local quads = {}

	for i = 0, 3 do

		quads[ counter ] = love.graphics.newQuad(
			-- coordinates
			x, y,
			-- dimensions
			8, 8,
			atlas:getDimensions()
		)

		x = x + 8
		counter = counter + 1

	end

	x = 96
	y = 56

	for i = 0, 2 do

		quads[ counter ] = love.graphics.newQuad(
			-- coordinates
			x, y,
			-- dimensions
			8, 8,
			atlas:getDimensions()

		)

		x = x + 8
		counter = counter + 1

	end

	return quads

end

-- pieces out the Bricks from atlas
function GenerateQuadsBricks( atlas )
	return table.slice( GenerateQuads( atlas, 32, 16 ), 1, 21 )
end
