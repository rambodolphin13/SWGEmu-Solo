jawaBlackMarketVendorConvoHandler = conv_handler:new {}

function jawaBlackMarketVendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("init")
end

function jawaBlackMarketVendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	if (screenID == "browse") then
		JawaBlackMarketVendor:openStockMenu(pPlayer, pNpc)
	end

	return pConvScreen
end
