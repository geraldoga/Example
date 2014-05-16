Tank = Entity:subclass('Tank')

function Tank:initialize(x, y, speed)

	x = x or -512
	y = y or 310
	speed = speed or 64
	health = 4
	
	local image = G.newImage( "textures/tank.png" )

	Entity.initialize(self, x, y, speed, image, health)

end