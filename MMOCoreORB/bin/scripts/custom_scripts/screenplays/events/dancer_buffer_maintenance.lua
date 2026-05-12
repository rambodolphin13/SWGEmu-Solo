DancerBufferMaintenance = ScreenPlay:new {
	numberOfActs = 1,

	-- How often to refill HAM while the NPC is dancing.
	tickTime = 5 * 1000
}

registerScreenPlay("DancerBufferMaintenance", false)

function DancerBufferMaintenance:maintainHAM(pNpc)
	if (pNpc == nil) then
		return
	end

	if (not CreatureObject(pNpc):isDancing()) then
		return
	end

	for i = 0, 8 do
		CreatureObject(pNpc):setHAM(i, CreatureObject(pNpc):getMaxHAM(i))
	end

	createEvent(self.tickTime, "DancerBufferMaintenance", "maintainHAM", pNpc, "")
end
