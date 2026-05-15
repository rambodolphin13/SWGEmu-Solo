doctor_droid = Creature:new {
	customName = "Doctor Droid (Buffer)",
	socialGroup = "townsperson",
	faction = "",
	level = 1,
	chanceHit = 0.1,
	damageMin = 1,
	damageMax = 1,
	baseXp = 0,
	baseHAM = 1000,
	baseHAMmax = 1000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,0},
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/21b_surgical_droid.iff"},

	lootGroups = {},
	weapons = {},
	conversationTemplate = "doctorDroidConvoTemplate",
	defaultAttack = "",

	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	primaryAttacks = {},
	secondaryAttacks = {}
}

CreatureTemplates:addCreatureTemplate(doctor_droid, "doctor_droid")
