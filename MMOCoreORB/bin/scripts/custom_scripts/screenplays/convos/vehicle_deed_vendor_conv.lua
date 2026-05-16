vehicleDeedVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "vehicleDeedVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I sell vehicle deeds, jetpacks, vehicle customization kits, and vehicle repair kits.",
	stopConversation = "false",
	options = {
		{"Show me the vehicle stock.", "browse"},
		{"Not right now.", "bye"}
	}
}
vehicleDeedVendorConvoTemplate:addScreen(init);

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the vehicle list now.",
	stopConversation = "true",
	options = {}
}
vehicleDeedVendorConvoTemplate:addScreen(browse);

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
vehicleDeedVendorConvoTemplate:addScreen(bye);

addConversationTemplate("vehicleDeedVendorConvoTemplate", vehicleDeedVendorConvoTemplate);
