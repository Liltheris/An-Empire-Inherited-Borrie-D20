npc_template = {

	title = "a New Republic Recruiter",
	randomName = "human",
	
	baseTemplates = {
		"rp_human_male", 50, "rp_human_female", 30,
		"rp_sullustan_male", 5, "rp_sullustan_female", 2,
		"rp_zabrak_male", 15, "rp_zabrak_female", 15,
		"rp_mirialan_male", 10, "rp_mirialan_female", 10,
		"rp_moncal_male", 5, "rp_moncal_female", 2,
		"rp_twilek_male", 15, "rp_twilek_female", 10,
	},
	
	skillTemplates = {"factional/common/officer"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/newrepublic/officer"}},
		{"rp_human_female", {"faction/newrepublic/officer"}},
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