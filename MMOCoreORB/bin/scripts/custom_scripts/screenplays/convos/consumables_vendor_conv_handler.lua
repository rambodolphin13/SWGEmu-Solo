consumablesVendorConvoHandler = conv_handler:new {}

function consumablesVendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("init")
end

function consumablesVendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	if (screenID == "browse") then
		ConsumablesVendor:openCategoryMenu(pPlayer, pNpc)
	end

	return pConvScreen
end
