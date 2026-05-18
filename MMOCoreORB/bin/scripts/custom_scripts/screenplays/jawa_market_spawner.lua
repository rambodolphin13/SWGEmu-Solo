JawaMarketSpawner = ScreenPlay:new {
	numberOfActs = 1
}

registerScreenPlay("JawaMarketSpawner", true)

function JawaMarketSpawner:start()
	self:spawnVendors()
end

function JawaMarketSpawner:spawnVendors()
	spawnMobile("tatooine", "structure_deed_vendor", 0, 3497.2553710938, 5.5224609375, -4938.966796875, 0, 0)
	spawnMobile("tatooine", "weapon_armor_vendor", 0, 3496.8471679688, 5.5224609375, -4939.4951171875, 0, 0)
	spawnMobile("tatooine", "droid_vendor", 0, 3493.8498535156, 5.5224609375, -4941.5537109375, 0, 0)
	spawnMobile("tatooine", "consumables_vendor", 0, 3492.3803710938, 5.5224609375, -4943.734375, 0, 0)
	spawnMobile("tatooine", "jawa_buyer", 0, 3493.0805664062, 5.5244140625, -4947.1572265625, 0, 0)
	spawnMobile("tatooine", "jawa_black_market_vendor", 0, 3494.2751464844, 5.5244140625, -4947.8115234375, 0, 0)
	spawnMobile("tatooine", "vehicle_deed_vendor", 0, 3496.7456054688, 5.5244140625, -4949.6538085938, 0, 0)
	spawnMobile("tatooine", "starship_vendor", 0, 3498.1643066406, 5.5244140625, -4950.6450195312, 0, 0)
	spawnMobile("tatooine", "crafting_vendor", 0, 3501.2651367188, 5.5224609375, -4950.6811523438, 0, 0)
	spawnMobile("tatooine", "decor_vendor", 0, 3502.3459472656, 5.5224609375, -4948.4140625, 0, 0)
	spawnMobile("tatooine", "veteran_reward_vendor", 0, 3504.169921875, 5.5224609375, -4946.0517578125, 0, 0)
end
