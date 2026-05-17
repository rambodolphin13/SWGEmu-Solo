jawaBuyerConvoTemplate = ConvoTemplate:new {
	initialScreen = "init",
	templateType = "Lua",
	luaClassHandler = "jawaBuyerConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	customDialogText = "Utinni! I buy almost anything, but I do not pay much.",
	stopConversation = "false",
	options = {
		{"Show me what you will buy.", "browse"},
		{"Not right now.", "bye"}
	}
}
jawaBuyerConvoTemplate:addScreen(init)

browse = ConvoScreen:new {
	id = "browse",
	leftDialog = "",
	customDialogText = "Let me see what you have.",
	stopConversation = "true",
	options = {}
}
jawaBuyerConvoTemplate:addScreen(browse)

bye = ConvoScreen:new {
	id = "bye",
	leftDialog = "",
	customDialogText = "Come back with more junk.",
	stopConversation = "true",
	options = {}
}
jawaBuyerConvoTemplate:addScreen(bye)

addConversationTemplate("jawaBuyerConvoTemplate", jawaBuyerConvoTemplate)
