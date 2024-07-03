local spawnGroupTag = "miraluka"

spawn_group = {
	organic = {
		{"rp_miraluka_male", 100},
		{"rp_miraluka_female", 100},
	},
	droid = {
		{"r5", 10},
		{"r4", 10},
	}	
}

CivSpawnGroups:addCivSpawnGroup(spawnGroupTag, spawn_group)