veteranRewardVendorConvoHandler = conv_handler:new {}

function veteranRewardVendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("init")
end

function veteranRewardVendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	if (screenID == "browse") then
		VeteranRewardVendor:openCategoryMenu(pPlayer, pNpc)
	end

	return pConvScreen
end
