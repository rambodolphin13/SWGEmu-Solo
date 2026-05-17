JawaMarketSpawner = ScreenPlay:new {
	numberOfActs = 1
}

-- ==========================================================
-- Jawa Market Startup Spawner
--
-- This is a manual list. Add only the vendors you want.
--
-- spawnMobile uses:
-- spawnMobile(planet, mobileTemplate, respawnSeconds, x, z, y, heading, cellID)
--
-- For outside spawns, cellID = 0.
-- ==========================================================

JawaMarketSpawner.planet = "tatooine"

JawaMarketSpawner.vendors = {
	-- EXAMPLES:
	-- { template = "structure_deed_vendor", x = 3530.77, z = 5, y = -4799.78, heading = 180, cellID = 0 },
	-- { template = "weapon_armor_vendor", x = 3533.77, z = 5, y = -4799.78, heading = 180, cellID = 0 },
	-- { template = "jawa_black_market_vendor", x = 3536.77, z = 5, y = -4799.78, heading = 180, cellID = 0 },
}

registerScreenPlay("JawaMarketSpawner", true)

function JawaMarketSpawner:start()
	self:spawnMarket()
end

function JawaMarketSpawner:spawnMarket()
	for i = 1, #self.vendors, 1 do
		local vendor = self.vendors[i]

		if (vendor.template ~= nil and vendor.x ~= nil and vendor.y ~= nil and vendor.z ~= nil) then
			local heading = vendor.heading or 180
			local cellID = vendor.cellID or 0
			local respawn = vendor.respawnSeconds or 60

			spawnMobile(self.planet, vendor.template, respawn, vendor.x, vendor.z, vendor.y, heading, cellID)
		end
	end
end
