print("JawaMarketSpawner: file loaded")
JawaMarketSpawner = ScreenPlay:new {
	numberOfActs = 1,

	-- Add/remove Jawa market vendor spawn locations here.
	--
	-- Outdoor spawns use world coordinates with cellID = 0.
	-- Indoor spawns use local cell coordinates with the correct cellID.
	--
	-- Format:
	-- { planet = "tatooine", template = "vendor_template", x = X, z = Z, y = Y, heading = HEADING, cellID = CELL_ID },

	spawnLocations = {
		{ planet = "tatooine", template = "structure_deed_vendor", x = 3497.2553710938, z = 5.5224609375, y = -4938.966796875, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "weapon_armor_vendor", x = 3496.8471679688, z = 5.5224609375, y = -4939.4951171875, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "droid_vendor", x = 3493.8498535156, z = 5.5224609375, y = -4941.5537109375, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "consumables_vendor", x = 3492.3803710938, z = 5.5224609375, y = -4943.734375, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "jawa_buyer", x = 3493.0805664062, z = 5.5244140625, y = -4947.1572265625, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "jawa_black_market_vendor", x = 3494.2751464844, z = 5.5244140625, y = -4947.8115234375, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "vehicle_deed_vendor", x = 3496.7456054688, z = 5.5244140625, y = -4949.6538085938, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "starship_vendor", x = 3498.1643066406, z = 5.5244140625, y = -4950.6450195312, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "crafting_vendor", x = 3501.2651367188, z = 5.5224609375, y = -4950.6811523438, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "decor_vendor", x = 3502.3459472656, z = 5.5224609375, y = -4948.4140625, heading = 0, cellID = 0 },
		{ planet = "tatooine", template = "veteran_reward_vendor", x = 3504.169921875, z = 5.5224609375, y = -4946.0517578125, heading = 0, cellID = 0 },
	}
}

registerScreenPlay("JawaMarketSpawner", true)

function JawaMarketSpawner:start()
	print("JawaMarketSpawner: start called")
	self:spawnVendors()
end

function JawaMarketSpawner:spawnVendors()
	for i = 1, #self.spawnLocations, 1 do
		local loc = self.spawnLocations[i]

		spawnMobile(loc.planet, loc.template, 0, loc.x, loc.z, loc.y, loc.heading, loc.cellID)
	end
end
