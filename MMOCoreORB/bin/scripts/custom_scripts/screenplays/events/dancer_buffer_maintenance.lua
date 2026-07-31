DancerBufferMaintenance = ScreenPlay:new {
	numberOfActs = 1,

	-- Frequent enough to keep NPC performances stable without expensive AI logic.
	tickTime = 5 * 1000,
	restartDelay = 2 * 1000
}

registerScreenPlay("DancerBufferMaintenance", false)

function DancerBufferMaintenance:maintainHAM(pNpc)
	if (pNpc == nil) then
		return
	end

	-- If the dance was interrupted, restart the NPC's assigned performance.
	if (not CreatureObject(pNpc):isDancing()) then
		createEvent(self.restartDelay, "DancerBufferSpawns", "startPerformance", pNpc, "")
		return
	end

	for i = 0, 8 do
		CreatureObject(pNpc):setHAM(i, CreatureObject(pNpc):getMaxHAM(i))
	end

	createEvent(self.tickTime, "DancerBufferMaintenance", "maintainHAM", pNpc, "")
end
