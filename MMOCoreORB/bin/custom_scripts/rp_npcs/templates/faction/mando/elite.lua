npc_template = {

	name = "a Mandalorian Protector",
	baseTemplates = {
		"rp_human_male", 50,
		"rp_human_female", 50
	},
	skillTemplates = {"factional/common/elite"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/mando/clan_protector_m"}},
		{"rp_human_female", {"faction/mando/clan_protector_f"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.1},
	}
}