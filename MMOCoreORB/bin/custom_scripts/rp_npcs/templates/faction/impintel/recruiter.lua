npc_template = {

	title = "a Imperial Intelligence Recruiter",
	randomName = "human",
	baseTemplates = {
		"rp_human_male", 60,
		"rp_human_female", 40
	},
	skillTemplates = {"factional/common/officer"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/impintel/recruiter"}},
		{"rp_human_female", {"faction/impintel/recruiter"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
}