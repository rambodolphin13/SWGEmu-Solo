structureDeedVendorConvoHandler = conv_handler:new {}

function structureDeedVendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("init")
end

function structureDeedVendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	if (screenID == "browse") then
		StructureDeedVendor:openCategoryMenu(pPlayer, pNpc)
	end

	return pConvScreen
end
