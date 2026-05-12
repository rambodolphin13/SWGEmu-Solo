MusicianBufferSpawns = ScreenPlay:new {
	numberOfActs = 1,

	spawnLocations = {
		-- Replace with your desired musician locations.
		{ planet = "tatooine", x = 3449.0, z = 4.105, y = -4829.0, heading = 0, cellID = 0, name = "Rinna Valen" },
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
			local displayName = "Musician Buffer"

			if (loc.name ~= nil and loc.name ~= "") then
				displayName = loc.name .. " (Musician Buffer)"
			end

			SceneObject(pNpc):setCustomObjectName(displayName)
		end
	end
end
