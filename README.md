# CoronaSDKGridView
Create a grid view in Corona SDK using scrollview widget and button widgets. Other widgets are easy to implement following the creation of button in each cell.

## Usage
Usage of gridview is simple. The steps are:
1. Create an array of image filenames for default buttons
```lua
local buttonImages = {
	'images/level_button_locked.png',
	'images/level_select_button.png',
	'images/menu.png',
	'images/play.png',
}
```
2. Create array of image filenames for button clicked
```lua
local buttonOverImages = {
	'images/level_button_locked_over.png',
	'images/level_select_over_button.png',
	'images/menu-over.png',
	'images/play_over.png',
}
```
3. Initialize using 
```lua 
local GridView = require( 'gridview' ).newGridView
```
4. Then we pass in the parameters needed
```lua
local grid = GridViewButtons({
		--g = group,
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
```

The resulting image should be

![alt text](https://github.com/alexiusacademia/CoronaSDKGridView/raw/master/images/preview.png "Preview")
