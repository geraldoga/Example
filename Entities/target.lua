-- the target will be the subclass of an entity
-- thus, we will inherit some attributes and properties from the entity
-- so that, we will rewrite all of the codes
Target = Entity:subclass('Target')

function Target:initialize(x, y, speed)

	-- local x, y is the same as having a method of example(x, y)
	-- but you can pass some values and it will do the setting for you

	-- what i did here, is i added a default value.
	-- so if you didn't pass a value, it will use this default values
	x = x or -141
	y = y or 128
	speed = speed or 128

	-- just like this it is the same as that above
	-- but it was not in the arguments list
	-- having a local variable means to have a variable inside this function only

	-- why local? because you don't want to have it stored globally forever in your game
	-- you want it to be available here and deleted after this function is called
	-- this is like our stomach
	-- since having an involuntary movements, only the brain can control it. :D
	local image = G.newImage( "textures/wla man.png" )

	-- since health i decided health is 1. I don't need to set health again.
	-- since the default is 1. :D see ENTITY file.

	-- it will call the initialize method of entity passing different attributes
	-- . vs : when calling method
	-- Target.example(self) is as Target:example()

	-- when to pass self? everytime
	-- you can take as an example of you in the world
	-- where you make a retoke(self)
	-- then you modify your self.nose = longer, self.cheeks = small

	Entity.initialize(self, x, y, speed, image)

end

function Target:update(dt)

	-- here's where subclass is useful
	-- you don't need to type the code again at the entity 
	-- but instead you will to only call it
	-- and add few functionalities

	Entity.update(self, dt) -- the same as Entity:update(dt)

	-- you can also remove this method since you have nothing to modify to
	-- jusk like, what I did with the other files
	-- since it will call the baseclass update function itself automatically
	-- if it doesn't find update method from any files you have subclassed

end

	-- You can also leave the draw method
	-- Since you have nothing to modify to.
	-- But if you wanted to, see MAN file for example