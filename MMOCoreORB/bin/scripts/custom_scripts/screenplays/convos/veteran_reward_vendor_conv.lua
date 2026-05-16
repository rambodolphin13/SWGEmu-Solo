veteranRewardVendorConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "veteranRewardVendorConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I sell veteran reward items, anniversary paintings, and special utility rewards.",
	stopConversation = "false",
	options = {
		{"Show me the veteran rewards.", "browse"},
		{"Not right now.", "bye"}
	}
}
veteranRewardVendorConvoTemplate:addScreen(init);

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Opening the veteran rewards list now.",
	stopConversation = "true",
	options = {}
}
veteranRewardVendorConvoTemplate:addScreen(browse);

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back anytime.",
	stopConversation = "true",
	options = {}
}
veteranRewardVendorConvoTemplate:addScreen(bye);

addConversationTemplate("veteranRewardVendorConvoTemplate", veteranRewardVendorConvoTemplate);
