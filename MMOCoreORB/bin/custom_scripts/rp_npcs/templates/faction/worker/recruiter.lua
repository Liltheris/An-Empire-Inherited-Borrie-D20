npc_template = {

	title = "a Worker's Union Recruiter",
	randomName = "human",
	baseTemplates = {
		"rp_human_male", 10,
		"rp_human_female", 10
	},
	skillTemplates = {"common/mechanic"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/worker/recruiter"}},
		{"rp_human_female", {"faction/worker/recruiter"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
}