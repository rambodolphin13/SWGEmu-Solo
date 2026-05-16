craftingVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "craftingVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I sell crafting tools, stations, survey tools, and useful resource equipment.",
	stopConversation = "false",
	options = {
		{"Show me the crafting supplies.", "browse"},
		{"Not right now.", "bye"}
	}
}
craftingVendorConvoTemplate:addScreen(init);

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the crafting supply list now.",
	stopConversation = "true",
	options = {}
}
craftingVendorConvoTemplate:addScreen(browse);

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
craftingVendorConvoTemplate:addScreen(bye);

addConversationTemplate("craftingVendorConvoTemplate", craftingVendorConvoTemplate);
