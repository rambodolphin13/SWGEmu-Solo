decorVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "decorVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I sell furniture, decorations, paintings, rugs, lamps, plants, and other house decor.",
	stopConversation = "false",
	options = {
		{"Show me the decor.", "browse"},
		{"Not right now.", "bye"}
	}
}
decorVendorConvoTemplate:addScreen(init);

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the decor list now.",
	stopConversation = "true",
	options = {}
}
decorVendorConvoTemplate:addScreen(browse);

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
decorVendorConvoTemplate:addScreen(bye);

addConversationTemplate("decorVendorConvoTemplate", decorVendorConvoTemplate);
