local class = require 'middleclass'

Player = class('Player')

-- why didn't i subclass ENTITY?
-- because this is a special one
-- it will have scores and unique functions

function Player:initialize()

	self.x = 0
	self.y = 0

	self.image = G.newImage( "textures/aim.png" )

	-- what I did here is that I get the distance of x from 0 to the middle point
	-- of the image
	-- see DRAW function (below)
	self.center = {}
	self.center.distX = self.image:getWidth() / 2
	self.center.distY = self.image:getHeight() / 2

	self.isFiring = false

end

function Player:update(dt)

	-- please put any updating variables on updates only
	-- don't put on draw just like what you did, draw is draw not writing or any.
	self.x = M.getX()
	self.y = M.getY()

	self.isFiring = false

end

function Player:draw()

	-- Here!
	-- When you draw an image it will be something like this
	-- [0] [0] [0] [0] [0]
	-- [0] [0] [0] [0] [0] example it is located at (3, 3)
	-- [0] [0] [1] [1] [1]
	-- [0] [0] [1] [1] [1]
	-- [0] [0] [1] [1] [1]
	-- so if you have an image of 3 by 3 and you get its middle point
	-- you will have a center as (2, 2)
	-- now when you subtract (3, 3) to (2, 2)
	-- the position of drawing will be at (1, 1)
	-- which makes (3, 3) now as the origin, which is the center
	-- not (1, 1). it would be like this
	-- [0] [0] [0] [0] [0]
	-- [0] [1] [1] [1] [0]
	-- [0] [1] [1] [1] [0]
	-- [0] [1] [1] [1] [0]
	-- [0] [0] [0] [0] [0]
	G.setColor( 255, 255, 255, 255 )
	G.draw(self.image, self.x - self.center.distX, self.y - self.center.distY)

end