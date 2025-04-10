npc_template = {

	randomName = "darktrooper",
	baseTemplates = {
		"rp_human_male", 90,
		"rp_human_female", 10
	},
	skillTemplates = {"common/soldier_strong"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/inquisitor/elite"}},
		{"rp_human_female", {"faction/inquisitor/elite"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.3},
	},

	armour = "armourset_shocktrooper",
}