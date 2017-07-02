-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- USAGE --

-- Set background color
display.setDefault( 'background', 1 )			

-- Create array of button images
local buttonImages = {
	'images/level_button_locked.png',
	'images/level_select_button.png',
	'images/menu.png',
	'images/play.png',
}

-- Create array of button hovered images
local buttonOverImages = {
	'images/level_button_locked_over.png',
	'images/level_select_over_button.png',
	'images/menu-over.png',
	'images/play_over.png',
}

-- Create a viewgroup
local group = display.newGroup( )

local GridViewButtons = require( 'gridview' ).newGridView

local grid = GridViewButtons({
		g = group,
		x = 10,								-- Left coordinate
		y = 10,								-- Top coordinate
		width = display.contentWidth - 20,	-- Width of gridview
		height = display.contentHeight - 20,-- Height of gridview
		columnCount = 3,					-- Number of columns 
		paddingX = 30,
		paddingY = 30,
		images = buttonImages,
		imagesOver = buttonOverImages,
	})