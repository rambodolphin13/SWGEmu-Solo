musicianBufferConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro", templateType = "Lua", luaClassHandler = "musicianBufferConvoHandler", screens = {}
}

intro = ConvoScreen:new {
	id = "intro", leftDialog = "",
	customDialogText = "Welcome, traveler. Enjoy the performance, and remember—a generous tip earns a better show.",
	stopConversation = "false",
	options = {
		{"Basic - 2,000 credits: +750 for 2 hours.", "basic_service"},
		{"Enhanced - 7,500 credits: +1,500 for 4 hours.", "enhanced_service"},
		{"Premium - 25,000 credits: +3,000 for 8 hours and 25% speed for 2 hours.", "premium_service"},
		{"Change the song.", "song_menu"},
		{"Never mind.", "goodbye"}
	}
}
musicianBufferConvoTemplate:addScreen(intro)

basic_service = ConvoScreen:new { id = "basic_service", leftDialog = "", customDialogText = "Basic service complete. Full treatment and a two-hour enhancement are active.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(basic_service)
enhanced_service = ConvoScreen:new { id = "enhanced_service", leftDialog = "", customDialogText = "Enhanced service complete. Full treatment and a four-hour enhancement are active.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(enhanced_service)
premium_service = ConvoScreen:new { id = "premium_service", leftDialog = "", customDialogText = "Premium service complete. Maximum enhancement is active for eight hours, with a two-hour movement boost.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(premium_service)

song_menu = ConvoScreen:new {
	id = "song_menu", leftDialog = "", customDialogText = "Which song should I play?", stopConversation = "false",
	options = {
		{"Star Wars 1.", "perf_song_starwars1"},
		{"Folk.", "perf_song_folk"},
		{"Rock.", "perf_song_rock"},
		{"Jazz.", "perf_song_jazz"},
		{"Virtuoso.", "perf_song_virtuoso"},
		{"Back.", "intro"}
	}
}
musicianBufferConvoTemplate:addScreen(song_menu)

for _, song in ipairs({"starwars1", "folk", "rock", "jazz", "virtuoso"}) do
	local screen = ConvoScreen:new {
		id = "perf_song_" .. song,
		leftDialog = "",
		customDialogText = "Of course. I will change the song.",
		stopConversation = "true",
		options = {}
	}
	musicianBufferConvoTemplate:addScreen(screen)
end

goodbye = ConvoScreen:new { id = "goodbye", leftDialog = "", customDialogText = "Safe travels. Come back when you need the music.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(goodbye)

addConversationTemplate("musicianBufferConvoTemplate", musicianBufferConvoTemplate)
