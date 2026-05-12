dancerBufferConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "dancerBufferConvoHandler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	leftDialog = "",
	customDialogText = "Welcome in, traveler. If the road has left you worn down, I can help you recover with performance care and medical-grade support.",
	stopConversation = "false",
	options = {
		{"I could use performance buffs.", "buff_player"},
		{"Can you treat my wounds and fatigue?", "heal_player"},
		{"I need the full service.", "full_service"},
		{"Start your popular dance.", "popular_dance"},
		{"Show my spawn location.", "show_location"},
		{"What exactly do you do?", "explain_service"},
		{"Never mind.", "goodbye"}
	}
}

dancerBufferConvoTemplate:addScreen(intro)

explain_service = ConvoScreen:new {
	id = "explain_service",
	leftDialog = "",
	customDialogText = "I keep people moving. A little rhythm for focus, a little movement for the mind, and enough treatment to get you back on your feet. Think of me as a cantina performer with a proper field kit.",
	stopConversation = "false",
	options = {
		{"Give me performance buffs.", "buff_player"},
		{"Treat my wounds and fatigue.", "heal_player"},
		{"Full service, please.", "full_service"},
		{"Start your popular dance.", "popular_dance"},
		{"Show my spawn location.", "show_location"},
		{"Thanks, maybe later.", "goodbye"}
	}
}

dancerBufferConvoTemplate:addScreen(explain_service)

buff_player = ConvoScreen:new {
	id = "buff_player",
	leftDialog = "",
	customDialogText = "There we go. Keep your breathing steady and let the rhythm settle in. You should feel sharper, calmer, and ready to move.",
	stopConversation = "true",
	options = {}
}

dancerBufferConvoTemplate:addScreen(buff_player)

heal_player = ConvoScreen:new {
	id = "heal_player",
	leftDialog = "",
	customDialogText = "Hold still a moment. There. The worst of the strain should be gone now. Try not to pick a fight with anything bigger than a bantha for at least a minute.",
	stopConversation = "true",
	options = {}
}

dancerBufferConvoTemplate:addScreen(heal_player)

full_service = ConvoScreen:new {
	id = "full_service",
	leftDialog = "",
	customDialogText = "All set. Performance focus, medical support, and a little cantina luck. Go make some trouble out there.",
	stopConversation = "true",
	options = {}
}

dancerBufferConvoTemplate:addScreen(full_service)

popular_dance = ConvoScreen:new {
	id = "popular_dance",
	leftDialog = "",
	customDialogText = "Popular? That one always gets the room moving. Watch closely.",
	stopConversation = "true",
	options = {}
}

dancerBufferConvoTemplate:addScreen(popular_dance)

show_location = ConvoScreen:new {
	id = "show_location",
	leftDialog = "",
	customDialogText = "I sent your current spawn location to your system message window.",
	stopConversation = "true",
	options = {}
}

dancerBufferConvoTemplate:addScreen(show_location)

goodbye = ConvoScreen:new {
	id = "goodbye",
	leftDialog = "",
	customDialogText = "Safe travels. If you start feeling the wear again, come find the music.",
	stopConversation = "true",
	options = {}
}

dancerBufferConvoTemplate:addScreen(goodbye)

addConversationTemplate("dancerBufferConvoTemplate", dancerBufferConvoTemplate)
