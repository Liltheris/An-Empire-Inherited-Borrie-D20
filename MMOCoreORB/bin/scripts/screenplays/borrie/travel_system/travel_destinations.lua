--Name, zone, X, Z, Y, Cell

travel_destinations = {

	--Tatooine
	{ 
		tag = "tatooine",
		name = "Tatooine",
		zone = "rp_tatooine",
		spaceports = {
			{
				tag = "mos_eisley",
				name = "Mos Eisley Spaceport",
				access = "public",
				landing_spots = {
					{"rp_tatooine", 1155.52, 0, 64.9075, 247, 0},
					{"rp_tatooine", 1110.12, 0, -63.1697, 344, 0},
					{"rp_tatooine", 971.043, 0, -27.9446, 64, 0},
				},
				public_arrival = {"rp_tatooine", -0.309974, 0.639421, 52.2248, 356, 610008050}
			},
			{
				tag = "mos_eisley_garrison",
				name = "Mos Eisley Garrison",
				access = "empire",
				land_ship = false,
				landing_spots = {
					{"rp_tatooine", 597.0, 0.0, 5.0, 0, 0},
				},
				public_arrival = {"rp_tatooine", 597.0, 0.0, 5.0, 0, 0}
			},
			{
				tag = "anchorhead",
				name = "Anchorhead",
				access = "public",
				local_only = true,
				landing_spots = {
					{"rp_tatooine", -567.496, 0, -1720.59, 153, 0},
					{"rp_tatooine", -499.056, 0, -1724.1, 219, 0},
					{"rp_tatooine", -463.46, 0, -1787.02, 266, 0},
					{"rp_tatooine", -526.125, 0, -1846.27, 337, 0},
				},
				public_arrival = {"rp_tatooine", -551.753, 0, -1776.99, 259, 0}
			}
		},
		landing_sites = {
			{
				tag = "mos_eisley_west",
				name = "Mos Eisley Outskirts, West",
				landing_spots = {
					{"rp_tatooine", 125.297, 0, 257.691, 82, 0},
					{"rp_tatooine", 127.964, 0, 324.503, 83, 0},
					{"rp_tatooine", 120.79, 0, 202.4, 71, 0},
					{"rp_tatooine", 51.7557, 0, 283.928, 87, 0},
				}
			},
			{
				tag = "mos_eisley_east",
				name = "Mos Eisley Outskirts, East",
				landing_spots = {
					{"rp_tatooine", 1509.78, 0, -144.106, 301, 0},
					{"rp_tatooine", 1452.35, 0, -212.775, 311, 0},
					{"rp_tatooine", 1574.81, 0, -61.8035, 282, 0},
					{"rp_tatooine", 1582.02, 0, -199.365, 306, 0},
				}
			},
			{
				tag = "wayfar",
				name = "Wayfar",
				landing_spots = {
					{"rp_tatooine", 4154.65, 9.19107, -6107.09, 57, 0},
					{"rp_tatooine", 4127.15, 7.72905, -5993.85, 130, 0},
					{"rp_tatooine", 4302.2, 8.74635, -5955.87, 183, 0},
				}
			},
			{
				tag = "jundland",
				name = "Jundland Waste",
				landing_spots = {
					{"rp_tatooine", -4400.0, 0.0, -70.0, 0, 0},
					{"rp_tatooine", 100.0, 0.0, 500.0, 0, 0},
					{"rp_tatooine", 100.0, 0.0, 500.0, 0, 0},
					{"rp_tatooine", 100.0, 0.0, 500.0, 0, 0},
					{"rp_tatooine", 100.0, 0.0, 500.0, 0, 0},
				}
			},
			{
				tag = "temple",
				name = "Abandoned Temple",
				skill = "rp_travel_tatooine_temple",
				landing_spots = {
					{"rp_tatooine", 4579.0, 0.0, 5524.0, 0, 0},
				}
			},
			{
				tag = "ramgers",
				name = "Antarian Ranger Base",
				skill = "rp_travel_tatooine_rangers",
				landing_spots = {
					{"rp_tatooine", -14.2141, -22.99, 172.045, 0, 880032654},
				}
			},
		}
	},

	--Alpheridies
	{
		tag = "alpheridies",
		name = "Alpheridies",
		zone = "rp_alpheridies",
		skill = "rp_travel_alpheridies",
		spaceports = {
			{
				tag = "stenadar",
				name = "Stenadar",
				skill = "rp_travel_alpheridies_stenadar",
				landing_spots = {
					{"rp_alpheridies", 1263.87, 10, -6555.93, 270, 0},
					{"rp_alpheridies", 1263.87, 10, -6605.24, 270, 0},
					{"rp_alpheridies", 1118.48, 10, -6558.48, 270, 0},
					{"rp_alpheridies", 1026.05, 10, -6558.48, 90, 0},
					{"rp_alpheridies", 915.09,  10, -6556.05, 0, 0},
				},
				public_arrival = {"rp_alpheridies", 1233, 10, -6536, 270, 0},
			},
		}
	},

	--Carida
	{
		tag = "carida",
		name = "Carida",
		zone = "rp_carida",
		spaceports = {
			{
				tag = "carida_academy",
				name = "Imperial Academy",
				access = "empire",
				land_ship = false,
				landing_spots = {
					{"rp_carida", 8, 320, 2916, 0, 0},
				},
				public_arrival = {"rp_carida", 8, 320, 2916, 0, 0},
			},
		}
	},

	--Dantooine
	{ 
		tag = "dantooine",
		name = "Dantooine",
		zone = "rp_dantooine",
		spaceports = {
			{
				tag = "damarise",
				name = "Damarise Outpost",
				access = "public",
				landing_spots = {
					{"rp_dantooine", 1382.96, 4, 3395.14, 78, 0},
					{"rp_dantooine", 1403.46, 4, 3421.26, 98, 0},
					{"rp_dantooine", 1294.28, 0.549124, 3338.18, 46, 0},
				},
				public_arrival = {"rp_dantooine", 1382.99, 4, 3434.36, 177, 0},
			},
		}
	},
	
	--Dathomir
	{ 
		tag = "dathomir",
		name = "Dathomir",
		zone = "rp_dathomir",
		spaceports = {
			{
				tag = "dathomir_prison",
				name = "Prison Facility",
				access = "empire",
				landing_spots = {
					{"rp_dathomir", -6280.39, 120, 911.564, 251, 0,},
					{"rp_dathomir", -6258.19, 120, 973.608, 204, 0,},
				},
				public_arrival = {"rp_dathomir", -6229.42, 120, 950.184, 237, 0},
			},
		}
	},
	
	--Ord Mantell
	{ 
		tag = "ord_mantell",
		name = "Ord Mantell",
		zone = "rp_space",
		spaceports = {
			{
				tag = "tansarii_station",
				name = "Tansarii Point Station",
				access = "public",
				landing_spots = {
					{"rp_space", 64.3099, 0.8, 46.8664, 229, 808251},
					{"rp_space", 62.0882, 0.8, -45.0693, 300, 808253},
				},
				public_arrival = {"rp_space", 40.6506, 0.8, 20.2095, 343, 808251},
			},
		}
	},
	
	--Deep Space
	{ 
		tag = "space",
		name = "Deep Space",
		zone = "rp_space",
		spaceports = {
			{
				tag = "imp_star_destroyer",
				name = "Star Destroyer",
				access = "empire",
				land_ship = false,
				landing_spots = {
					{"rp_space", 10, 173.8, 42.2, 0, 808038},
				},
				public_arrival = {"rp_space", 10, 173.8, 42.2, 0, 808038},
			},
			{
				tag = "nr_corellian_corvette",
				name = "Corellian Corvette",
				access = "newrepublic",
				land_ship = false,
				landing_spots = {
					{"rp_space", -34.8, 0, 0.1, 0, 808180,},
				},
				public_arrival = {"rp_space", -34.8, 0, 0.1, 0, 808180,},
			},
		}
	},
	
	--Rori
	{ 
		tag = "rori",
		name = "Rori",
		zone = "rp_rori",
		spaceports = {
			{
				tag = "new_restuss",
				name = "New Restuss Spaceport",
				access = "public",
				landing_spots = {
					{"rp_rori", -723.487, 83, 1548.43, 288, 0,},
					{"rp_rori", -726.655, 83, 1595.63, 257, 0,},
					{"rp_rori", -765.979, 83, 1550.32, 252, 0,},
					{"rp_rori", -769.159, 83, 1594.81, 257, 0,},
					{"rp_rori", -727.901, 83, 1633.56, 214, 0,},
				},
				public_arrival = {"rp_rori", -794.571, 83, 1601.23, 84, 0}
			},
			{
				tag = "zephyr",
				name = "Fort Zephyr",
				access = "newrepublic",
				land_ship = true,
				landing_spots = {
					{"rp_rori", 3607, 96, -6470, 180, 0,},
				},
				public_arrival = {"rp_rori", 3665, 96, -6502, 0, 0,},
			},
		}
	
	},

	--Sulon
	{ 
		tag = "sulon",
		name = "Sulon",
		zone = "rp_sulon",
		spaceports = {
			--[[{
				tag = "saltalo",
				name = "Saltalo Station",
				access = "public",
				landing_spots = {
					{"rp_sulon", 4452.29, 13.5625, -5401.87, 273, 0},
					{"rp_sulon", 4438.71, 11.4128, -5459.28, 289, 0},
					{"rp_sulon", 4452.26, 13.8534, -5358.66, 242, 0},
				},
				public_arrival = {"rp_sulon", 4343.12, 6, -5382.47, 218, 0}
			},]]
			{
				tag = "barons_hed",
				name = "Barons Hed Spaceport",
				access = "public",
				landing_spots = {
					{"rp_sulon", -6395.35, 10, 2173.69, 338, 0},
					{"rp_sulon", -6463.33, 10, 2066.96, 324, 0},
					{"rp_sulon", -6464.1, 10, 2286.1, 267, 0},
				},
				public_arrival = {"rp_sulon", -0.562431, 0.639421, 51.3521, 354, 610029873}
			}
		},
		landing_sites = {
			{
				tag = "akarlo_fueling_station",
				name = "Akarlo Fueling Station",
				landing_spots = {
					{"rp_sulon", 5367.0, 0.0, -5743.0, 0, 0},
				}
			},
			{
				tag = "saltalo",
				name = "Saltalo Station",
				landing_spots = {
					{"rp_sulon", 4452.29, 13.5625, -5401.87, 273, 0},
					{"rp_sulon", 4438.71, 11.4128, -5459.28, 289, 0},
					{"rp_sulon", 4452.26, 13.8534, -5358.66, 242, 0},
				},
			},
		}
	},
	
	--Mandalore
	{ 
		tag = "mandalore",
		name = "Mandalore",
		zone = "rp_mandalore",
		spaceports = {
			{
				tag = "keldabe",
				name = "Keldabe Spaceport",
				access = "public",
				landing_spots = {
					{"rp_mandalore", -3860, 35, -2550, 143, 0},
					{"rp_mandalore", -3735.14, 35, -2489.89, 178, 0},
				},
				public_arrival = {"rp_mandalore", 0.218065, 0.639421, 51.1265, 357, 50515}
			},
		}
	},

	--Yavin IV
	{
		tag = "yavin",
		name = "Yavin IV",
		zone = "rp_yavin4",
		landing_sites = {
			{
				tag = "yavin4_lz",
				name = "Yavin IV Primary Landing Zone",
				landing_spots = {
					{"rp_yavin4", 1504.0, 0.0, 1484.0, 0, 0},
				}
			},
		}
	},

	--Dromund Kaas
	{
		tag = "dromund_kaas",
		name = "Dromund Kaas",
		zone = "rp_dromund_kaas",
		skill = "rp_travel_dromund_kaas",
		landing_sites = {
			{
				tag = "kaas_city",
				name = "Kaas City Ruins",
				skill = "rp_travel_dromund_kaas_city",
				landing_spots = {
					{"rp_dromund_kaas", -2336.29, 126.583, -1690.21, 301, 0},
				}
			},
			{
				tag = "temple1",
				name = "Dark Temple Ruins",
				skill = "rp_travel_dromund_kaas_temple1",
				landing_spots = {
					{"rp_dromund_kaas", 1496.78, 175, 1500.55, 269, 0},
				}
			},
		}
	},

	--Truska
	{
		tag = "truska",
		name = "Truska",
		zone = "rp_truska",
		skill = "rp_travel_truska",
		landing_sites = {
			{
				tag = "cyunari",
				name = "Cyunari Ruins",
				skill = "rp_travel_truska_cyunari",
				landing_spots = {
					{"rp_truska", -1663.0, 0.0, -2923.0, 0, 0},
				}
			},
		}
	},

	--Coruscant
	{
		tag = "coruscant",
		name = "Coruscant",
		zone = "rp_coruscant",
		skill = "rp_travel_coruscant",
		landing_sites = {
			{
				tag = "estate",
				name = "Moff Zarane's Estate",
				skill = "rp_travel_coruscant_heist",
				landing_spots = {
					{"rp_coruscant", 7.14891, 7.9418, 22.6309, 176, 880033076},
				}
			}
		}
	},
}