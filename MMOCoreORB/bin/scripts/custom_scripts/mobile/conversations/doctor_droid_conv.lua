doctorDroidConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "doctorDroidConvoHandler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	leftDialog = "",
	customDialogText = "Medical support unit online. I can provide healing, buffs, or full treatment.",
	stopConversation = "false",
	options = {
		{"Heal me.", "heal_player"},
		{"Buff me.", "buff_player"},
		{"Full service.", "full_service"},
		{"Show my spawn location.", "show_location"},
		{"Never mind.", "goodbye"}
	}
}
doctorDroidConvoTemplate:addScreen(intro)

heal_player = ConvoScreen:new {
	id = "heal_player",
	leftDialog = "",
	customDialogText = "Treatment complete. Your wounds and fatigue have been reduced.",
	stopConversation = "true",
	options = {}
}
doctorDroidConvoTemplate:addScreen(heal_player)

buff_player = ConvoScreen:new {
	id = "buff_player",
	leftDialog = "",
	customDialogText = "Enhancement package applied. Your combat readiness has improved.",
	stopConversation = "true",
	options = {}
}
doctorDroidConvoTemplate:addScreen(buff_player)

full_service = ConvoScreen:new {
	id = "full_service",
	leftDialog = "",
	customDialogText = "Full medical service complete. Buffs, wounds, and fatigue have been handled.",
	stopConversation = "true",
	options = {}
}
doctorDroidConvoTemplate:addScreen(full_service)

show_location = ConvoScreen:new {
	id = "show_location",
	leftDialog = "",
	customDialogText = "I sent my exact spawn location to your system message window.",
	stopConversation = "true",
	options = {}
}
doctorDroidConvoTemplate:addScreen(show_location)

goodbye = ConvoScreen:new {
	id = "goodbye",
	leftDialog = "",
	customDialogText = "Medical unit standing by.",
	stopConversation = "true",
	options = {}
}
doctorDroidConvoTemplate:addScreen(goodbye)

addConversationTemplate("doctorDroidConvoTemplate", doctorDroidConvoTemplate)
