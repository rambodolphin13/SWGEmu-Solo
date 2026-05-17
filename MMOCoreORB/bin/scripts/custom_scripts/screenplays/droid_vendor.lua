DroidVendor = ScreenPlay:new {
	numberOfActs = 1
}

DroidVendor.categories = {
	{ name = "Basic Droid Deeds", items = {
		{ name = "3PO Protocol Droid", template = "object/tangible/deed/pet_deed/deed_3p0_basic.iff", price = 25000 },
		{ name = "Binary Load Lifter", template = "object/tangible/deed/pet_deed/deed_binary_load_lifter_basic.iff", price = 25000 },
		{ name = "DZ70 Fugitive Tracker Droid", template = "object/tangible/deed/pet_deed/deed_dz70_basic.iff", price = 25000 },
		{ name = "LE Repair Droid", template = "object/tangible/deed/pet_deed/deed_le_repair_basic.iff", price = 25000 },
		{ name = "MSE Droid", template = "object/tangible/deed/pet_deed/deed_mse_basic.iff", price = 15000 },
		{ name = "Power Droid", template = "object/tangible/deed/pet_deed/deed_power_basic.iff", price = 25000 },
		{ name = "Probot Droid", template = "object/tangible/deed/pet_deed/deed_probot_basic.iff", price = 30000 },
		{ name = "Surgical Droid", template = "object/tangible/deed/pet_deed/deed_surgical_basic.iff", price = 35000 },
		{ name = "Treadwell Droid", template = "object/tangible/deed/pet_deed/deed_treadwell_basic.iff", price = 25000 },
	} },

	{ name = "Astromech Droid Deeds", items = {
		{ name = "R2 Droid", template = "object/tangible/deed/pet_deed/deed_r2_basic.iff", price = 30000 },
		{ name = "R3 Droid", template = "object/tangible/deed/pet_deed/deed_r3_basic.iff", price = 30000 },
		{ name = "R4 Droid", template = "object/tangible/deed/pet_deed/deed_r4_basic.iff", price = 30000 },
		{ name = "R5 Droid", template = "object/tangible/deed/pet_deed/deed_r5_basic.iff", price = 30000 },
	} },

	{ name = "Advanced Droid Deeds", items = {
		{ name = "Advanced 3PO Protocol Droid", template = "object/tangible/deed/pet_deed/deed_3p0_advanced_basic.iff", price = 75000 },
		{ name = "Advanced Binary Load Lifter", template = "object/tangible/deed/pet_deed/deed_binary_load_lifter_advanced_basic.iff", price = 75000 },
		{ name = "Advanced DZ70 Fugitive Tracker Droid", template = "object/tangible/deed/pet_deed/deed_dz70_advanced_basic.iff", price = 75000 },
		{ name = "Advanced LE Repair Droid", template = "object/tangible/deed/pet_deed/deed_le_repair_advanced_basic.iff", price = 75000 },
		{ name = "Advanced MSE Droid", template = "object/tangible/deed/pet_deed/deed_mse_advanced_basic.iff", price = 50000 },
		{ name = "Advanced Power Droid", template = "object/tangible/deed/pet_deed/deed_power_advanced_basic.iff", price = 75000 },
		{ name = "Advanced Probot Droid", template = "object/tangible/deed/pet_deed/deed_probot_advanced_basic.iff", price = 85000 },
		{ name = "Advanced Surgical Droid", template = "object/tangible/deed/pet_deed/deed_surgical_advanced_basic.iff", price = 100000 },
		{ name = "Advanced Treadwell Droid", template = "object/tangible/deed/pet_deed/deed_treadwell_advanced_basic.iff", price = 75000 },
	} },

	{ name = "Advanced Astromech Droid Deeds", items = {
		{ name = "Advanced R2 Droid", template = "object/tangible/deed/pet_deed/deed_r2_advanced_basic.iff", price = 85000 },
		{ name = "Advanced R3 Droid", template = "object/tangible/deed/pet_deed/deed_r3_advanced_basic.iff", price = 85000 },
		{ name = "Advanced R4 Droid", template = "object/tangible/deed/pet_deed/deed_r4_advanced_basic.iff", price = 85000 },
		{ name = "Advanced R5 Droid", template = "object/tangible/deed/pet_deed/deed_r5_advanced_basic.iff", price = 85000 },
	} },

	{ name = "Droid Supplies", items = {
		{ name = "Droid Battery", template = "object/tangible/droid_battery/battery.iff", price = 1000 },
		{ name = "Droid Space Memory Module 1", template = "object/tangible/droid/droid_space_memory_module_1.iff", price = 5000 },
		{ name = "Navicomputer 1", template = "object/tangible/droid/navicomputer_1.iff", price = 5000 },
		{ name = "Navicomputer 2", template = "object/tangible/droid/navicomputer_2.iff", price = 10000 },
		{ name = "Navicomputer 3", template = "object/tangible/droid/navicomputer_3.iff", price = 15000 },
		{ name = "Navicomputer 4", template = "object/tangible/droid/navicomputer_4.iff", price = 20000 },
		{ name = "Navicomputer 5", template = "object/tangible/droid/navicomputer_5.iff", price = 25000 },
		{ name = "Navicomputer 6", template = "object/tangible/droid/navicomputer_6.iff", price = 30000 },
	} },
}

registerScreenPlay("DroidVendor", true)

function DroidVendor:start()
end

function DroidVendor:openCategoryMenu(pPlayer, pNpc)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiListBox.new("DroidVendor", "handleCategorySelection")
	sui.setTargetNetworkId(SceneObject(pNpc):getObjectID())
	sui.setTitle("Droid Dealer")
	sui.setPrompt("Choose a droid category.")

	for i = 1, #self.categories, 1 do
		sui.add(self.categories[i].name, tostring(i - 1))
	end

	sui.sendTo(pPlayer)
end

function DroidVendor:handleCategorySelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid droid category selection.")
		return
	end

	local categoryIndex = selectedIndex + 1

	if (self.categories[categoryIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid droid category.")
		return
	end

	self:openItemMenu(pPlayer, categoryIndex)
end

function DroidVendor:openItemMenu(pPlayer, categoryIndex)
	if (pPlayer == nil) then
		return
	end

	local category = self.categories[categoryIndex]

	if (category == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid droid category.")
		return
	end

	writeData(SceneObject(pPlayer):getObjectID() .. ":droidVendorCategory", categoryIndex)

	local sui = SuiListBox.new("DroidVendor", "handleItemSelection")
	sui.setTitle(category.name)
	sui.setPrompt("Select an item to buy. Prices are shown beside each item.")

	for i = 1, #category.items, 1 do
		local item = category.items[i]
		sui.add(item.name .. " - " .. item.price .. " credits", tostring(i - 1))
	end

	sui.sendTo(pPlayer)
end

function DroidVendor:handleItemSelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local categoryIndex = readData(SceneObject(pPlayer):getObjectID() .. ":droidVendorCategory")
	deleteData(SceneObject(pPlayer):getObjectID() .. ":droidVendorCategory")

	if (categoryIndex == nil or categoryIndex == 0 or self.categories[categoryIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid droid category.")
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid droid item selection.")
		return
	end

	local itemIndex = selectedIndex + 1
	local category = self.categories[categoryIndex]

	if (category.items[itemIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid droid item.")
		return
	end

	self:buyItem(pPlayer, category.items[itemIndex])
end

function DroidVendor:buyItem(pPlayer, item)
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
		CreatureObject(pPlayer):sendSystemMessage("Unable to create item: " .. item.name .. " template: " .. item.template)
		return
	end

	CreatureObject(pPlayer):subtractCashCredits(price)
	CreatureObject(pPlayer):sendSystemMessage("Purchased: " .. item.name .. " for " .. price .. " credits.")
end
