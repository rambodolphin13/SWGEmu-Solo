MusicianBufferPerformance = ScreenPlay:new {
	numberOfActs = 1
}

registerScreenPlay("MusicianBufferPerformance", false)

-- Deprecated by real jukebox control.
function MusicianBufferPerformance:playMusicLoop(pNpc)
	return
end
