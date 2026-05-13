MusicianBufferMusicMaintenance = ScreenPlay:new {
	numberOfActs = 1,

	-- Keep Rinna's real nalargon performance from draining/stopping.
	tickTime = 1 * 1000
}

registerScreenPlay("MusicianBufferMusicMaintenance", false)

function MusicianBufferMusicMaintenance:maintainHAM(pNpc)
	if (pNpc == nil) then
		return
	end

	if (not CreatureObject(pNpc):isPlayingMusic()) then
		return
	end

	for i = 0, 8 do
		CreatureObject(pNpc):setHAM(i, CreatureObject(pNpc):getMaxHAM(i))
	end

	createEvent(self.tickTime, "MusicianBufferMusicMaintenance", "maintainHAM", pNpc, "")
end
