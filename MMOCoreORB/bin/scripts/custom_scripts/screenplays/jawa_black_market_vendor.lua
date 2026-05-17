JawaBlackMarketVendor = ScreenPlay:new {
	numberOfActs = 1
}

-- TEST VALUE:
-- 120 seconds = 2 minutes.
-- After testing, change this to 10800 for 3 hours.
JawaBlackMarketVendor.rotationSeconds = 10800
JawaBlackMarketVendor.itemsPerRotation = 10
JawaBlackMarketVendor.maxStockPerItem = 2
JawaBlackMarketVendor.dataPrefix = "jawaBlackMarketVendor"

JawaBlackMarketVendor.itemPool = {
	-- Krayt
	{ name = "Krayt Dragon Pearl", type = "loot", loot = "krayt_dragon_pearl", level = 300, price = 5000000 },
	{ name = "Legendary Krayt Composite Armor Segment", type = "loot", loot = "krayt_composite_segment", level = 300, price = 750000, boostArmor = true },
	{ name = "Krayt Armor Enhancement Segment", type = "loot", loot = "krayt_dragon_scales", level = 300, price = 750000   , quantity = 100 },
	{ name = "Legendary Krayt Blaster Power Handler Enhancement", type = "loot", loot = "krayt_dragon_tissue_common", level = 300, price = 750000, boostArmor = true },

	-- Acklay
	{ name = "Acklay Bone Armor Segment", template = "object/tangible/component/armor/armor_segment_bone_acklay.iff", price = 850000 },
	{ name = "Legendary Acklay Padded Armor Segment", type = "loot", loot = "acklay_hide", level = 300, price = 850000, boostArmor = true },
	{ name = "Acklay RIS Armor Segment", template = "object/tangible/component/armor/armor_segment_ris_acklay.iff", price = 850000 },
	{ name = "Legendary Acklay Bone Reinforcement Core", type = "loot", loot = "acklay_bones_rare", level = 300, price = 850000, boostArmor = true },
	{ name = "Legendary Acklay Venom", type = "loot", loot = "acklay_venom", level = 300, price = 600000, boostArmor = true },

	-- RIS / creature rare armor components
	{ name = "RIS Armor Segment", template = "object/tangible/component/armor/armor_segment_ris.iff", price = 600000 },
	{ name = "RIS Armor Layer", template = "object/tangible/component/armor/armor_layer_ris.iff", price = 600000  , quantity = 100 },
	{ name = "Legendary Giant Dune Kimogila Scale", type = "loot", loot = "giant_dune_kimogila_scale", level = 300, price = 650000, boostArmor = true },
	{ name = "Legendary Kimogila Bone Armor Segment", type = "loot", loot = "kimogila_bone_segment", level = 300, price = 650000, boostArmor = true },
	{ name = "Legendary Kimogila Armor Enhancement Segment", type = "loot", loot = "kimogila_scales", level = 300, price = 650000  },
	{ name = "Legendary Gurk King Hide", type = "loot", loot = "gurk_king_hide", level = 300, price = 650000, boostArmor = true },
	{ name = "Legendary Peko Albatross Feather", type = "loot", loot = "peko_albatross_feather", level = 300, price = 500000, boostArmor = true },
	{ name = "Legendary Woolamander Harrower Bone Fragment", type = "loot", loot = "woolamander_harrower_bone_fragments", level = 300, price = 650000, boostArmor = true },

	-- Nightsister
	{ name = "Nightsister Armor Enhancement Segment", type = "loot", loot = "nightsister_shards", level = 300, price = 650000   , quantity = 100 },
	{ name = "Nightsister Armor Layer", type = "loot", loot = "nightsister_layer", level = 300, price = 650000   , quantity = 100 },
	{ name = "Legendary Nightsister Vibro Unit", type = "loot", loot = "nightsister_vibro_unit", level = 300, price = 650000, boostArmor = true },

	-- Janta
	{ name = "Legendary Janta Blood", type = "loot", loot = "janta_blood", level = 300, price = 500000 , quantity = 100 },
	{ name = "Janta Armor Enhancement Segment", type = "loot", loot = "janta_hides", level = 300, price = 650000   , quantity = 100 },

	-- Geonosian
	{ name = "Legendary Geonosian Power Cube", type = "loot", loot = "geo_power_cube_white", level = 300, price = 500000, boostArmor = true },
	{ name = "Legendary Geonosian Red Power Cube", type = "loot", loot = "geo_power_cube_red", level = 300, price = 600000, boostArmor = true },
	{ name = "Legendary Geonosian Green Power Cube", type = "loot", loot = "geo_power_cube_green", level = 300, price = 600000, boostArmor = true },
	{ name = "Legendary Geonosian Yellow Power Cube", type = "loot", loot = "geo_power_cube_yellow", level = 300, price = 600000, boostArmor = true },
	{ name = "Legendary Geonosian Sword Core", type = "loot", loot = "geo_sword_core", level = 300, price = 600000, boostArmor = true },
	{ name = "Legendary Geonosian Reinforcement Core", type = "loot", loot = "geo_reinforcement_core", level = 300, price = 600000, boostArmor = true },
	{ name = "Legendary Geonosian Solidifying Agent", type = "loot", loot = "geo_solidifying_agent", level = 300, price = 500000, boostArmor = true },

	-- Other rare weapon components
	{ name = "Legendary Gorax Projectile Feed Mechanism Enhancement", type = "loot", loot = "gorax_bone_shards_rare", level = 300, price = 650000, boostArmor = true },

	-- Rare weapons
	{ name = "Legendary Tenloss DXR-6 Disruptor Rifle", type = "loot", loot = "rifle_tenloss_dxr6_disruptor", level = 300, price = 2000000, boostArmor = true },
	{ name = "Legendary Geonosian Sonic Blaster", type = "loot", loot = "geo_sonic_blaster", level = 300, price = 1500000, boostArmor = true },
	{ name = "Nym Slugthrower Carbine", template = "object/weapon/ranged/carbine/carbine_nym_slugthrower.iff", price = 1500000 },
	{ name = "Nightsister Lance", template = "object/weapon/melee/polearm/lance_nightsister.iff", price = 1500000 },
	{ name = "Legendary Janta Knife", type = "loot", loot = "knife_janta", level = 300, price = 1000000, boostArmor = true },
	{ name = "Legendary Janta Staff", type = "loot", loot = "polearm_staff_janta", level = 300, price = 1000000, boostArmor = true },

	-- Rare armor samples
	{ name = "Legendary RIS Armor Chest Plate", template = "object/tangible/wearables/armor/ris/armor_ris_chest_plate.iff", price = 2000000 , boostArmor = true },
	{ name = "Legendary RIS Armor Helmet", template = "object/tangible/wearables/armor/ris/armor_ris_helmet.iff", price = 1500000 , boostArmor = true },
	{ name = "Legendary Mandalorian Armor Chest Plate", template = "object/tangible/wearables/armor/mandalorian/armor_mandalorian_chest_plate.iff", price = 3000000 , boostArmor = true },
	{ name = "Legendary Mandalorian Armor Helmet", template = "object/tangible/wearables/armor/mandalorian/armor_mandalorian_helmet.iff", price = 2500000 , boostArmor = true },
	{ name = "Legendary Marauder Armor Chest Plate", template = "object/tangible/wearables/armor/marauder/armor_marauder_s03_chest_plate.iff", price = 1500000 , boostArmor = true },

	-- Black Sun / Death Watch
	{ name = "Black Sun Medallion", template = "object/tangible/loot/misc/medallion_black_sun_s01.iff", price = 750000 },
	{ name = "Jetpack Base", template = "object/tangible/loot/dungeon/death_watch_bunker/jetpack_base.iff", price = 1250000 },
	{ name = "Binary Liquid", template = "object/tangible/loot/dungeon/death_watch_bunker/binary_liquid.iff", price = 1000000 },
	{ name = "Jetpack Stabilizer", template = "object/tangible/loot/dungeon/death_watch_bunker/jetpack_stabilizer.iff", price = 1000000 },
	{ name = "Ducted Fan", template = "object/tangible/loot/dungeon/death_watch_bunker/ducted_fan.iff", price = 1000000 },
	{ name = "Fuel Injector Tank", template = "object/tangible/loot/dungeon/death_watch_bunker/fuel_injector_tank.iff", price = 1000000 },
	{ name = "Fuel Dispersion Unit", template = "object/tangible/loot/dungeon/death_watch_bunker/fuel_dispersion_unit.iff", price = 1000000 },

	-- Utility discount items
	{ name = "Anti Decay Kit", template = "object/tangible/veteran_reward/antidecay.iff", price = 500000 },
	{ name = "Resource Deed", template = "object/tangible/veteran_reward/resource.iff", price = 50000 },
}

registerScreenPlay("JawaBlackMarketVendor", true)

function JawaBlackMarketVendor:start()
end

function JawaBlackMarketVendor:getNow()
	if (os ~= nil and os.time ~= nil) then
		return os.time()
	end

	if (getTimestamp ~= nil) then
		return getTimestamp()
	end

	-- Fallback only. If your Lua environment has neither os.time nor getTimestamp,
	-- rotation will advance each time this function is forced.
	local fallback = readData(self.dataPrefix .. ":fallbackTime")
	fallback = fallback + self.rotationSeconds
	writeData(self.dataPrefix .. ":fallbackTime", fallback)

	return fallback
end

function JawaBlackMarketVendor:getKey(name)
	return self.dataPrefix .. ":" .. name
end

function JawaBlackMarketVendor:getSlotKey(slot, name)
	return self.dataPrefix .. ":slot:" .. slot .. ":" .. name
end

function JawaBlackMarketVendor:openStockMenu(pPlayer, pNpc)
	if (pPlayer == nil) then
		return
	end

	self:checkRotation()

	local rotationID = readData(self:getKey("rotationID"))
	writeData(SceneObject(pPlayer):getObjectID() .. ":jawaBlackMarketRotationID", rotationID)

	local lastRotation = readData(self:getKey("lastRotation"))
	local now = self:getNow()
	local nextRotation = lastRotation + self.rotationSeconds
	local secondsLeft = nextRotation - now

	if (secondsLeft < 0) then
		secondsLeft = 0
	end

	local sui = SuiListBox.new("JawaBlackMarketVendor", "handleStockSelection")
	sui.setTargetNetworkId(SceneObject(pNpc):getObjectID())
	sui.setTitle("Jawa Black Market Dealer")
	sui.setPrompt("Limited stock. Rotation test timer: " .. secondsLeft .. " second(s) remaining.")

	for slot = 1, self.itemsPerRotation, 1 do
		local poolIndex = readData(self:getSlotKey(slot, "poolIndex"))
		local remaining = readData(self:getSlotKey(slot, "remaining"))
		local item = self.itemPool[poolIndex]

		if (item ~= nil) then
			local itemLabel = item.name

			if (item.quantity ~= nil and item.quantity > 1) then
				itemLabel = itemLabel .. " x" .. item.quantity
			end

			local line = itemLabel .. " - " .. item.price .. " credits"

			if (remaining <= 0) then
				line = line .. " - SOLD OUT"
			else
				line = line .. " - Stock: " .. remaining
			end

			sui.add(line, tostring(slot - 1))
		end
	end

	sui.sendTo(pPlayer)
end

function JawaBlackMarketVendor:handleStockSelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid black market selection.")
		return
	end

	local playerRotationID = readData(SceneObject(pPlayer):getObjectID() .. ":jawaBlackMarketRotationID")
	deleteData(SceneObject(pPlayer):getObjectID() .. ":jawaBlackMarketRotationID")

	self:checkRotation()

	local currentRotationID = readData(self:getKey("rotationID"))

	if (playerRotationID ~= currentRotationID) then
		CreatureObject(pPlayer):sendSystemMessage("The black market stock changed. Open the vendor again.")
		return
	end

	local slot = selectedIndex + 1

	if (slot < 1 or slot > self.itemsPerRotation) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid black market slot.")
		return
	end

	self:buySlotItem(pPlayer, slot)
end

function JawaBlackMarketVendor:buySlotItem(pPlayer, slot)
	if (pPlayer == nil or slot == nil) then
		return
	end

	local poolIndex = readData(self:getSlotKey(slot, "poolIndex"))
	local remaining = readData(self:getSlotKey(slot, "remaining"))
	local item = self.itemPool[poolIndex]

	if (item == nil) then
		CreatureObject(pPlayer):sendSystemMessage("That black market item is no longer available.")
		return
	end

	if (remaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("That item is sold out.")
		return
	end

	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Unable to locate your inventory.")
		return
	end

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is full.")
		return
	end

	local price = item.price or 0

	if (CreatureObject(pPlayer):getCashCredits() < price) then
		CreatureObject(pPlayer):sendSystemMessage("You need " .. price .. " credits to buy this item.")
		return
	end

	local quantity = item.quantity or 1
	local pItem = self:createPurchasedItem(pInventory, item)

	if (pItem == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Unable to create item: " .. item.name)
		return
	end

	if (quantity > 1) then
		TangibleObject(pItem):setUseCount(quantity)
	end

	if (item.boostArmor == true) then
		TangibleObject(pItem):boostArmorResists(75)
	end

	CreatureObject(pPlayer):subtractCashCredits(price)

	remaining = remaining - 1
	writeData(self:getSlotKey(slot, "remaining"), remaining)

	local itemLabel = item.name

	if (quantity > 1) then
		itemLabel = itemLabel .. " x" .. quantity
	end

	CreatureObject(pPlayer):sendSystemMessage("Purchased: " .. itemLabel .. " for " .. price .. " credits. Remaining stock: " .. remaining)
end

function JawaBlackMarketVendor:createPurchasedItem(pInventory, item)
	if (pInventory == nil or item == nil) then
		return nil
	end

	if (item.type == "loot") then
		local level = item.level or 300
		local objectID = SceneObject(pInventory):createLootItem(item.loot, level, true)

		if (objectID == nil or objectID == 0) then
			return nil
		end

		return self:getContainerObjectById(pInventory, objectID)
	end

	if (item.template == nil) then
		return nil
	end

	return giveItem(pInventory, item.template, -1, true)
end

function JawaBlackMarketVendor:getContainerObjectById(pContainer, objectID)
	if (pContainer == nil or objectID == nil or objectID == 0) then
		return nil
	end

	local containerSize = SceneObject(pContainer):getContainerObjectsSize()

	for i = 0, containerSize - 1, 1 do
		local pObject = SceneObject(pContainer):getContainerObject(i)

		if (pObject ~= nil and SceneObject(pObject):getObjectID() == objectID) then
			return pObject
		end
	end

	return nil
end

function JawaBlackMarketVendor:checkRotation()
	local now = self:getNow()
	local lastRotation = readData(self:getKey("lastRotation"))

	if (lastRotation == nil or lastRotation == 0) then
		self:generateRotation(now)
		return
	end

	if ((now - lastRotation) >= self.rotationSeconds) then
		self:generateRotation(now)
	end
end

function JawaBlackMarketVendor:generateRotation(now)
	if (now == nil or now == 0) then
		now = self:getNow()
	end

	local poolSize = #self.itemPool

	if (poolSize < self.itemsPerRotation) then
		return
	end

	if (math ~= nil and math.randomseed ~= nil) then
		math.randomseed(now)
	end

	local used = {}

	for slot = 1, self.itemsPerRotation, 1 do
		local poolIndex = self:getRandomUnusedPoolIndex(used, poolSize)
		used[poolIndex] = true

		writeData(self:getSlotKey(slot, "poolIndex"), poolIndex)
		writeData(self:getSlotKey(slot, "remaining"), self.maxStockPerItem)
	end

	writeData(self:getKey("lastRotation"), now)
	writeData(self:getKey("rotationID"), now)
end

function JawaBlackMarketVendor:getRandomUnusedPoolIndex(used, poolSize)
	local tries = 0

	while (tries < 200) do
		local index = math.random(1, poolSize)

		if (used[index] ~= true) then
			return index
		end

		tries = tries + 1
	end

	for index = 1, poolSize, 1 do
		if (used[index] ~= true) then
			return index
		end
	end

	return 1
end
