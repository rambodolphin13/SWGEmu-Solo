JawaBuyer = ScreenPlay:new {
	numberOfActs = 1
}

JawaBuyer.values = {
	weaponArmorClothing = 100,
	deed = 500,
	default = 20,
	resourcePerUnit = 1
}

registerScreenPlay("JawaBuyer", true)

function JawaBuyer:start()
end

function JawaBuyer:openSellMenu(pPlayer, pNpc)
	if (pPlayer == nil) then
		return
	end

	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Unable to locate your inventory.")
		return
	end

	local sui = SuiListBox.new("JawaBuyer", "handleSellSelection")
	sui.setTargetNetworkId(SceneObject(pNpc):getObjectID())
	sui.setTitle("Jawa Buyer")
	sui.setPrompt("Choose an item to sell. Resource crates pay 1 credit per unit.")

	local sellIndex = 0
	local skippedContainers = 0
	local inventorySize = SceneObject(pInventory):getContainerObjectsSize()

	for i = 0, inventorySize - 1, 1 do
		local pItem = SceneObject(pInventory):getContainerObject(i)

		if (pItem ~= nil) then
			local itemObject = SceneObject(pItem)
			local templatePath = itemObject:getTemplateObjectPath()
			local itemName = itemObject:getDisplayedName()

			if (itemName == nil or itemName == "") then
				itemName = templatePath
			end

			if (self:hasContents(pItem)) then
				skippedContainers = skippedContainers + 1
			else
				local value = self:getItemValueForObject(pItem, templatePath)
				sui.add(itemName .. " - " .. value .. " credits", tostring(sellIndex))
				sellIndex = sellIndex + 1
			end
		end
	end

	if (sellIndex == 0) then
		local msg = "I do not see anything I can buy right now."

		if (skippedContainers > 0) then
			msg = msg .. " Containers with contents were skipped."
		end

		CreatureObject(pPlayer):sendSystemMessage(msg)
		return
	end

	if (skippedContainers > 0) then
		CreatureObject(pPlayer):sendSystemMessage("Skipped " .. skippedContainers .. " item(s) that contain other items.")
	end

	sui.sendTo(pPlayer)
end

function JawaBuyer:handleSellSelection(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil or args == nil or args == "") then
		return
	end

	local selectedIndex = tonumber(args)

	if (selectedIndex == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid item selection.")
		return
	end

	local pItem = self:getSellableItemByIndex(pPlayer, selectedIndex)

	if (pItem == nil) then
		CreatureObject(pPlayer):sendSystemMessage("That item is no longer available to sell.")
		return
	end

	self:sellItem(pPlayer, pItem)
end

function JawaBuyer:getSellableItemByIndex(pPlayer, selectedIndex)
	if (pPlayer == nil or selectedIndex == nil) then
		return nil
	end

	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return nil
	end

	local sellIndex = 0
	local inventorySize = SceneObject(pInventory):getContainerObjectsSize()

	for i = 0, inventorySize - 1, 1 do
		local pItem = SceneObject(pInventory):getContainerObject(i)

		if (pItem ~= nil) then
			local templatePath = SceneObject(pItem):getTemplateObjectPath()

			if (not self:hasContents(pItem)) then
				if (sellIndex == selectedIndex) then
					return pItem
				end

				sellIndex = sellIndex + 1
			end
		end
	end

	return nil
end

function JawaBuyer:sellItem(pPlayer, pItem)
	if (pPlayer == nil or pItem == nil) then
		return
	end

	local itemObject = SceneObject(pItem)
	local templatePath = itemObject:getTemplateObjectPath()
	local itemName = itemObject:getDisplayedName()

	if (itemName == nil or itemName == "") then
		itemName = templatePath
	end

	if (self:hasContents(pItem)) then
		CreatureObject(pPlayer):sendSystemMessage("I will not buy containers that still have items inside.")
		return
	end

	local value = self:getItemValueForObject(pItem, templatePath)

	itemObject:destroyObjectFromWorld()
	itemObject:destroyObjectFromDatabase()

	CreatureObject(pPlayer):addCashCredits(value, true)
	CreatureObject(pPlayer):sendSystemMessage("Sold " .. itemName .. " for " .. value .. " credits.")
end

function JawaBuyer:getItemValueForObject(pItem, templatePath)
	if (pItem == nil) then
		return self.values.default
	end

	if (self:isResourceContainer(templatePath)) then
		local quantity = SceneObject(pItem):getResourceQuantity()

		if (quantity == nil or quantity < 1) then
			return 0
		end

		return quantity * self.values.resourcePerUnit
	end

	return self:getItemValue(templatePath)
end

function JawaBuyer:getItemValue(templatePath)
	if (templatePath == nil or templatePath == "") then
		return self.values.default
	end

	if (string.find(templatePath, "object/tangible/deed/") ~= nil) then
		return self.values.deed
	end

	if (
		string.find(templatePath, "object/weapon/") ~= nil or
		string.find(templatePath, "object/tangible/wearables/armor/") ~= nil or
		string.find(templatePath, "object/tangible/wearables/") ~= nil or
		string.find(templatePath, "object/tangible/clothing/") ~= nil
	) then
		return self.values.weaponArmorClothing
	end

	return self.values.default
end

function JawaBuyer:isResourceContainer(templatePath)
	if (templatePath == nil) then
		return false
	end

	return string.find(templatePath, "resource_container") ~= nil
end

function JawaBuyer:hasContents(pItem)
	if (pItem == nil) then
		return false
	end

	local size = SceneObject(pItem):getContainerObjectsSize()

	if (size ~= nil and size > 0) then
		return true
	end

	return false
end
