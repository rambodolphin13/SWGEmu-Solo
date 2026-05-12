musicianBufferConvoHandler = conv_handler:new {}

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

	if (screenID == "buff_player") then
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
	elseif (screenID == "song_figrin_1") then
		self:playOmniJukeboxSong(pPlayer, pNpc, "sound/music_figrin_dan_1_loop.snd", "Figrin Dan 1")
	elseif (screenID == "song_figrin_2") then
		self:playOmniJukeboxSong(pPlayer, pNpc, "sound/music_figrin_dan_2_loop.snd", "Figrin Dan 2")
	elseif (screenID == "song_max_rebo_1") then
		self:playOmniJukeboxSong(pPlayer, pNpc, "sound/music_max_rebo_1_loop.snd", "Max Rebo 1")
	elseif (screenID == "song_max_rebo_2") then
		self:playOmniJukeboxSong(pPlayer, pNpc, "sound/music_max_rebo_2_loop.snd", "Max Rebo 2")
	elseif (screenID == "song_chamber") then
		self:playOmniJukeboxSong(pPlayer, pNpc, "sound/music_starport_a_loop.snd", "Chamber Music")
	elseif (screenID == "song_intro") then
		self:playOmniJukeboxSong(pPlayer, pNpc, "sound/music_intro_loop.snd", "Star Wars Intro")
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
