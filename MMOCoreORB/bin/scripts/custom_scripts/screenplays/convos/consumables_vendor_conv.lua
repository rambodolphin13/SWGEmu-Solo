consumablesVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "consumablesVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I sell food, drinks, stimpacks, and medical supplies.",
	stopConversation = "false",
	options = {
		{"Show me the consumables.", "browse"},
		{"Not right now.", "bye"}
	}
}
consumablesVendorConvoTemplate:addScreen(init);

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the consumables list now.",
	stopConversation = "true",
	options = {}
}
consumablesVendorConvoTemplate:addScreen(browse);

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
consumablesVendorConvoTemplate:addScreen(bye);

addConversationTemplate("consumablesVendorConvoTemplate", consumablesVendorConvoTemplate);
