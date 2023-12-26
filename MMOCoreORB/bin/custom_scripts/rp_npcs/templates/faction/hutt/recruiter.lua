npc_template = {

	title = "a Hutt Recruiter",
	randomName = "human",
	baseTemplates = {
		"rp_human_male", 10,
		"rp_human_female", 10,
		"rp_nikto_male", 40,
		"rp_weeqay_male", 20
	},
	skillTemplates = {"factional/common/officer"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/hutt/recruiter"}},
		{"rp_human_female", {"faction/hutt/recruiter"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
}