MusicianBufferSpawns = ScreenPlay:new {
	numberOfActs = 1,

	-- Generic AI musician buffers paired with the exact marked dancer locations.
	spawnLocations = {
		{ planet = "tatooine", x = 21.0161, z = -0.894994, y = -1.34295, heading = 81.926, cellID = 1256058, song = "starwars1" },
		{ planet = "tatooine", x = 2.28257, z = 0.999994, y = 3.65745, heading = 350.832, cellID = 1233975, song = "starwars1" },
		{ planet = "naboo", x = 20.533, z = -0.894993, y = -1.49515, heading = 142.968, cellID = 5, song = "starwars1" },
		{ planet = "naboo", x = 20.6372, z = -0.894993, y = -0.560945, heading = 84.7165, cellID = 91, song = "starwars1" },
		{ planet = "naboo", x = 20.0792, z = -0.894993, y = -1.44695, heading = 67.8157, cellID = 64, song = "starwars1" },
		{ planet = "naboo", x = 20, z = -0.894993, y = -1.56571, heading = 75.7566, cellID = 111, song = "starwars1" },
		{ planet = "naboo", x = 1.51414, z = 0.99997, y = 7.1302, heading = 339.418, cellID = 1419013, song = "starwars1" },
		{ planet = "naboo", x = 2.0585, z = 0.999975, y = 7.42453, heading = 340.684, cellID = 1865363, song = "starwars1" },
		{ planet = "corellia", x = 20.1564, z = -0.894993, y = -1.71693, heading = 71.9642, cellID = 8105496, song = "starwars1" },
		{ planet = "corellia", x = 21.4448, z = -0.894994, y = -1.33017, heading = 74.4264, cellID = 2625355, song = "starwars1" },
		{ planet = "corellia", x = 21.7596, z = -0.894994, y = -0.933886, heading = 73.1663, cellID = 3005399, song = "starwars1" },
		{ planet = "corellia", x = 21.3287, z = -0.894994, y = 0.457486, heading = 72.6928, cellID = 3075429, song = "starwars1" },
		{ planet = "talus", x = 20.8962, z = -0.894994, y = -1.83792, heading = 78.535, cellID = 3175391, song = "starwars1" },
		{ planet = "talus", x = 21.9001, z = -0.894994, y = 0.171733, heading = 86.8626, cellID = 4265375, song = "starwars1" },
	}
}

registerScreenPlay("MusicianBufferSpawns", true)

function MusicianBufferSpawns:start()
	self:spawnMusicians()
end

function MusicianBufferSpawns:spawnMusicians()
	for i = 1, #self.spawnLocations, 1 do
		local loc = self.spawnLocations[i]
		local pNpc = spawnMobile(loc.planet, "musician_buffer", 0, loc.x, loc.z, loc.y, loc.heading, loc.cellID)

		if (pNpc ~= nil) then
			SceneObject(pNpc):setCustomObjectName("Cantina Musician (Musician Buffer)")
			CreatureObject(pNpc):setScreenPlayState("AIServiceEntertainer", 2)
			writeStringData("aiMusician:song:" .. SceneObject(pNpc):getObjectID(), loc.song or "starwars1")
			createEvent((5 + i) * 1000, "MusicianBufferSpawns", "startPerformance", pNpc, "")
		end
	end
end

function MusicianBufferSpawns:startPerformance(pNpc)
	if (pNpc == nil) then
		return
	end

	local objectID = SceneObject(pNpc):getObjectID()
	local song = readStringData("aiMusician:song:" .. objectID)
	if (song == nil or song == "") then
		song = "starwars1"
	end

	if (not CreatureObject(pNpc):isPlayingMusic()) then
		CreatureObject(pNpc):startMusic(song, "slitherhorn")
	end

	createEvent(1 * 1000, "MusicianBufferMusicMaintenance", "maintainHAM", pNpc, "")
	createEvent(30 * 1000, "MusicianBufferSpawns", "checkPerformance", pNpc, "")
end

function MusicianBufferSpawns:checkPerformance(pNpc)
	if (pNpc == nil) then
		return
	end

	if (not CreatureObject(pNpc):isPlayingMusic()) then
		self:startPerformance(pNpc)
	else
		createEvent(30 * 1000, "MusicianBufferSpawns", "checkPerformance", pNpc, "")
	end
end
