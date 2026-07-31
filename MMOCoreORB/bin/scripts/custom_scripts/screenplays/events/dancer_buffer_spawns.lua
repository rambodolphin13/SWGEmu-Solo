DancerBufferSpawns = ScreenPlay:new {
	numberOfActs = 1,

	-- Generic AI dancer buffers placed at the exact marked cantina locations.
	-- Coordinates are local to each interior cell.
	spawnLocations = {
		{ planet = "tatooine", x = 21.0504, z = -0.894993, y = 0.952242, heading = 90.3948, cellID = 1256058, dance = "popular", greeter = true },
		{ planet = "tatooine", x = -1.01469, z = 0.999982, y = 4.07318, heading = 356.445, cellID = 1233975, dance = "popular", greeter = true },
		{ planet = "naboo", x = 20.0152, z = -0.894993, y = 2.24212, heading = 87.2524, cellID = 5, dance = "popular", greeter = true },
		{ planet = "naboo", x = 21.1922, z = -0.894993, y = 2.64435, heading = 89.4316, cellID = 91, dance = "popular", greeter = true },
		{ planet = "naboo", x = 20.4719, z = -0.894993, y = 2.91235, heading = 89.675, cellID = 64, dance = "popular", greeter = true },
		{ planet = "naboo", x = 20.0305, z = -0.894993, y = 2.44766, heading = 89.2474, cellID = 111, dance = "popular", greeter = true },
		{ planet = "naboo", x = -1.91813, z = 0.999951, y = 7.42041, heading = 2.03949, cellID = 1419013, dance = "popular", greeter = true },
		{ planet = "naboo", x = -1.61872, z = 0.999951, y = 7.52502, heading = 1.36546, cellID = 1865363, dance = "popular", greeter = true },
		{ planet = "corellia", x = 21.3791, z = -0.894993, y = 3.15346, heading = 89.6215, cellID = 8105496, dance = "popular", greeter = true },
		{ planet = "corellia", x = 21.6582, z = -0.894994, y = 2.95714, heading = 90.8481, cellID = 2625355, dance = "popular", greeter = true },
		{ planet = "corellia", x = 21.4207, z = -0.894993, y = 3.27153, heading = 90.6558, cellID = 3005399, dance = "popular", greeter = true },
		{ planet = "corellia", x = 22.0387, z = -0.894994, y = 4.10362, heading = 88.1311, cellID = 3075429, dance = "popular", greeter = true },
		{ planet = "talus", x = 21.5947, z = -0.894993, y = 3.96613, heading = 87.6998, cellID = 3175391, dance = "popular", greeter = true },
		{ planet = "talus", x = 21.8314, z = -0.894994, y = 3.07701, heading = 88.1046, cellID = 4265375, dance = "popular", greeter = true },
	}
}

registerScreenPlay("DancerBufferSpawns", true)

function DancerBufferSpawns:start()
	self:spawnDancers()
end

function DancerBufferSpawns:spawnDancers()
	for i = 1, #self.spawnLocations, 1 do
		local loc = self.spawnLocations[i]
		local pNpc = spawnMobile(loc.planet, "dancer_buffer", 0, loc.x, loc.z, loc.y, loc.heading, loc.cellID)

		if (pNpc ~= nil) then
			SceneObject(pNpc):setCustomObjectName("Cantina Dancer (Dancer Buffer)")
			CreatureObject(pNpc):setScreenPlayState("AIServiceEntertainer", 1)
			writeStringData("aiDancer:dance:" .. SceneObject(pNpc):getObjectID(), loc.dance or "popular")

			if (loc.greeter == true) then
				createEvent((20 + i) * 1000, "DancerBufferSpawns", "announceCantinaServices", pNpc, "")
			end

			createEvent((3 + i) * 1000, "DancerBufferSpawns", "startPerformance", pNpc, "")
		end
	end
end

function DancerBufferSpawns:startPerformance(pNpc)
	if (pNpc == nil) then
		return
	end

	local objectID = SceneObject(pNpc):getObjectID()
	local dance = readStringData("aiDancer:dance:" .. objectID)

	if (dance == nil or dance == "") then
		dance = "popular"
	end

	if (not CreatureObject(pNpc):isDancing()) then
		CreatureObject(pNpc):startDance(dance)
	end

	createEvent(1 * 1000, "DancerBufferMaintenance", "maintainHAM", pNpc, "")
end

function DancerBufferSpawns:announceCantinaServices(pNpc)
	if (pNpc == nil) then
		return
	end

	spatialChat(pNpc, "Welcome, traveler. Enjoy the performance, and remember—a generous tip earns a better show.")
	createEvent(3 * 60 * 1000, "DancerBufferSpawns", "announceCantinaServices", pNpc, "")
end
