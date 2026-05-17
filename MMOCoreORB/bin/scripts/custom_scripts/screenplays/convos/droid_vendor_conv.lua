droidVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "droidVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I sell droid deeds and droid supplies.",
	stopConversation = "false",
	options = {
		{"Show me the droids.", "browse"},
		{"Not right now.", "bye"}
	}
}
droidVendorConvoTemplate:addScreen(init)

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the droid list now.",
	stopConversation = "true",
	options = {}
}
droidVendorConvoTemplate:addScreen(browse)

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
droidVendorConvoTemplate:addScreen(bye)

addConversationTemplate("droidVendorConvoTemplate", droidVendorConvoTemplate)
