base = {
	tag = "kaadara_base",
	name = "Kaadara",
	defaultOwner = "empire",
	
	flags = {
	
	},
	
	spawns = {
		--Type, Zone, x, z, y, angle, cell
		{"trooper","rp_naboo", 5212.76, -192, 6683.02, 270, 0,},
		{"trooper","rp_naboo", 5210.99, -192, 6672.11, 275, 0,},
		{"trooper","rp_naboo", -16.3967, 0.639426, 63.5965, 86, 1741539,},
		{"trooper","rp_naboo", -16.3967, 0.639425, 57.9261, 93, 1741539,},
		{"trooper","rp_naboo", 15.9423, 0.639422, 63.4027, 262, 1741539,},
		{"trooper","rp_naboo", 15.9423, 0.639422, 58.1357, 277, 1741539,},
	}
}

BorPlanetManager:addBase(base)