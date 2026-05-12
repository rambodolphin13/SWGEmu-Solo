dancerBufferConvoHandler = conv_handler:new {}

function dancerBufferConvoHandler:startDanceAndMaintenance(pNpc)
	if (pNpc == nil) then
		return false
	end

	if (CreatureObject(pNpc):isDancing()) then
		createEvent(1 * 1000, "DancerBufferMaintenance", "maintainHAM", pNpc, "")
		return true
	end

	local startedDance = CreatureObject(pNpc):startDance("popular")

	if (startedDance) then
		createEvent(1 * 1000, "DancerBufferMaintenance", "maintainHAM", pNpc, "")
	end

	return startedDance
end

function dancerBufferConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	if (pPlayer == nil or pNpc == nil or pConvTemplate == nil) then
		return
	end

	-- For manually placed dancers: if the server restarted and she is no longer dancing,
	-- opening her conversation will immediately restart the real popular dance and HAM maintenance.
	self:startDanceAndMaintenance(pNpc)

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	return convoTemplate:getScreen("intro")
end

function dancerBufferConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	if (pPlayer == nil or pConvScreen == nil) then
		return pConvScreen
	end

	local screen = LuaConversationScreen(pConvScreen)
	local pNewConvScreen = screen:cloneScreen()
	local screenID = screen:getScreenID()

	if (screenID == "buff_player") then
		CreatureObject(pPlayer):enhanceCharacter()
		CreatureObject(pPlayer):sendSystemMessage("The dancer buffer inspires you with performance and medical buffs.")

		self:startDanceAndMaintenance(pNpc)
	elseif (screenID == "heal_player") then
		for i = 0, 8 do
			CreatureObject(pPlayer):setWounds(i, 0)
		end

		CreatureObject(pPlayer):setShockWounds(0)
		CreatureObject(pPlayer):sendSystemMessage("The dancer buffer restores your wounds and fatigue.")

		self:startDanceAndMaintenance(pNpc)
	elseif (screenID == "full_service") then
		CreatureObject(pPlayer):enhanceCharacter()

		for i = 0, 8 do
			CreatureObject(pPlayer):setWounds(i, 0)
		end

		CreatureObject(pPlayer):setShockWounds(0)
		CreatureObject(pPlayer):sendSystemMessage("The dancer buffer fully restores and buffs you.")

		self:startDanceAndMaintenance(pNpc)
	elseif (screenID == "popular_dance") then
		if (self:startDanceAndMaintenance(pNpc)) then
			CreatureObject(pPlayer):sendSystemMessage("The dancer buffer begins performing the popular dance.")
		else
			CreatureObject(pPlayer):sendSystemMessage("The dancer buffer could not start the popular dance.")
		end
	elseif (screenID == "show_location") then
		local localX = SceneObject(pPlayer):getPositionX()
		local localY = SceneObject(pPlayer):getPositionY()
		local localZ = SceneObject(pPlayer):getPositionZ()
		local worldX = SceneObject(pPlayer):getWorldPositionX()
		local worldY = SceneObject(pPlayer):getWorldPositionY()
		local worldZ = SceneObject(pPlayer):getWorldPositionZ()
		local parentID = SceneObject(pPlayer):getParentID()

		CreatureObject(pPlayer):sendSystemMessage("Dancer Buffer spawn line:")
		CreatureObject(pPlayer):sendSystemMessage("{ planet = \"tatooine\", x = " .. localX .. ", z = " .. localZ .. ", y = " .. localY .. ", heading = 0, cellID = " .. parentID .. ", name = \"Vessa Talorin\" },")
		CreatureObject(pPlayer):sendSystemMessage("World position: x=" .. worldX .. " z=" .. worldZ .. " y=" .. worldY .. " parentID=" .. parentID)
	end

	return pNewConvScreen
end
