npc_template = {

	randomName = "human",
	
	baseTemplates = {
		"rp_human_male", 60,
		 "rp_human_female", 40
	},
	
	skillTemplates = {"common/soldier_weak"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/newrepublic/grunt_army_snow"}},
		{"rp_human_female", {"faction/newrepublic/grunt_army_snow"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random_military"}},
		{"rp_human_female", {"random_military"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
	}
}