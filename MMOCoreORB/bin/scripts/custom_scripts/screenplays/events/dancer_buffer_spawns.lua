DancerBufferSpawns = ScreenPlay:new {
	numberOfActs = 1,

	-- Add/remove dancer buffer spawn locations here.
	--
	-- Outdoor spawns use world coordinates with cellID = 0.
	-- Indoor spawns use local cell coordinates with the correct cellID.
	--
	-- Format:
	-- { planet = "tatooine", x = X, z = Z, y = Y, heading = HEADING, cellID = CELL_ID, name = "Vessa Talorin" },

	spawnLocations = {
		
		{ planet = "tatooine", x = 6.7809844017029, z = -0.89499121904373, y = -9.8907890319824, heading = 0, cellID = 1082877, name = "Vessa Talorin" },
		{ planet = "tatooine", x = 6.7809844017029, z = -0.89499121904373, y = -9.8907890319824, heading = 0, cellID = 1028647, name = "Roxy McDances" },

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
			local displayName = "Dancer Buffer"

			if (loc.name ~= nil and loc.name ~= "") then
				displayName = loc.name .. " (Dancer Buffer)"
			end

			SceneObject(pNpc):setCustomObjectName(displayName)

			-- Start her real popular dance shortly after spawn.
			createEvent(5 * 1000, "DancerBufferSpawns", "startPerformance", pNpc, "")
		end
	end
end

function DancerBufferSpawns:startPerformance(pNpc)
	if (pNpc == nil) then
		return
	end

	local startedDance = CreatureObject(pNpc):startDance("popular")

	if (startedDance) then
		createEvent(1 * 1000, "DancerBufferMaintenance", "maintainHAM", pNpc, "")
	end
end
