npc_template = {

	name = "???",
	baseTemplates = {
		"rp_human_male", 90,
		"rp_human_female", 10
	},
	skillTemplates = {"narestra/force/adept"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/inquisitor/assassin"}},
		{"rp_human_female", {"faction/inquisitor/assassin"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"/private/index_color_2", 7},
		{"height", 1.3},
	},

}