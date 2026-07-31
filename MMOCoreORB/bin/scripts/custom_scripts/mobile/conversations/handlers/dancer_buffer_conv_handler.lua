dancerBufferConvoHandler = conv_handler:new {
	basicPrice = 2000,
	middlePrice = 7500,
	premiumPrice = 25000
}

function dancerBufferConvoHandler:chargePlayer(pPlayer, amount)
	if (pPlayer == nil or amount == nil or amount <= 0) then return false end
	if (CreatureObject(pPlayer):getCashCredits() < amount) then
		CreatureObject(pPlayer):sendSystemMessage("You need " .. amount .. " cash credits for that service.")
		return false
	end
	CreatureObject(pPlayer):subtractCashCredits(amount)
	return true
end

function dancerBufferConvoHandler:healPlayer(pPlayer)
	for i = 0, 8 do CreatureObject(pPlayer):setWounds(i, 0) end
	CreatureObject(pPlayer):setShockWounds(0)
end

function dancerBufferConvoHandler:applyTier(pPlayer, price, amount, duration, speedBoost, label)
	if not self:chargePlayer(pPlayer, price) then return false end
	self:healPlayer(pPlayer)
	CreatureObject(pPlayer):enhanceCharacterTier(amount, duration, speedBoost)
	CreatureObject(pPlayer):sendSystemMessage(label .. " applied: full healing, +" .. amount .. " to all HAM attributes for " .. (duration / 3600) .. " hours" .. (speedBoost and ", plus 25% movement speed for 2 hours." or "."))
	return true
end

function dancerBufferConvoHandler:startDanceAndMaintenance(pNpc, dance)
	if pNpc == nil then return false end
	local objectID = SceneObject(pNpc):getObjectID()
	dance = dance or readStringData("aiDancer:dance:" .. objectID)
	if dance == nil or dance == "" then dance = "popular" end

	if CreatureObject(pNpc):isDancing() then
		CreatureObject(pNpc):stopDancePerformance()
	end

	writeStringData("aiDancer:dance:" .. objectID, dance)
	local startedDance = CreatureObject(pNpc):startDance(dance)
	if startedDance then createEvent(1 * 1000, "DancerBufferMaintenance", "maintainHAM", pNpc, "") end
	return startedDance
end

function dancerBufferConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	if pPlayer == nil or pNpc == nil or pConvTemplate == nil then return end
	if not CreatureObject(pNpc):isDancing() then self:startDanceAndMaintenance(pNpc) end
	return LuaConversationTemplate(pConvTemplate):getScreen("intro")
end

function dancerBufferConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	if pPlayer == nil or pConvScreen == nil then return pConvScreen end
	local screen = LuaConversationScreen(pConvScreen)
	local pNewConvScreen = screen:cloneScreen()
	local screenID = screen:getScreenID()

	if screenID == "basic_service" then
		self:applyTier(pPlayer, self.basicPrice, 750, 7200, false, "Basic service")
	elseif screenID == "enhanced_service" then
		self:applyTier(pPlayer, self.middlePrice, 1500, 14400, false, "Enhanced service")
	elseif screenID == "premium_service" then
		self:applyTier(pPlayer, self.premiumPrice, 3000, 28800, true, "Premium service")
	elseif string.sub(screenID, 1, 6) == "dance_" and screenID ~= "dance_menu" then
		local dance = string.sub(screenID, 7)
		if self:startDanceAndMaintenance(pNpc, dance) then
			CreatureObject(pPlayer):sendSystemMessage("Vessa changes her performance to " .. dance .. ".")
		else
			CreatureObject(pPlayer):sendSystemMessage("That dance could not be started.")
		end
	end
	return pNewConvScreen
end
