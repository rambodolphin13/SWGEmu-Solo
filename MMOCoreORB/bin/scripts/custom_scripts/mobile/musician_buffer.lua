musician_buffer = Creature:new {
	customName = "Rinna Valen (Musician Buffer)",
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

	-- Female cantina-style look. Change this if you find a musician-specific look you prefer.
	templates = {"object/mobile/dressed_diva_human_female_01.iff"},
	outfit = "band_slitherhorn_outfit",

	lootGroups = {},
	weapons = {},
	conversationTemplate = "musicianBufferConvoTemplate",
	defaultAttack = "",

	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	primaryAttacks = {},
	secondaryAttacks = {}
}

CreatureTemplates:addCreatureTemplate(musician_buffer, "musician_buffer")
