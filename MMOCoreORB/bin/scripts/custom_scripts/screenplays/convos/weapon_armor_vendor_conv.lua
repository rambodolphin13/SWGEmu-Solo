weaponArmorVendorConvoTemplate = ConvoTemplate:new {
    initialScreen = "init",
    templateType = "Lua",
    luaClassHandler = "weaponArmorVendorConvoHandler",
    screens = {}
}

init = ConvoScreen:new {
    id = "init",
    leftDialog = "",
    customDialogText = "Utinni! I sell basic weapons and starter armor sets.",
    stopConversation = "false",
    options = {
        {"Show me the weapons and armor.", "browse"},
        {"Not right now.", "bye"}
    }
}
weaponArmorVendorConvoTemplate:addScreen(init)

browse = ConvoScreen:new {
    id = "browse",
    leftDialog = "",
    customDialogText = "Opening the weapons and armor list now.",
    stopConversation = "true",
    options = {}
}
weaponArmorVendorConvoTemplate:addScreen(browse)

bye = ConvoScreen:new {
    id = "bye",
    leftDialog = "",
    customDialogText = "Come back anytime.",
    stopConversation = "true",
    options = {}
}
weaponArmorVendorConvoTemplate:addScreen(bye)

addConversationTemplate("weaponArmorVendorConvoTemplate", weaponArmorVendorConvoTemplate)
