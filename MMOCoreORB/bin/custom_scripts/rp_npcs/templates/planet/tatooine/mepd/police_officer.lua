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
	skillTemplates = {"common/soldier_officer"},
	
	equipmentTemplates = {
		{"rp_human_male", {"civ/tatooine/police_officer"}},
		{"rp_human_female", {"civ/tatooine/police_officer"}},
		{"rp_twilek_male", {"civ/tatooine/police_officer"}},
		{"rp_twilek_female", {"civ/tatooine/police_officer"}},
		{"rp_rodian_male", {"civ/tatooine/police_officer"}},
		{"rp_rodian_female", {"civ/tatooine/police_officer"}},
		{"rp_nikto_male", {"civ/tatooine/police_officer"}},
		{"rp_weequay_male", {"civ/tatooine/police_officer"}},
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