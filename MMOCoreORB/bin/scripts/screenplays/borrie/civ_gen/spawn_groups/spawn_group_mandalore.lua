local spawnGroupTag = "mandalore"

spawn_group = {
	organic = {
		{"rp_human_male", 80},
		{"rp_human_female", 80},
		{"rp_zabrak_male", 10},
		{"rp_zabrak_female", 10},
		{"rp_mirialan_male", 2},
		{"rp_mirialan_female", 2},
		{"rp_zeltron_male", 1},
		{"rp_zeltron_female", 1},
	},
	droid = {
		{"r5", 10},
		{"r4", 10},
	}	
}

CivSpawnGroups:addCivSpawnGroup(spawnGroupTag, spawn_group)