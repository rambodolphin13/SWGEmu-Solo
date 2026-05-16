vehicleDeedVendorConvoHandler = conv_handler:new {}

function vehicleDeedVendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("init")
end

function vehicleDeedVendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	if (screenID == "browse") then
		VehicleDeedVendor:openCategoryMenu(pPlayer, pNpc)
	end

	return pConvScreen
end
