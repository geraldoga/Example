Man = Entity:subclass('Man')

function Man:initialize(x, y, speed)

	x = x or 800
	y = y or 240

	-- why -32?
	-- because if you want to move the entity backwards
	-- you can add a negation, just to simplify things out
	-- and never rewrite the whole update method again
	speed = speed or -32

	health = 2

	local image = G.newImage( "textures/enemy2.png" )

	Entity.initialize(self, x, y, speed, image, health)

end

function Man:draw()

	-- now since you want to modify the man to have scale of .3
	-- you can add draw() function and you can rewrite the codes

	G.setColor( 255, 255, 255, 255 )
	G.draw( self.image, self.x, self.y, 0, .3, .3)


end