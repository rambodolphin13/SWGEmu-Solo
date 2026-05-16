structureDeedVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "structureDeedVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Welcome. I sell structure deeds for houses, city buildings, factories, harvesters, generators, guild halls, faction structures, and special houses.",
	stopConversation = "false",
	options = {
		{"Show me the deeds.", "browse"},
		{"Not right now.", "bye"}
	}
}
structureDeedVendorConvoTemplate:addScreen(init);

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the deed list now.",
	stopConversation = "true",
	options = {}
}
structureDeedVendorConvoTemplate:addScreen(browse);

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
structureDeedVendorConvoTemplate:addScreen(bye);

addConversationTemplate("structureDeedVendorConvoTemplate", structureDeedVendorConvoTemplate);
