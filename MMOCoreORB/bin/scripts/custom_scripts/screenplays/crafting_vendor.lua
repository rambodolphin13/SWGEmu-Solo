CraftingVendor = ScreenPlay:new {
	numberOfActs = 1
}

CraftingVendor.categories = {
	{ name = "Crafting Tools", items = {
		{ name = "Clothing and Armor Crafting Tool", template = "object/tangible/crafting/station/clothing_tool.iff", price = 2500 },
		{ name = "Food and Chemical Crafting Tool", template = "object/tangible/crafting/station/food_tool.iff", price = 2500 },
		{ name = "Generic Crafting Tool", template = "object/tangible/crafting/station/generic_tool.iff", price = 2500 },
		{ name = "Lightsaber Crafting Toolkit", template = "object/tangible/crafting/station/jedi_tool.iff", price = 2500 },
		{ name = "Starship Crafting Tool", template = "object/tangible/crafting/station/space_tool.iff", price = 2500 },
		{ name = "Structure and Furniture Crafting Tool", template = "object/tangible/crafting/station/structure_tool.iff", price = 2500 },
		{ name = "Weapon, Droid, and General Item Crafting Tool", template = "object/tangible/crafting/station/weapon_tool.iff", price = 2500 },
	} },

	{ name = "Crafting Stations", items = {
		{ name = "Clothing Crafting Station", template = "object/tangible/crafting/station/clothing_station.iff", price = 10000 },
		{ name = "Food Crafting Station", template = "object/tangible/crafting/station/food_station.iff", price = 10000 },
		{ name = "Starship Crafting Station", template = "object/tangible/crafting/station/space_station.iff", price = 10000 },
		{ name = "Structure Crafting Station", template = "object/tangible/crafting/station/structure_station.iff", price = 10000 },
		{ name = "Weapon Crafting Station", template = "object/tangible/crafting/station/weapon_station.iff", price = 10000 },
	} },

	{ name = "Survey Tools", items = {
		{ name = "Gas Survey Tool", template = "object/tangible/survey_tool/survey_tool_gas.iff", price = 2500 },
		{ name = "Chemical Survey Tool", template = "object/tangible/survey_tool/survey_tool_liquid.iff", price = 2500 },
		{ name = "Flora Survey Tool", template = "object/tangible/survey_tool/survey_tool_lumber.iff", price = 2500 },
		{ name = "Mineral Survey Tool", template = "object/tangible/survey_tool/survey_tool_mineral.iff", price = 2500 },
		{ name = "Moisture Survey Tool", template = "object/tangible/survey_tool/survey_tool_moisture.iff", price = 2500 },
		{ name = "Solar Survey Tool", template = "object/tangible/survey_tool/survey_tool_solar.iff", price = 2500 },
		{ name = "Wind Survey Tool", template = "object/tangible/survey_tool/survey_tool_wind.iff", price = 2500 },
	} },

	{ name = "Resource and Utility", items = {
		{ name = "Free Resource Deed", template = "object/tangible/veteran_reward/resource.iff", price = 100000 },
		{ name = "Self Powered Harvester", template = "object/tangible/veteran_reward/harvester.iff", price = 75000 },
	} },
}

registerScreenPlay("CraftingVendor", true)

function CraftingVendor:start()
end

function CraftingVendor:openCategoryMenu(pPlayer, pNpc)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiListBox.new("CraftingVendor", "handleCategorySelection")
	sui.setTargetNetworkId(SceneObject(pNpc):getObjectID())
	sui.setTitle("Crafting Supplier")
	sui.setPrompt("Choose a crafting supply category.")

	for i = 1, #self.categories, 1 do
		sui.add(self.categories[i].name, tostring(i - 1))
	end

	sui.sendTo(pPlayer)
end

function CraftingVendor:handleCategorySelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid crafting category selection.")
		return
	end

	local categoryIndex = selectedIndex + 1

	if (self.categories[categoryIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid crafting category.")
		return
	end

	self:openItemMenu(pPlayer, categoryIndex)
end

function CraftingVendor:openItemMenu(pPlayer, categoryIndex)
	if (pPlayer == nil) then
		return
	end

	local category = self.categories[categoryIndex]

	if (category == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid crafting category.")
		return
	end

	writeData(SceneObject(pPlayer):getObjectID() .. ":craftingVendorCategory", categoryIndex)

	local sui = SuiListBox.new("CraftingVendor", "handleItemSelection")
	sui.setTitle(category.name)
	sui.setPrompt("Select an item to buy. Prices are shown beside each item.")

	for i = 1, #category.items, 1 do
		local item = category.items[i]
		sui.add(item.name .. " - " .. item.price .. " credits", tostring(i - 1))
	end

	sui.sendTo(pPlayer)
end

function CraftingVendor:handleItemSelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local categoryIndex = readData(SceneObject(pPlayer):getObjectID() .. ":craftingVendorCategory")
	deleteData(SceneObject(pPlayer):getObjectID() .. ":craftingVendorCategory")

	if (categoryIndex == nil or categoryIndex == 0 or self.categories[categoryIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid crafting category.")
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid crafting item selection.")
		return
	end

	local itemIndex = selectedIndex + 1
	local category = self.categories[categoryIndex]

	if (category.items[itemIndex] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid crafting item.")
		return
	end

	self:buyItem(pPlayer, category.items[itemIndex])
end

function CraftingVendor:buyItem(pPlayer, item)
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
