local outfits = {
	"themed/biker1",
	"themed/biker2",
	"themed/biker3",
	"themed/biker4",
	"themed/biker5",
	"themed/biker6",
	"themed/biker7",
	"themed/biker8",
	"themed/biker9",
	"themed/biker10",
	"themed/biker11",
	"themed/biker12",
	"themed/biker13",
	"themed/biker14",
	"themed/biker15",
}

npc_template = {

	randomName = "zabrak",
	baseTemplates = {
		"rp_human_male", 10,
		"rp_human_female", 10,
		"rp_twilek_male", 5,
		"rp_twilek_female", 5,
		"rp_rodian_male", 5,
		"rp_rodian_female", 5,
		"rp_nikto_male", 5,
		"rp_weequay_male", 5,
	},
	skillTemplates = {"common/soldier"},
	
	equipmentTemplates = {
		{"rp_human_male", outfits},
		{"rp_human_female", outfits},
		{"rp_twilek_male", outfits},
		{"rp_twilek_female", outfits},
		{"rp_rodian_male", outfits},
		{"rp_rodian_female", outfits},
		{"rp_nikto_male", outfits},
		{"rp_weequay_male", outfits},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random_military"}},
		{"rp_human_female", {"random_military"}},
		{"rp_twilek_male", {"random"}},
		{"rp_twilek_female", {"random"}},
		{"rp_rodian_male", {"random"}},
		{"rp_rodian_female", {"random"}},
		{"rp_nikto_male", {"random"}},
		{"rp_weequay_male", {"random"}},
	},	
}