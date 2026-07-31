dancerBufferConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro", templateType = "Lua", luaClassHandler = "dancerBufferConvoHandler", screens = {}
}

intro = ConvoScreen:new {
	id = "intro", leftDialog = "",
	customDialogText = "Welcome, traveler. Enjoy the performance, and remember—a generous tip earns a better show.",
	stopConversation = "false",
	options = {
		{"Basic - 2,000 credits: +750 for 2 hours.", "basic_service"},
		{"Enhanced - 7,500 credits: +1,500 for 4 hours.", "enhanced_service"},
		{"Premium - 25,000 credits: +3,000 for 8 hours and 25% speed for 2 hours.", "premium_service"},
		{"Change your dance.", "dance_menu"},
		{"Never mind.", "goodbye"}
	}
}
dancerBufferConvoTemplate:addScreen(intro)

basic_service = ConvoScreen:new { id = "basic_service", leftDialog = "", customDialogText = "Basic service complete. You are fully treated and reinforced for the next two hours.", stopConversation = "true", options = {} }
dancerBufferConvoTemplate:addScreen(basic_service)
enhanced_service = ConvoScreen:new { id = "enhanced_service", leftDialog = "", customDialogText = "Enhanced service complete. You are fully treated and strongly reinforced for the next four hours.", stopConversation = "true", options = {} }
dancerBufferConvoTemplate:addScreen(enhanced_service)
premium_service = ConvoScreen:new { id = "premium_service", leftDialog = "", customDialogText = "Premium service complete. Maximum reinforcement is active for eight hours, with a two-hour movement boost.", stopConversation = "true", options = {} }
dancerBufferConvoTemplate:addScreen(premium_service)

dance_menu = ConvoScreen:new {
	id = "dance_menu", leftDialog = "", customDialogText = "What would you like to see?", stopConversation = "false",
	options = {
		{"Popular.", "dance_popular"},
		{"Rhythmic.", "dance_rhythmic"},
		{"Formal.", "dance_formal"},
		{"Lyrical.", "dance_lyrical"},
		{"Exotic.", "dance_exotic"},
		{"Back.", "intro"}
	}
}
dancerBufferConvoTemplate:addScreen(dance_menu)

for _, dance in ipairs({"popular", "rhythmic", "formal", "lyrical", "exotic"}) do
	local screen = ConvoScreen:new {
		id = "dance_" .. dance,
		leftDialog = "",
		customDialogText = "Certainly. I will change the performance.",
		stopConversation = "true",
		options = {}
	}
	dancerBufferConvoTemplate:addScreen(screen)
end

goodbye = ConvoScreen:new { id = "goodbye", leftDialog = "", customDialogText = "Safe travels.", stopConversation = "true", options = {} }
dancerBufferConvoTemplate:addScreen(goodbye)

addConversationTemplate("dancerBufferConvoTemplate", dancerBufferConvoTemplate)
