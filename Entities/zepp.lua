Zepp = Entity:subclass('Zepp')

function Zepp:initialize(x, y, speed)

	x = x or -1024
	y = y or 0
	speed = speed or 172
	health = 5
	
	local image = G.newImage( "textures/zepp.png" )

	Entity.initialize(self, x, y, speed, image, health)

end