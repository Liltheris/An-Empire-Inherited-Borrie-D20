npc_template = {

	randomName = "human",
	baseTemplates = {
		"rp_miraluka_male", 50,
		"rp_miraluka_female", 50
	},
	skillTemplates = {"narestra/force/adept"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/inquisitor/elite"}},
		{"rp_human_female", {"faction/inquisitor/elite"}},
	},	
	
	customizationTemplates = {
		{"rp_miraluka_male", {"random_military"}},
		{"rp_miraluka_female", {"random_miltary"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.3},
	}
}