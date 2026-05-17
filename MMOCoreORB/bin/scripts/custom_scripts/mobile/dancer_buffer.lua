dancer_buffer = Creature:new {
	customName = "Vessa Talorin (Dancer Buffer)",
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

	templates = {"object/mobile/dressed_diva_human_female_01.iff"},

	lootGroups = {},
	weapons = {},
	conversationTemplate = "dancerBufferConvoTemplate",
	defaultAttack = "",

	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	primaryAttacks = {},
	secondaryAttacks = {}
}

CreatureTemplates:addCreatureTemplate(dancer_buffer, "dancer_buffer")
