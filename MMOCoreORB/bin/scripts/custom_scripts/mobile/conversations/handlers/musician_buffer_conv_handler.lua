musicianBufferConvoHandler = conv_handler:new {}

musicianBufferConvoHandler.jukeboxSongs = {
	["song_darth_vader_theme"] = { song = "sound/music_darth_vader_theme.snd", label = "Darth Vader Theme" },
	["song_imperial_victory_theme"] = { song = "sound/music_themequest_victory_imperial.snd", label = "Imperial Victory Theme" },
	["song_emperors_theme"] = { song = "sound/music_emperor_theme_loop.snd", label = "Emperors Theme" },
	["song_chamber_music"] = { song = "sound/music_starport_a_loop.snd", label = "Chamber Music" },
	["song_hard_rock"] = { song = "sound/music_starport_b_loop.snd", label = "Hard Rock" },
	["song_theed_palace"] = { song = "sound/music_theed_palace_loop.snd", label = "Theed Palace" },
	["song_medley"] = { song = "sound/music_autorun_loop.snd", label = "Medley" },
	["song_otoh_gunga"] = { song = "sound/music_otoh_gunga_loop.snd", label = "Otoh Gunga" },
	["song_star_wars_intro"] = { song = "sound/music_intro_loop.snd", label = "Star Wars Intro" },
	["song_celeb_phantom_menace"] = { song = "sound/music_celebration_a_loop.snd", label = "Celeb Phantom Menace" },
	["song_celeb_rotj"] = { song = "sound/music_celebration_b_loop.snd", label = "Celeb Rotj" },
	["song_pod_race"] = { song = "sound/music_combat_bfield_loop.snd", label = "Pod Race" },
	["song_figrin_dan_1"] = { song = "sound/music_figrin_dan_1_loop.snd", label = "Figrin Dan 1" },
	["song_figrin_dan_2"] = { song = "sound/music_figrin_dan_2_loop.snd", label = "Figrin Dan 2" },
	["song_soothing_corellia"] = { song = "sound/music_id_tent_corellia_loop.snd", label = "Soothing Corellia" },
	["song_soothing_naboo"] = { song = "sound/music_id_tent_naboo_loop.snd", label = "Soothing Naboo" },
	["song_soothing_tatooine"] = { song = "sound/music_id_tent_tatooine_loop.snd", label = "Soothing Tatooine" },
	["song_max_rebo_1"] = { song = "sound/music_max_rebo_1_loop.snd", label = "Max Rebo 1" },
	["song_max_rebo_2"] = { song = "sound/music_max_rebo_2_loop.snd", label = "Max Rebo 2" },
	["song_romance_1"] = { song = "sound/music_romance_a_loop.snd", label = "Romance 1" },
	["song_romance_2"] = { song = "sound/music_romance_b_loop.snd", label = "Romance 2" },
	["song_romance_3"] = { song = "sound/music_romance_c_loop.snd", label = "Romance 3" },
	["song_satisfaction_1"] = { song = "sound/music_satisfaction_a_loop.snd", label = "Satisfaction 1" },
	["song_satisfaction_2"] = { song = "sound/music_satisfaction_b_loop.snd", label = "Satisfaction 2" },
	["song_exar_theme"] = { song = "sound/music_exar_theme_loop.snd", label = "Exar Theme" },
	["song_exploration"] = { song = "sound/music_explore_a_loop.snd", label = "Exploration" },
	["song_humor_1"] = { song = "sound/music_humor_a_loop.snd", label = "Humor 1" },
	["song_humor_2"] = { song = "sound/music_humor_b_loop.snd", label = "Humor 2" },
	["song_leia_theme"] = { song = "sound/music_leia_theme_loop.snd", label = "Leia Theme" },
	["song_evil_ambiance"] = { song = "sound/music_underground_loop.snd", label = "Evil Ambiance" },
	["song_eerie_ambiance"] = { song = "sound/music_underwater_loop.snd", label = "Eerie Ambiance" },
	["song_lok_theme"] = { song = "sound/music_gloom_a_loop.snd", label = "Lok Theme" }
}


function musicianBufferConvoHandler:playOmniJukeboxSong(pPlayer, pNpc, song, label)
	if (pPlayer == nil or pNpc == nil) then
		return
	end

	local result = CreatureObject(pNpc):controlNearbyJukebox(song)

	if (result == nil) then
		result = 0
	end

	if (result == 1) then
		CreatureObject(pPlayer):sendSystemMessage("Rinna starts the omni box music source: " .. label .. ".")
		createEvent(1 * 1000, "MusicianBufferMusicMaintenance", "maintainHAM", pNpc, "")
	else
		CreatureObject(pPlayer):sendSystemMessage("Rinna could not start the omni box music source.")
	end
end

function musicianBufferConvoHandler:stopOmniJukeboxSong(pPlayer, pNpc)
	if (pPlayer == nil or pNpc == nil) then
		return
	end

	local result = CreatureObject(pNpc):controlNearbyJukebox("sound/music_silence.snd")

	if (result == nil) then
		result = 0
	end

	if (result == 1) then
		CreatureObject(pPlayer):sendSystemMessage("Rinna stops the omni box music source.")
	else
		CreatureObject(pPlayer):sendSystemMessage("Rinna could not stop the omni box music source.")
	end
end

function musicianBufferConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	if (pPlayer == nil or pNpc == nil or pConvTemplate == nil) then
		return
	end

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	return convoTemplate:getScreen("intro")
end

function musicianBufferConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	if (pPlayer == nil or pConvScreen == nil) then
		return pConvScreen
	end

	local screen = LuaConversationScreen(pConvScreen)
	local pNewConvScreen = screen:cloneScreen()
	local screenID = screen:getScreenID()

	local songData = self.jukeboxSongs[screenID]

	if (songData ~= nil) then
		self:playOmniJukeboxSong(pPlayer, pNpc, songData.song, songData.label)
	elseif (screenID == "buff_player") then
		CreatureObject(pPlayer):enhanceCharacter()
		CreatureObject(pPlayer):sendSystemMessage("The musician buffer inspires you with performance and medical buffs.")
	elseif (screenID == "heal_player") then
		for i = 0, 8 do
			CreatureObject(pPlayer):setWounds(i, 0)
		end

		CreatureObject(pPlayer):setShockWounds(0)
		CreatureObject(pPlayer):sendSystemMessage("The musician buffer restores your wounds and fatigue.")
	elseif (screenID == "full_service") then
		CreatureObject(pPlayer):enhanceCharacter()

		for i = 0, 8 do
			CreatureObject(pPlayer):setWounds(i, 0)
		end

		CreatureObject(pPlayer):setShockWounds(0)
		CreatureObject(pPlayer):sendSystemMessage("The musician buffer fully restores and buffs you.")
	elseif (screenID == "song_stop") then
		self:stopOmniJukeboxSong(pPlayer, pNpc)
	elseif (screenID == "show_location") then
		local localX = SceneObject(pPlayer):getPositionX()
		local localY = SceneObject(pPlayer):getPositionY()
		local localZ = SceneObject(pPlayer):getPositionZ()
		local worldX = SceneObject(pPlayer):getWorldPositionX()
		local worldY = SceneObject(pPlayer):getWorldPositionY()
		local worldZ = SceneObject(pPlayer):getWorldPositionZ()
		local parentID = SceneObject(pPlayer):getParentID()

		CreatureObject(pPlayer):sendSystemMessage("Musician Buffer spawn line:")
		CreatureObject(pPlayer):sendSystemMessage("{ planet = \"tatooine\", x = " .. localX .. ", z = " .. localZ .. ", y = " .. localY .. ", heading = 0, cellID = " .. parentID .. ", name = \"Rinna Valen\" },")
		CreatureObject(pPlayer):sendSystemMessage("World position: x=" .. worldX .. " z=" .. worldZ .. " y=" .. worldY .. " parentID=" .. parentID)
	end

	return pNewConvScreen
end
