VehicleDeedVendor = ScreenPlay:new {
	numberOfActs = 1
}

-- WARNING: These requested kit templates were not found locally and were not added to avoid unknown CRC errors: Vehicle Repair Kit

VehicleDeedVendor.categories = {
	{ name = "Landspeeders", items = {
		{ name = "Landspeeder AV21", template = "object/tangible/deed/vehicle_deed/landspeeder_av21_deed.iff", price = 5000 },
		{ name = "Landspeeder X31", template = "object/tangible/deed/vehicle_deed/landspeeder_x31_deed.iff", price = 5000 },
		{ name = "Landspeeder X34", template = "object/tangible/deed/vehicle_deed/landspeeder_x34_deed.iff", price = 5000 },
	} },
	{ name = "Bikes", items = {
		{ name = "Speederbike", template = "object/tangible/deed/vehicle_deed/speederbike_deed.iff", price = 7500 },
		{ name = "Speederbike Flash", template = "object/tangible/deed/vehicle_deed/speederbike_flash_deed.iff", price = 7500 },
		{ name = "Speederbike Swoop", template = "object/tangible/deed/vehicle_deed/speederbike_swoop_deed.iff", price = 7500 },
	} },
	{ name = "Jetpack", items = {
		{ name = "Jetpack", template = "object/tangible/deed/vehicle_deed/jetpack_deed.iff", price = 1000000 },
	} },
	{ name = "Vehicle Kits", items = {
		{ name = "Vehicle Customization Kit", template = "object/tangible/item/vehicle_customization.iff", price = 2500 },
	} },
}

registerScreenPlay("VehicleDeedVendor", true)

function VehicleDeedVendor:start()
end

function VehicleDeedVendor:openCategoryMenu(pPlayer, pNpc)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiListBox.new("VehicleDeedVendor", "handleCategorySelection")
	sui.setTargetNetworkId(SceneObject(pNpc):getObjectID())
	sui.setTitle("Vehicle Dealer")
	sui.setPrompt("Choose a vehicle category. Landspeeders cost 5000 credits, bikes cost 7500 credits, jetpacks cost 1000000 credits, and kits cost 2500 credits.")

	for i = 1, #self.categories, 1 do
		-- Use zero-based values because this Core3 SUI behaves zero-based.
		sui.add(self.categories[i].name, tostring(i - 1))
	end

	sui.sendTo(pPlayer)
end

function VehicleDeedVendor:handleCategorySelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid vehicle category selection.")
		return
	end

	local categoryIndex = selectedIndex + 1

	if (self.categories[categoryIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid vehicle category.")
		return
	end

	self:openItemMenu(pPlayer, categoryIndex)
end

function VehicleDeedVendor:openItemMenu(pPlayer, categoryIndex)
	if (pPlayer == nil) then
		return
	end

	local category = self.categories[categoryIndex]

	if (category == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid vehicle category.")
		return
	end

	writeData(SceneObject(pPlayer):getObjectID() .. ":vehicleDeedVendorCategory", categoryIndex)

	local sui = SuiListBox.new("VehicleDeedVendor", "handleItemSelection")
	sui.setTitle(category.name)
	sui.setPrompt("Select an item to buy. Prices are shown beside each item.")

	for i = 1, #category.items, 1 do
		local item = category.items[i]
		-- Use zero-based values to match the category menu.
		sui.add(item.name .. " - " .. item.price .. " credits", tostring(i - 1))
	end

	sui.sendTo(pPlayer)
end

function VehicleDeedVendor:handleItemSelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local categoryIndex = readData(SceneObject(pPlayer):getObjectID() .. ":vehicleDeedVendorCategory")
	deleteData(SceneObject(pPlayer):getObjectID() .. ":vehicleDeedVendorCategory")

	if (categoryIndex == nil or categoryIndex == 0 or self.categories[categoryIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid vehicle category.")
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid vehicle item selection.")
		return
	end

	local itemIndex = selectedIndex + 1
	local category = self.categories[categoryIndex]

	if (category.items[itemIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid vehicle item.")
		return
	end

	self:buyItem(pPlayer, category.items[itemIndex])
end

function VehicleDeedVendor:buyItem(pPlayer, item)
	if (pPlayer == nil or item == nil) then
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

	local pItem = giveItem(pInventory, item.template, -1, true)

	if (pItem == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Unable to create item: " .. item.template)
		return
	end

	CreatureObject(pPlayer):subtractCashCredits(price)
	CreatureObject(pPlayer):sendSystemMessage("Purchased: " .. item.name .. " for " .. price .. " credits.")
end
