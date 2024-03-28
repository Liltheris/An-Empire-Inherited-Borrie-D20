npc_template = {

	randomName = "stormtrooper",
	baseTemplates = {
		"rp_human_male", 80,
		"rp_human_female", 20
	},
	skillTemplates = {"common/soldier"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/inquisitor/trooper"}},
		{"rp_human_female", {"faction/inquisitor/trooper"}},
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

	armour = "armourset_stormtrooper",
}