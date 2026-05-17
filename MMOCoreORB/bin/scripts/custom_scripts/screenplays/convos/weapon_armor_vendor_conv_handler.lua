weaponArmorVendorConvoHandler = conv_handler:new {}

function weaponArmorVendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
    local convoTemplate = LuaConversationTemplate(pConvTemplate)
    return convoTemplate:getScreen("init")
end

function weaponArmorVendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
    local screen = LuaConversationScreen(pConvScreen)
    local screenID = screen:getScreenID()

    if (screenID == "browse") then
        WeaponArmorVendor:openCategoryMenu(pPlayer, pNpc)
    end

    return pConvScreen
end
