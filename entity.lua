-- thanks to kikito :D
local class = require 'middleclass'

Entity = class('Entity')

function Entity:initialize(x, y, speed, image, health)

	-- this means that if x is not provided when called through functions
	-- your entity will have a value of x as 0
	self.x = x or 0
	self.y = y or 0

	-- we will be using velocity to update things not speed
	-- so that we could gain more control

	-- why self.velocity = {} first? not directly self.velocity.x = 0 unlike above?
	-- actually {} makes a table. So just like math, you can't have table of value
	-- without having a table first right?
	-- does it make sense? Yep. Because it tells the variable to have a table instance.
	self.velocity = {}
	self.velocity.x = 0
	self.velocity.y = 0

	self.speed = speed or 0

	self.image = image

	self.health = health or 1 

	-- setting reference to the dimensions of the image
	-- so you when you want to get width
	-- you don't need to do this anymore
	-- self.image:getWidth() which is as self.width
	self.width = image:getWidth()
	self.height = image:getHeight()

	-- setting the velocity.x to speed
	self.velocity.x = self.speed

end

function Entity:update(dt)

	-- you are adding your current position with the velocity
	-- and multiplied by delta time to ensure that it is the same
	-- as when you use love2d on old computers
	self.x = self.x + self.velocity.x * dt
	self.y = self.y + self.velocity.y * dt

	-- now where did I get that W
	-- see the MAIN file
	-- if you have an object that is moving right and was out of the screen
	-- it will move back to the left portion starting at outside of the screen
	-- likewise if opposite but acts mirror
	if self.x > W.getWidth() and self.speed > 0 then self.x = 0 - self.width 
	elseif self.x < 0 - self.width and self.speed < 0 then self.x = W.getWidth() end

end

function Entity:draw()

	-- oh BTW, learn to use variables and probably avoid lots of HARD CODED NUMBERS
	-- example like this from your code. INSTEAD OF LIKE THIS.
	-- love.graphics.draw( imageTank, xTank - 128, 310, 0, 1, 1, 0, 0 )
	-- use this, aside from that you can call directly like this
	-- love graphics will care for you automatically because scale of 1 is already a default
	-- but if you want to set something. Please see the comment at MAN file

	-- where did I get G?
	-- see the MAIN file at the love.load()
	
	G.setColor( 255, 255, 255, 255 )
	G.draw(self.image, self.x, self.y)

end

-- self-explanatory if mouse is inside the image

function Entity:isInRectangle(mouse)
  
	if mouse.x < self.x + self.width and mouse.y < self.y + self.height and mouse.x > self.x and mouse.y > self.y then return true end

end