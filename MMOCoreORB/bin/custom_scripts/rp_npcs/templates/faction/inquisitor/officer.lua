npc_template = {

	randomName = "human",
	baseTemplates = {
		"rp_human_male", 70,
		"rp_human_female", 30
	},
	skillTemplates = {"common/soldier_officer"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/inquisitor/officer"}},
		{"rp_human_female", {"faction/inquisitor/officer"}},
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
	}
}