rp_pet = Creature:new {
	socialGroup = "",
	faction = "",
	level = 4,
	chanceHit = 0.24,
	damageMin = 10,
	damageMax = 10,
	baseXp = 0,
	baseHAM = 1000,
	baseHAMmax = 1000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
}

rp_r2 = rp_pet:new {
	objectName = "@droid_name:r2_crafted",
	templates = {
		"object/creature/npc/droid/crafted/r2_droid.iff"
	},
}

rp_r3 = rp_pet:new {
	objectName = "@droid_name:r3_crafted",
	templates = {
		"object/creature/npc/droid/crafted/r3_droid.iff"
	},
}

rp_r4 = rp_pet:new {
	objectName = "@droid_name:r4_crafted",
	templates = {
		"object/creature/npc/droid/crafted/r4_droid.iff"
	},
}

rp_r5 = rp_pet:new {
	objectName = "@droid_name:r5_crafted",
	templates = {
		"object/creature/npc/droid/crafted/r5_droid.iff"
	},
}

c3p0_crafted = rp_pet:new {
	objectName = "@droid_name:po_crafted",
	templates = {
		"object/creature/npc/droid/crafted/3po_droid.iff"
	},		
}

rp_mse = rp_pet:new {
	objectName = "@droid_name:mse_6_crafted",
	templates = {
		"object/creature/npc/droid/crafted/mse_6_droid.iff"
	},		
}

rp_cll8_binary_load_lifter = rp_pet:new {
	objectName = "@droid_name:cll_8_binary_load_lifter_crafted",
	templates = {
		"object/creature/npc/droid/crafted/cll_8_binary_load_lifter.iff"
	},		
}

rp_eg6 = rp_pet:new {
	objectName = "@droid_name:eg_6_power_droid_crafted",
	templates = {
		"object/creature/npc/droid/crafted/eg_6_power_droid.iff"
	},		
}

CreatureTemplates:addCreatureTemplate(rp_eg6, "rp_eg6")
CreatureTemplates:addCreatureTemplate(rp_cll8_binary_load_lifter, "rp_cll8_binary_load_lifter")
CreatureTemplates:addCreatureTemplate(rp_c3p0, "rp_protocol_droid")
CreatureTemplates:addCreatureTemplate(rp_mse, "rp_mouse_droid")
CreatureTemplates:addCreatureTemplate(rp_r2, "rp_r2")
CreatureTemplates:addCreatureTemplate(rp_r3, "rp_r3")
CreatureTemplates:addCreatureTemplate(rp_r4, "rp_r4")
CreatureTemplates:addCreatureTemplate(rp_r5, "rp_r5")

