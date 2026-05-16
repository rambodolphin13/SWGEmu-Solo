starshipVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "starshipVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I sell starship deeds, ship components, chassis items, and repair kits.",
	stopConversation = "false",
	options = {
		{"Show me the starship stock.", "browse"},
		{"Not right now.", "bye"}
	}
}
starshipVendorConvoTemplate:addScreen(init);

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the starship list now.",
	stopConversation = "true",
	options = {}
}
starshipVendorConvoTemplate:addScreen(browse);

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
starshipVendorConvoTemplate:addScreen(bye);

addConversationTemplate("starshipVendorConvoTemplate", starshipVendorConvoTemplate);
