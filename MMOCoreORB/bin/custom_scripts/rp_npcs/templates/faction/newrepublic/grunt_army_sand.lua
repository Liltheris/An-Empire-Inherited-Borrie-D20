npc_template = {

	randomName = "human",
	
	baseTemplates = {
	"rp_human_male", "rp_human_female",
	"rp_sullustan_male", "rp_sullustan_female",
	"rp_zabrak_male", "rp_zabrak_female",
	"rp_mirialan_male", "rp_mirialan_female",
	"rp_moncal_male", "rp_moncal_female",
	"rp_twilek_male", "rp_twilek_female"},
	
	skillTemplates = {"factional/common/grunt_army"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_human_female", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_sullustan_male", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_sullustan_female", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_zabrak_male", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_zabrak_female", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_mirialan_male", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_mirialan_female", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_moncal_male", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_moncal_female", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_twilek_male", {"faction/newrepublic/grunt_army_sand"}},
		{"rp_twilek_female", {"faction/newrepublic/grunt_army_sand"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.2},
	}
}