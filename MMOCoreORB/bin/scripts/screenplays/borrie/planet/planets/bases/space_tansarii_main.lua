base = {
	tag = "space_tansarii_main",
	name = "Tansarii Point Station",
	defaultOwner = "empire",
	
	flags = {
	
	},
	
	spawns = {
		--Type, Zone, x, z, y, angle, cell
		--{"recruiter", "rp_space", -16.0541, -1, 2.93524, 105, 808246},--{"space_tansarii_main"}},
		{"navy/trooper","rp_space", 33.313, 0.8, 22.3513, 52, 808251,},
		{"navy/trooper","rp_space", 34.5004, -0.993132, -1.39064, 271, 808249,},
		{"navy/trooper","rp_space", 33.2424, 0.8, -22.2979, 126, 808253,},
		{"navy/trooper","rp_space", -31.8949, 0.8, -13.4827, 78, 808248,},
		{"officer/lieutenant","rp_space", -9.38065, 0.755165, 42.4916, 266, 808255,},
		{"navy/trooper","rp_space", -19.2981, 0.61331, 47.9864, 158, 808255,},
		{"navy/trooper","rp_space", -10.7609, 0.8, 38.0179, 258, 808255,},
		{"navy/trooper","rp_space", 16.0066, 0.8, 31.0147, 204, 808250,},
	}
}

BorPlanetManager:addBase(base)