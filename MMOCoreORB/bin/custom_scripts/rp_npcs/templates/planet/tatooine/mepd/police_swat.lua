npc_template = {

	random_militaryName = "zabrak",
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
	skillTemplates = {"common/soldier_weak"},
	
	equipmentTemplates = {
		{"rp_human_male", {"civ/tatooine/police_elite"}},
		{"rp_human_female", {"civ/tatooine/police_elite"}},
		{"rp_twilek_male", {"civ/tatooine/police_elite"}},
		{"rp_twilek_female", {"civ/tatooine/police_elite"}},
		{"rp_rodian_male", {"civ/tatooine/police_elite"}},
		{"rp_rodian_female", {"civ/tatooine/police_elite"}},
		{"rp_nikto_male", {"civ/tatooine/police_elite"}},
		{"rp_weequay_male", {"civ/tatooine/police_elite"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random_military"}},
		{"rp_human_female", {"random_military"}},
		{"rp_twilek_male", {"random_military"}},
		{"rp_twilek_female", {"random_military"}},
		{"rp_rodian_male", {"random_military"}},
		{"rp_rodian_female", {"random_military"}},
		{"rp_nikto_male", {"random_military"}},
		{"rp_weequay_male", {"random_military"}},
	},	

	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
	}
}