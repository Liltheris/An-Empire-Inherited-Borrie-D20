npc_template = {

	randomName = "zabrak",
	baseTemplates = {
		"rp_human_male", 10,
		"rp_human_female", 10,
		"rp_twilek_male", 5,
		"rp_twilek_female", 5,
		"rp_rodian_male", 5,
		"rp_rodian_female", 5,
		"rp_nikto_male", 40,
		"rp_weequay_male", 20,
	},
	skillTemplates = {"common/soldier_scout"},
	
	equipmentTemplates = {
		{"rp_human_male", {"naboo/borhek_scout"}},
		{"rp_human_female", {"naboo/borhek_scout"}},
		{"rp_twilek_male", {"naboo/borhek_scout"}},
		{"rp_twilek_female", {"naboo/borhek_scout"}},
		{"rp_rodian_male", {"naboo/borhek_scout"}},
		{"rp_rodian_female", {"naboo/borhek_scout"}},
		{"rp_nikto_male", {"naboo/borhek_scout"}},
		{"rp_weequay_male", {"naboo/borhek_scout"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
		{"rp_twilek_male", {"random"}},
		{"rp_twilek_female", {"random"}},
		{"rp_rodian_male", {"random"}},
		{"rp_rodian_female", {"random"}},
		{"rp_nikto_male", {"random"}},
		{"rp_weequay_male", {"random"}},
	},	

	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
	}
}