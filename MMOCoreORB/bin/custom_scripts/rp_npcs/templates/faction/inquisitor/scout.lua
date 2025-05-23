npc_template = {

	randomName = "scouttrooper",
	baseTemplates = {
		"rp_human_male", 65,
		"rp_human_female", 35
	},
	skillTemplates = {"common/soldier_scout"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/inquisitor/scout"}},
		{"rp_human_female", {"faction/inquisitor/scout"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.2},
	},

	armour = "armourset_scouttrooper",
}