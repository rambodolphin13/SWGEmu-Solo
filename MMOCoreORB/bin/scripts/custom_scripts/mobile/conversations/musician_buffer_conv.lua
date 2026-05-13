musicianBufferConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "musicianBufferConvoHandler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	leftDialog = "",
	customDialogText = "Welcome in, traveler. I am Rinna Valen. I can patch you up, keep your head clear, or fire up the music source.",
	stopConversation = "false",
	options = {
		{"I could use performance buffs.", "buff_player"},
		{"Can you treat my wounds and fatigue?", "heal_player"},
		{"I need the full service.", "full_service"},
		{"Music: Cantina / Band.", "music_cat_cantina_band"},
		{"Music: Themes.", "music_cat_themes"},
		{"Music: Ambient / Exploration.", "music_cat_ambient_exploration"},
		{"Music: Mood / Palace.", "music_cat_mood_palace"},
		{"Music: Other.", "music_cat_other"},
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
	customDialogText = "I provide quick support services and control a local music source. Pick a category, choose a song, and I will start the nalargon while the music source handles the room audio.",
	stopConversation = "false",
	options = {
		{"Music: Cantina / Band.", "music_cat_cantina_band"},
		{"Music: Themes.", "music_cat_themes"},
		{"Music: Ambient / Exploration.", "music_cat_ambient_exploration"},
		{"Music: Mood / Palace.", "music_cat_mood_palace"},
		{"Stop the music.", "song_stop"},
		{"Give me performance buffs.", "buff_player"},
		{"Treat my wounds and fatigue.", "heal_player"},
		{"Full service, please.", "full_service"},
		{"Thanks, maybe later.", "goodbye"}
	}
}

musicianBufferConvoTemplate:addScreen(explain_service)

buff_player = ConvoScreen:new { id = "buff_player", leftDialog = "", customDialogText = "There we go. Let the rhythm settle in. You should feel sharper, calmer, and ready for whatever is waiting outside.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(buff_player)

heal_player = ConvoScreen:new { id = "heal_player", leftDialog = "", customDialogText = "Hold still a moment. There. The strain should ease up now. Try not to test my work too quickly.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(heal_player)

full_service = ConvoScreen:new { id = "full_service", leftDialog = "", customDialogText = "All set. Music for the nerves, treatment for the wear, and a little cantina luck for the road.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(full_service)

music_cat_cantina_band = ConvoScreen:new {
	id = "music_cat_cantina_band",
	leftDialog = "",
	customDialogText = "Choose a Cantina / Band song.",
	stopConversation = "false",
	options = {
		{"Play Hard Rock.", "song_hard_rock"},
		{"Play Figrin Dan 1.", "song_figrin_dan_1"},
		{"Play Figrin Dan 2.", "song_figrin_dan_2"},
		{"Play Max Rebo 1.", "song_max_rebo_1"},
		{"Play Max Rebo 2.", "song_max_rebo_2"},
		{"Play Satisfaction 1.", "song_satisfaction_1"},
		{"Play Satisfaction 2.", "song_satisfaction_2"},
		{"Back to main options.", "intro"},
		{"Stop the music.", "song_stop"}
	}
}

musicianBufferConvoTemplate:addScreen(music_cat_cantina_band)

music_cat_themes = ConvoScreen:new {
	id = "music_cat_themes",
	leftDialog = "",
	customDialogText = "Choose a Themes song.",
	stopConversation = "false",
	options = {
		{"Play Darth Vader Theme.", "song_darth_vader_theme"},
		{"Play Imperial Victory Theme.", "song_imperial_victory_theme"},
		{"Play Emperors Theme.", "song_emperors_theme"},
		{"Play Star Wars Intro.", "song_star_wars_intro"},
		{"Play Exar Theme.", "song_exar_theme"},
		{"Play Leia Theme.", "song_leia_theme"},
		{"Play Lok Theme.", "song_lok_theme"},
		{"Back to main options.", "intro"},
		{"Stop the music.", "song_stop"}
	}
}

musicianBufferConvoTemplate:addScreen(music_cat_themes)

music_cat_ambient_exploration = ConvoScreen:new {
	id = "music_cat_ambient_exploration",
	leftDialog = "",
	customDialogText = "Choose a Ambient / Exploration song.",
	stopConversation = "false",
	options = {
		{"Play Exploration.", "song_exploration"},
		{"Play Evil Ambiance.", "song_evil_ambiance"},
		{"Play Eerie Ambiance.", "song_eerie_ambiance"},
		{"Back to main options.", "intro"},
		{"Stop the music.", "song_stop"}
	}
}

musicianBufferConvoTemplate:addScreen(music_cat_ambient_exploration)

music_cat_mood_palace = ConvoScreen:new {
	id = "music_cat_mood_palace",
	leftDialog = "",
	customDialogText = "Choose a Mood / Palace song.",
	stopConversation = "false",
	options = {
		{"Play Chamber Music.", "song_chamber_music"},
		{"Play Theed Palace.", "song_theed_palace"},
		{"Play Romance 1.", "song_romance_1"},
		{"Play Romance 2.", "song_romance_2"},
		{"Play Romance 3.", "song_romance_3"},
		{"Play Humor 1.", "song_humor_1"},
		{"Play Humor 2.", "song_humor_2"},
		{"Back to main options.", "intro"},
		{"Stop the music.", "song_stop"}
	}
}

musicianBufferConvoTemplate:addScreen(music_cat_mood_palace)

music_cat_other = ConvoScreen:new {
	id = "music_cat_other",
	leftDialog = "",
	customDialogText = "Choose a Other song.",
	stopConversation = "false",
	options = {
		{"Play Medley.", "song_medley"},
		{"Play Otoh Gunga.", "song_otoh_gunga"},
		{"Play Celeb Phantom Menace.", "song_celeb_phantom_menace"},
		{"Play Celeb Rotj.", "song_celeb_rotj"},
		{"Play Pod Race.", "song_pod_race"},
		{"Play Soothing Corellia.", "song_soothing_corellia"},
		{"Play Soothing Naboo.", "song_soothing_naboo"},
		{"Play Soothing Tatooine.", "song_soothing_tatooine"},
		{"Back to main options.", "intro"},
		{"Stop the music.", "song_stop"}
	}
}

musicianBufferConvoTemplate:addScreen(music_cat_other)

song_emperors_theme = ConvoScreen:new { id = "song_emperors_theme", leftDialog = "", customDialogText = "Emperors Theme it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_emperors_theme)

song_chamber_music = ConvoScreen:new { id = "song_chamber_music", leftDialog = "", customDialogText = "Chamber Music it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_chamber_music)

song_hard_rock = ConvoScreen:new { id = "song_hard_rock", leftDialog = "", customDialogText = "Hard Rock it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_hard_rock)

song_theed_palace = ConvoScreen:new { id = "song_theed_palace", leftDialog = "", customDialogText = "Theed Palace it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_theed_palace)

song_medley = ConvoScreen:new { id = "song_medley", leftDialog = "", customDialogText = "Medley it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_medley)

song_otoh_gunga = ConvoScreen:new { id = "song_otoh_gunga", leftDialog = "", customDialogText = "Otoh Gunga it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_otoh_gunga)

song_star_wars_intro = ConvoScreen:new { id = "song_star_wars_intro", leftDialog = "", customDialogText = "Star Wars Intro it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_star_wars_intro)

song_celeb_phantom_menace = ConvoScreen:new { id = "song_celeb_phantom_menace", leftDialog = "", customDialogText = "Celeb Phantom Menace it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_celeb_phantom_menace)

song_celeb_rotj = ConvoScreen:new { id = "song_celeb_rotj", leftDialog = "", customDialogText = "Celeb Rotj it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_celeb_rotj)

song_pod_race = ConvoScreen:new { id = "song_pod_race", leftDialog = "", customDialogText = "Pod Race it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_pod_race)

song_figrin_dan_1 = ConvoScreen:new { id = "song_figrin_dan_1", leftDialog = "", customDialogText = "Figrin Dan 1 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_figrin_dan_1)

song_figrin_dan_2 = ConvoScreen:new { id = "song_figrin_dan_2", leftDialog = "", customDialogText = "Figrin Dan 2 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_figrin_dan_2)

song_soothing_corellia = ConvoScreen:new { id = "song_soothing_corellia", leftDialog = "", customDialogText = "Soothing Corellia it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_soothing_corellia)

song_soothing_naboo = ConvoScreen:new { id = "song_soothing_naboo", leftDialog = "", customDialogText = "Soothing Naboo it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_soothing_naboo)

song_soothing_tatooine = ConvoScreen:new { id = "song_soothing_tatooine", leftDialog = "", customDialogText = "Soothing Tatooine it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_soothing_tatooine)

song_max_rebo_1 = ConvoScreen:new { id = "song_max_rebo_1", leftDialog = "", customDialogText = "Max Rebo 1 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_max_rebo_1)

song_max_rebo_2 = ConvoScreen:new { id = "song_max_rebo_2", leftDialog = "", customDialogText = "Max Rebo 2 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_max_rebo_2)

song_romance_1 = ConvoScreen:new { id = "song_romance_1", leftDialog = "", customDialogText = "Romance 1 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_romance_1)

song_romance_2 = ConvoScreen:new { id = "song_romance_2", leftDialog = "", customDialogText = "Romance 2 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_romance_2)

song_romance_3 = ConvoScreen:new { id = "song_romance_3", leftDialog = "", customDialogText = "Romance 3 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_romance_3)

song_satisfaction_1 = ConvoScreen:new { id = "song_satisfaction_1", leftDialog = "", customDialogText = "Satisfaction 1 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_satisfaction_1)

song_satisfaction_2 = ConvoScreen:new { id = "song_satisfaction_2", leftDialog = "", customDialogText = "Satisfaction 2 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_satisfaction_2)

song_exar_theme = ConvoScreen:new { id = "song_exar_theme", leftDialog = "", customDialogText = "Exar Theme it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_exar_theme)

song_exploration = ConvoScreen:new { id = "song_exploration", leftDialog = "", customDialogText = "Exploration it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_exploration)

song_humor_1 = ConvoScreen:new { id = "song_humor_1", leftDialog = "", customDialogText = "Humor 1 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_humor_1)

song_humor_2 = ConvoScreen:new { id = "song_humor_2", leftDialog = "", customDialogText = "Humor 2 it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_humor_2)

song_leia_theme = ConvoScreen:new { id = "song_leia_theme", leftDialog = "", customDialogText = "Leia Theme it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_leia_theme)

song_evil_ambiance = ConvoScreen:new { id = "song_evil_ambiance", leftDialog = "", customDialogText = "Evil Ambiance it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_evil_ambiance)

song_eerie_ambiance = ConvoScreen:new { id = "song_eerie_ambiance", leftDialog = "", customDialogText = "Eerie Ambiance it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_eerie_ambiance)

song_lok_theme = ConvoScreen:new { id = "song_lok_theme", leftDialog = "", customDialogText = "Lok Theme it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_lok_theme)

song_imperial_victory_theme = ConvoScreen:new { id = "song_imperial_victory_theme", leftDialog = "", customDialogText = "Imperial Victory Theme it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_imperial_victory_theme)

song_darth_vader_theme = ConvoScreen:new { id = "song_darth_vader_theme", leftDialog = "", customDialogText = "Darth Vader Theme it is. Let me bring the music source up.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_darth_vader_theme)

song_stop = ConvoScreen:new { id = "song_stop", leftDialog = "", customDialogText = "I will quiet the room down.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(song_stop)

show_location = ConvoScreen:new { id = "show_location", leftDialog = "", customDialogText = "I sent your current spawn location to your system message window.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(show_location)

goodbye = ConvoScreen:new { id = "goodbye", leftDialog = "", customDialogText = "Safe travels. If the road gets heavy, come back to the music.", stopConversation = "true", options = {} }
musicianBufferConvoTemplate:addScreen(goodbye)

addConversationTemplate("musicianBufferConvoTemplate", musicianBufferConvoTemplate)
