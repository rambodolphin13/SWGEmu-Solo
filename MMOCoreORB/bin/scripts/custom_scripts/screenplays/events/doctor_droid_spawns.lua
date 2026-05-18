DoctorDroidSpawns = ScreenPlay:new {
	numberOfActs = 1,

	-- Add/remove doctor droid buffer spawn locations here.
	--
	-- Use the "Show my spawn location" conversation helper and copy the generated spawn line.
	--
	-- Format:
	-- { planet = "tatooine", x = X, z = Z, y = Y, heading = HEADING, cellID = CELL_ID, name = "Medix-01" },

	spawnLocations = {
		-- Example only. Leave commented until you are ready to add real world spawns:
		-- { planet = "tatooine", x = 3500.000, z = 5.000, y = -4800.000, heading = 90, cellID = 0, name = "Medix-01" },
		{ planet = "tatooine", x = -0.22737866640091, z = -0.37821659445763, y = -4.7390251159668, heading = 90, cellID = 1590893, name = "Medix-01" },
	}
}

registerScreenPlay("DoctorDroidSpawns", true)

function DoctorDroidSpawns:start()
	self:spawnDroids()
end

function DoctorDroidSpawns:spawnDroids()
	for i = 1, #self.spawnLocations, 1 do
		local loc = self.spawnLocations[i]

		local pNpc = spawnMobile(loc.planet, "doctor_droid", 0, loc.x, loc.z, loc.y, loc.heading, loc.cellID)

		if (pNpc ~= nil) then
			local displayName = "Doctor Droid"

			if (loc.name ~= nil and loc.name ~= "") then
				displayName = loc.name .. " (Doctor Droid)"
			end

			SceneObject(pNpc):setCustomObjectName(displayName)

			if (SceneObject(pNpc):isAiAgent()) then
				AiAgent(pNpc):addObjectFlag(AI_STATIC)
				AiAgent(pNpc):addObjectFlag(AI_STATIONARY)
				AiAgent(pNpc):setWait(999999)
			end

			CreatureObject(pNpc):clearOptionBit(AIENABLED)
		end
	end
end
