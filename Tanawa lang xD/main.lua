function love.load()
	love.graphics.setBackgroundColor( 255, 255, 255 )
	xTarget = 0
	xTank = 0
	xMan = 800
	xZepp = 0
	
	imageTarget = love.graphics.newImage("textures/wla man.png")
	imageGround = love.graphics.newImage( "textures/ground.png" )
	imageEnemy_1 = love.graphics.newImage( "textures/enemy1.png" )
	imageEnemy_2 = love.graphics.newImage( "textures/enemy2.png" )
	imageAim = love.graphics.newImage( "textures/aim.png" )
	imageTank = love.graphics.newImage( "textures/tank.png" )
	imageZepp = love.graphics.newImage( "textures/zepp.png" )
	
	
end

function love.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	
	love.graphics.setColor( 198, 241, 255, 255 )
	love.graphics.rectangle( "fill", 0, 0, 800, 300 )
	
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imageTarget, xTarget - 256, 128, 0, 1, 1, 0, 0 )
	
	love.graphics.setColor( 103, 164, 21, 255 )
	love.graphics.rectangle( "fill", 0, 300, 800, 300 )
	
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imageGround, (800-1024)/2, 310-64, 0, 1, 1, 0, 0 )
	
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imageTank, xTank - 128, 310, 0, 1, 1, 0, 0 )
	
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imageZepp, xZepp - 128, 0, 0, 1, 1, 0, 0 )
	
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imageEnemy_2, xMan, 240, 0, .3, .3, 0, 0 )
	
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imageAim, x-16, y-16, 0, 1, 1, 0, 0 )
end

function love.update(dt)
	xTarget = xTarget + 128*dt
	if xTarget >= (800 + 256) then
		xTarget = 0
	end
	
	xTank = xTank + 64*dt
	if xTank >= (800 + 156) then
		xTank = 0
	end
	
	xMan = xMan - 32*dt
	if xMan >= (800 + 156) then
		xMan = 800
	end
	
	xZepp = xZepp + 172*dt
	if xZepp >= (800 + 256) then
		xZepp = 0
	end

end

function love.focus(bool)
end

function love.keypressed( key, unicode )
end

function love.keyreleased( key, unicode )
	
end

function love.mousepressed( x, y, button )
end

function love.mousereleased( x, y, button )
end

function love.quit()
end