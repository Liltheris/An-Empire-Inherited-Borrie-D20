npc_template = {

	randomName = "human",
	baseTemplates = {
		"rp_human_male", 70,
		"rp_human_female", 30
	},
	skillTemplates = {"factional/common/tech_lead"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/imperial/tech_lead"}},
		{"rp_human_female", {"faction/imperial/tech_lead"}},
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