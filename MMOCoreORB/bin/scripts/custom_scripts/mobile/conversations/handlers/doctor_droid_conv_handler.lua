doctorDroidConvoHandler = conv_handler:new {}

function doctorDroidConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	if (pPlayer == nil or pNpc == nil or pConvTemplate == nil) then
		return
	end

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	return convoTemplate:getScreen("intro")
end

function doctorDroidConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	if (pPlayer == nil or pConvScreen == nil) then
		return pConvScreen
	end

	local screen = LuaConversationScreen(pConvScreen)
	local pNewConvScreen = screen:cloneScreen()
	local screenID = screen:getScreenID()

	if (screenID == "heal_player") then
		for i = 0, 8 do
			CreatureObject(pPlayer):setWounds(i, 0)
		end

		CreatureObject(pPlayer):setShockWounds(0)
		CreatureObject(pPlayer):sendSystemMessage("The doctor droid restores your wounds and fatigue.")
	elseif (screenID == "buff_player") then
		CreatureObject(pPlayer):enhanceCharacter()
		CreatureObject(pPlayer):sendSystemMessage("The doctor droid applies medical buffs.")
	elseif (screenID == "full_service") then
		CreatureObject(pPlayer):enhanceCharacter()

		for i = 0, 8 do
			CreatureObject(pPlayer):setWounds(i, 0)
		end

		CreatureObject(pPlayer):setShockWounds(0)
		CreatureObject(pPlayer):sendSystemMessage("The doctor droid fully restores and buffs you.")
	elseif (screenID == "show_location") then
		local localX = SceneObject(pPlayer):getPositionX()
		local localY = SceneObject(pPlayer):getPositionY()
		local localZ = SceneObject(pPlayer):getPositionZ()
		local worldX = SceneObject(pPlayer):getWorldPositionX()
		local worldY = SceneObject(pPlayer):getWorldPositionY()
		local worldZ = SceneObject(pPlayer):getWorldPositionZ()
		local parentID = SceneObject(pPlayer):getParentID()

		CreatureObject(pPlayer):sendSystemMessage("Doctor Droid spawn line:")
		CreatureObject(pPlayer):sendSystemMessage("{ planet = \"tatooine\", x = " .. localX .. ", z = " .. localZ .. ", y = " .. localY .. ", heading = 0, cellID = " .. parentID .. ", name = \"Medix-01\" },")
		CreatureObject(pPlayer):sendSystemMessage("World position: x=" .. worldX .. " z=" .. worldZ .. " y=" .. worldY .. " parentID=" .. parentID)
	end

	return pNewConvScreen
end
