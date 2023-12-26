npc_template = {

	title = "a Bounty Hunter Guild Recruiter",
	randomName = "human",
	baseTemplates = {
		"rp_human_male", 10,
		"rp_human_female", 10
	},
	skillTemplates = {"factional/common/officer"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/bounty/recruiter"}},
		{"rp_human_female", {"faction/bounty/recruiter"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
}