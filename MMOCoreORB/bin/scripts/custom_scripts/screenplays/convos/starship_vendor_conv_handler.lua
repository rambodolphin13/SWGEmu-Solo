starshipVendorConvoHandler = conv_handler:new {}

function starshipVendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("init")
end

function starshipVendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	if (screenID == "browse") then
		StarshipVendor:openCategoryMenu(pPlayer, pNpc)
	end

	return pConvScreen
end
