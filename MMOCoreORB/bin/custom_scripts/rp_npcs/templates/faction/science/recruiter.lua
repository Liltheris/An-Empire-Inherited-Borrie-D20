npc_template = {

	title = "a Science Coalition Recruiter",
	randomName = "human",
	baseTemplates = {
		"rp_human_male", 10,
		"rp_human_female", 10
	},
	skillTemplates = {"common/mechanic"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/science/recruiter"}},
		{"rp_human_female", {"faction/science/recruiter"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
}