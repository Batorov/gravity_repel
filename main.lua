require("vector")
require("mover")
require("attractor")

function love.load()
	-- body
	width = love.graphics.getWidth()
   	height = love.graphics.getHeight()

   	G = 0.4

   	movers = {}

   	for i = 0, 4 do 
   		local location = Vector:create(i*100 + 100, 100)
		local velocity = Vector:create(0.1, 0.1)
		movers[#movers+1] = Mover:create(location, velocity, 2)
	end
	for i = 0, 4 do 
   		local location = Vector:create(i*100 + 100, 300)
		local velocity = Vector:create(0.1, 0.1)
		movers[#movers+1] = Mover:create(location, velocity, 2)
	end

end

function love.update( ... )
	-- body
	for i = 1, 10 do 
		for j = 1, 10 do 
			if i~=j then movers[i]:attract(movers[j]) end
		end
	end

	for i = 1, 10 do 
		movers[i]:update()

    	movers[i]:checkBoundaries()
	end
end

function love.draw()
	-- body
	for i = 1, 10 do 
		movers[i]:draw()
	end
end