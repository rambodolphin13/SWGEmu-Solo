jawaBlackMarketVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "jawaBlackMarketVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! Rare things. Limited stock. New junk every few minutes.",
	stopConversation = "false",
	options = {
		{"Show me your rare finds.", "browse"},
		{"Not right now.", "bye"}
	}
}
jawaBlackMarketVendorConvoTemplate:addScreen(init)

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Look fast. Others may buy before you.",
	stopConversation = "true",
	options = {}
}
jawaBlackMarketVendorConvoTemplate:addScreen(browse)

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back soon. Stock changes often.",
	stopConversation = "true",
	options = {}
}
jawaBlackMarketVendorConvoTemplate:addScreen(bye)

addConversationTemplate("jawaBlackMarketVendorConvoTemplate", jawaBlackMarketVendorConvoTemplate)
