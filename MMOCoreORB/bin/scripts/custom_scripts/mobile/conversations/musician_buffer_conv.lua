musicianBufferConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "musicianBufferConvoHandler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	leftDialog = "",
	customDialogText = "Welcome in, traveler. I'm Rinna Valen. I can patch you up, keep your head clear, or change the music around here.",
	stopConversation = "false",
	options = {
		{"I could use performance buffs.", "buff_player"},
		{"Can you treat my wounds and fatigue?", "heal_player"},
		{"I need the full service.", "full_service"},
		{"Play Figrin Dan 1.", "song_figrin_1"},
		{"Play Figrin Dan 2.", "song_figrin_2"},
		{"Play Max Rebo 1.", "song_max_rebo_1"},
		{"Play Max Rebo 2.", "song_max_rebo_2"},
		{"Play chamber music.", "song_chamber"},
		{"Stop the music.", "song_stop"},
		{"Show my spawn location.", "show_location"},
		{"What exactly do you do?", "explain_service"},
		{"Never mind.", "goodbye"}
	}
}

musicianBufferConvoTemplate:addScreen(intro)

explain_service = ConvoScreen:new {
	id = "explain_service",
	leftDialog = "",
	customDialogText = "I work like a cantina music controller. Pick a song and nearby players should hear it. I can also provide field care, performance support, and full recovery service.",
	stopConversation = "false",
	options = {
		{"Play Figrin Dan 1.", "song_figrin_1"},
		{"Play Max Rebo 1.", "song_max_rebo_1"},
		{"Give me performance buffs.", "buff_player"},
		{"Treat my wounds and fatigue.", "heal_player"},
		{"Full service, please.", "full_service"},
		{"Thanks, maybe later.", "goodbye"}
	}
}

musicianBufferConvoTemplate:addScreen(explain_service)

buff_player = ConvoScreen:new {
	id = "buff_player",
	leftDialog = "",
	customDialogText = "There we go. Let the rhythm settle in. You should feel sharper, calmer, and ready for whatever is waiting outside.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(buff_player)

heal_player = ConvoScreen:new {
	id = "heal_player",
	leftDialog = "",
	customDialogText = "Hold still a moment. There. The strain should ease up now. Try not to test my work too quickly.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(heal_player)

full_service = ConvoScreen:new {
	id = "full_service",
	leftDialog = "",
	customDialogText = "All set. Music for the nerves, treatment for the wear, and a little cantina luck for the road.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(full_service)

song_figrin_1 = ConvoScreen:new {
	id = "song_figrin_1",
	leftDialog = "",
	customDialogText = "Figrin Dan 1 it is. This should play for nearby players.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(song_figrin_1)

song_figrin_2 = ConvoScreen:new {
	id = "song_figrin_2",
	leftDialog = "",
	customDialogText = "Figrin Dan 2 it is. This should play for nearby players.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(song_figrin_2)

song_max_rebo_1 = ConvoScreen:new {
	id = "song_max_rebo_1",
	leftDialog = "",
	customDialogText = "Max Rebo 1 it is. This should play for nearby players.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(song_max_rebo_1)

song_max_rebo_2 = ConvoScreen:new {
	id = "song_max_rebo_2",
	leftDialog = "",
	customDialogText = "Max Rebo 2 it is. This should play for nearby players.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(song_max_rebo_2)

song_chamber = ConvoScreen:new {
	id = "song_chamber",
	leftDialog = "",
	customDialogText = "Chamber music it is. This should play for nearby players.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(song_chamber)

song_stop = ConvoScreen:new {
	id = "song_stop",
	leftDialog = "",
	customDialogText = "I'll quiet the room down.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(song_stop)

show_location = ConvoScreen:new {
	id = "show_location",
	leftDialog = "",
	customDialogText = "I sent your current spawn location to your system message window.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(show_location)

goodbye = ConvoScreen:new {
	id = "goodbye",
	leftDialog = "",
	customDialogText = "Safe travels. If the road gets heavy, come back to the music.",
	stopConversation = "true",
	options = {}
}

musicianBufferConvoTemplate:addScreen(goodbye)

addConversationTemplate("musicianBufferConvoTemplate", musicianBufferConvoTemplate)
