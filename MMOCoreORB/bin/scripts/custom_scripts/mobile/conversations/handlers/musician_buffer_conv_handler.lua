musicianBufferConvoHandler = conv_handler:new {
	basicPrice = 2000,
	middlePrice = 7500,
	premiumPrice = 25000
}

function musicianBufferConvoHandler:chargePlayer(pPlayer, amount)
	if pPlayer == nil or amount == nil or amount <= 0 then return false end
	if CreatureObject(pPlayer):getCashCredits() < amount then
		CreatureObject(pPlayer):sendSystemMessage("You need " .. amount .. " cash credits for that service.")
		return false
	end
	CreatureObject(pPlayer):subtractCashCredits(amount)
	return true
end

function musicianBufferConvoHandler:healPlayer(pPlayer)
	for i = 0, 8 do CreatureObject(pPlayer):setWounds(i, 0) end
	CreatureObject(pPlayer):setShockWounds(0)
end

function musicianBufferConvoHandler:applyTier(pPlayer, price, amount, duration, speedBoost, label)
	if not self:chargePlayer(pPlayer, price) then return false end
	self:healPlayer(pPlayer)
	CreatureObject(pPlayer):enhanceCharacterTier(amount, duration, speedBoost)
	CreatureObject(pPlayer):sendSystemMessage(label .. " applied: full healing, +" .. amount .. " to all HAM attributes for " .. (duration / 3600) .. " hours" .. (speedBoost and ", plus 25% movement speed for 2 hours." or "."))
	return true
end

function musicianBufferConvoHandler:changeSong(pPlayer, pNpc, song)
	if pNpc == nil then return false end
	local objectID = SceneObject(pNpc):getObjectID()
	if CreatureObject(pNpc):isPlayingMusic() then
		CreatureObject(pNpc):stopMusicPerformance()
	end
	writeStringData("aiMusician:song:" .. objectID, song)
	local started = CreatureObject(pNpc):startMusic(song, "slitherhorn")
	if started then
		createEvent(1 * 1000, "MusicianBufferMusicMaintenance", "maintainHAM", pNpc, "")
		createEvent(30 * 1000, "MusicianBufferSpawns", "checkPerformance", pNpc, "")
		CreatureObject(pPlayer):sendSystemMessage("Rinna changes the Slitherhorn performance to " .. song .. ".")
	else
		CreatureObject(pPlayer):sendSystemMessage("That song could not be started.")
	end
	return started
end

function musicianBufferConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	if pPlayer == nil or pNpc == nil or pConvTemplate == nil then return end
	return LuaConversationTemplate(pConvTemplate):getScreen("intro")
end

function musicianBufferConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
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
	elseif string.sub(screenID, 1, 10) == "perf_song_" then
		self:changeSong(pPlayer, pNpc, string.sub(screenID, 11))
	end
	return pNewConvScreen
end
