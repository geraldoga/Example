function love.load()

	
	-- setting a reference to the following libraries
	-- see the ENTITY file for further explanation
	G = love.graphics
	M = love.mouse
	W = love.window

	-- importing the entities
	-- import the ENTITY first, since it is the base
	-- or it would not work because you are calling
	-- that is not initialized first
	require 'entity'
	require 'Entities/target'
	require 'Entities/man'
	require 'Entities/tank'
	require 'Entities/zepp'

	-- importing the player
	require 'player'

	-- WHY NO .LUA?
	-- Because when you add .lua, it will find from the system directory
	-- not relative to your directory

	G.setBackgroundColor( 255, 255, 255, 255 )
	
	imageGround = G.newImage( "textures/ground.png" )

	-- creating an instance
	enemy1 = Target:new()
	enemy2 = Man:new()
	enemy3 = Tank:new()
	enemy4 = Zepp:new()

	player = Player:new()

	ENEMIES = {}

	-- adding all enemies to the ENEMIES table
	-- for simple coding
	table.insert(ENEMIES, enemy1)
	table.insert(ENEMIES, enemy2)
	table.insert(ENEMIES, enemy3)
	table.insert(ENEMIES, enemy4)

end

function love.draw()
	
	G.setColor( 198, 241, 255, 255 )
	G.rectangle( "fill", 0, 0, 800, 300 )
	
	G.setColor( 103, 164, 21, 255 )
	G.rectangle( "fill", 0, 300, 800, 300 )
	
	-- please add comment if you want hard coded
	-- centering the grounds' x
	-- decreasing current y position to its width
	G.setColor( 255, 255, 255, 255 )
	G.draw( imageGround, (800-1024)/2, 310-64, 0, 1, 1, 0, 0 )

	-- what this does is like ID system
	-- you have i as the ID number
	-- and v as you.
	for i, v in ipairs(ENEMIES) do v:draw() end

	player:draw()

	G.print("CHECK: " .. toString(isFiring), 0, 0)

end

function love.update(dt)

	for i, v in ipairs(ENEMIES) do 
		v:update(dt)
		-- if health is 0
		-- remove from the table
		-- destroy throw it to the garbage collector
		-- garbage collector will take care of you
		if v.health <= 0 then
			table.remove(ENEMIES, i)
			v = nil
		end
	end

	if player.isFiring then
		for i, v in ipairs(ENEMIES) do
			check = v.isInRectangle(v, player)
			if check then v.health = v.health - 1 end
		end
	end

	player:update(dt)

end

function love.mousereleased(x, y, button)

	-- if button left is pressed. 
	-- set player is firing to true :D
	if button == "l" then player.isFiring = true end

end

function love.focus(bool)

end

function love.quit()

end

function toString(bool)
	
	if bool then return "YES" end
	return "NO"

end