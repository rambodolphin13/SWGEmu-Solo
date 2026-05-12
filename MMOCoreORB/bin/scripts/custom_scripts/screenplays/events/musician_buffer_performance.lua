MusicianBufferPerformance = ScreenPlay:new {
	numberOfActs = 1
}

registerScreenPlay("MusicianBufferPerformance", false)

-- Deprecated by jukebox-area music test.
-- Kept as a harmless placeholder in case screenplays.lua still includes it.
function MusicianBufferPerformance:playMusicLoop(pNpc)
	return
end
