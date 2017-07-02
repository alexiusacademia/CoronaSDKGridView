-- Grid View
-- Adds a vertical scrolling grid view in your application 
-- with specified number of columns

local widget = require( 'widget' )

local _A = {}

function _A.newGridView( params )
	-- params.g 			= parent view group
	-- params.x 			= x-coordinate of top left
	-- params.y				= y-coordinate of top left
	-- params.width			= total width of the gridview
	-- params.height		= total height of the gridview (not total height of scrollable area)
	-- params.columnCount	= number of columns of the gridview
	-- params.paddingX		= padding in x-direction
	-- params.paddingY 		= padding in y-direction
	-- params.images		= array of images to be displayed on the gridview 
	--							{'img1.png', 'img2.png', .....}

	-- Calculate the button width and height
	local btnWidth = (params.width - (params.columnCount - 1) * params.paddingX) / params.columnCount
	local btnHeight = btnWidth

	-- Options for the scrollview
	local options = {
		top 			= params.y,
		left 			= params.x,
		width 			= params.width,
		height 			= params.height,
		scrollWidth 	= params.width,
		scrollHeight 	= btnHeight,
		horizontalScrollDisabled = true,				-- Allow only vertical scrolling
	}

	local grid = display.newGroup( )					-- Create a display group to be returned

	local gridView = widget.newScrollView( options )	-- Create the gridview	
	grid:insert( gridView )

	local images = params.images
	local imagesOver = params.imagesOver

	local numRows = 0

	local group = display.newGroup( )

	-- Handle button click events
	function buttonClicked( event )
		print( event.target.id )
	end

	-- Populate gridview by buttons created using array of images
	for i=1, #images, params.columnCount do
		for j=1, params.columnCount do
			local row, frac = math.modf( i / params.columnCount )
			local btn = widget.newButton( {
				id = i + (j-1),
				defaultFile = images[i + (j-1)],
				overFile = imagesOver[i + (j-1)],
				width = btnWidth,
				height = btnHeight,
				left = (j-1) * btnWidth + params.paddingX * (j-1),
				top = (row)*btnHeight + (row)*params.paddingY,
				onRelease = buttonClicked,
			} )
			grid:insert( btn )
			gridView:insert( btn )

		end
		numRows = numRows + 1
		gridView:setScrollHeight( numRows * (btnHeight + params.paddingY ) )
	end
	
	return grid
end

return _A