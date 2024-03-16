--Name, zone, X, Z, Y, Cell

travel_destinations = {

	--Carida
	{
		tag = "carida",
		name = "Carida",
		zone = "rp_carida",
		destinations = {
			{"Imperial Academy", "rp_carida", 8, 320, 2916, 0, "empire"},
		},
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
		destinations = {
			{"Damarise Outpost", "rp_dantooine", 1368, 4, 3403, 0, "public"},
		},
		spaceports = {
			{
				tag = "damarise",
				name = "Damarise Outpost",
				access = "public",
				landing_spots = {
					{"rp_dantooine", 1368, 4, 3403, 0, 0,},
				},
				public_arrival = {"rp_dantooine", 1368, 4, 3403, 0, 0,},
			},
		}
	},
	
	--Dathomir
	{ 
		tag = "dathomir",
		name = "Dathomir",
		zone = "rp_dathomir",
		destinations = {
			{"Prison Facility", "rp_dathomir", -6248.52, 120, 977.714, 0, "empire"}
		},
		spaceports = {
			{
				tag = "dathomir_prison",
				name = "Prison Facility",
				access = "empire",
				landing_spots = {
					{"rp_dathomir", -6248.52, 120, 977.714, 0, 0,},
				},
				public_arrival = {"rp_dathomir", -6248.52, 120, 977.714, 0, 0,},
			},
		}
	},
	
	--Ord Mantell
	{ 
		tag = "ord_mantell",
		name = "Ord Mantell",
		zone = "rp_space",
		destinations = {
			{"Tansarii Point Station", "rp_space", 52.3, 0.9, 27.8, 808251, "public"},
		},
		spaceports = {
			{
				tag = "tansarii_station",
				name = "Tansarii Point Station",
				access = "public",
				landing_spots = {
					{"rp_space", 52.3, 0.9, 27.8, 0, 808251,},
				},
				public_arrival = {"rp_space", 52.3, 0.9, 27.8, 0, 808251,},
			},
		}
	},
	
	--Deep Space
	{ 
		tag = "space",
		name = "Deep Space",
		zone = "rp_space",
		destinations = {
			{"Corellian Corvette", "rp_space", -34.8, 0, 0.1, 808180, "newrepublic"},
			{"Star Destroyer", "rp_space", 10, 173.8, 42.2, 808038, "empire"},
		},
		spaceports = {
			{
				tag = "imp_star_destroyer",
				name = "Star Destroyer",
				access = "empire",
				landing_spots = {
					{"rp_space", 10, 173.8, 42.2, 0, 808038},
				},
				public_arrival = {"rp_space", 10, 173.8, 42.2, 0, 808038},
			},
			{
				tag = "nr_corellian_corvette",
				name = "Corellian Corvette",
				access = "newrepublic",
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
		destinations = {
			{"New Restuss", "rp_rori", -775, 83, 1554, 0, "public"},
			{"Fort Zephyr", "rp_rori", -3688, 96, -6403, 0, "newrepublic"},
		},
		spaceports = {
			{
				tag = "new_restuss",
				name = "New Restuss Spaceport",
				access = "public",
				landing_spots = {
					{"rp_rori", -775.0, 83.0, 1554.0, -45, 0,},
				},
				public_arrival = {"rp_rori", -775.0, 83.0, 1554.0, -45, 0,}
			},
		}
	
	},

	--Sulon
	{ 
		tag = "sulon",
		name = "Sulon",
		zone = "rp_sulon",
		destinations = {
			{"Saltalo Station", "rp_sulon", 4346, 6.0, -5382, 0, "public"},
			{"Barons Hed", "rp_sulon", -6401, 6.0, 2202, 0, "public"},
		},
		spaceports = {
			{
				tag = "saltalo",
				name = "Saltalo Station",
				access = "public",
				landing_spots = {
					{"rp_sulon", 4478.0, 0.0, -5402.0, 0, 0,},
				},
				public_arrival = {"rp_sulon", 4346.0, 0.0, -5382.0, 0, 0,}
			},
			{
				tag = "barons_hed",
				name = "Barons Hed Spaceport",
				access = "public",
				landing_spots = {
					{"rp_sulon", -6401.0, 0.0, 2202.0, 0, 0,},
				},
				public_arrival = {"rp_sulon", -6401.0, 0.0, 2202.0, 0, 0,}
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
		}
	},
	
	--Tatooine
	{ 
		tag = "tatooine",
		name = "Tatooine",
		zone = "rp_tatooine",
		destinations = {
			{"Anchorhead", "rp_tatooine", -560, 0.0, -1770, 0, "public"},
			{"Mos Eisley", "rp_tatooine", 1150, 0.0, 100, 0, "public"},
			{"Mos Eisley Garrison", "rp_tatooine", 597, 0.0, 5, 0, "empire"},
		},
		spaceports = {
			{
				tag = "mos_eisley",
				name = "Mos Eisley Spaceport",
				access = "public",
				landing_spots = {
					{"rp_tatooine", 1150.0, 0.0, -1770.0, 0, 0},
					{"rp_tatooine", 1110.0, 0.0, -63.0, 0, 0},
					{"rp_tatooine", 973.0, 0.0, -27.0, 0, 0},
				},
				public_arrival = {"rp_tatooine", 0.0, 0.0, 0.0, 0, 0}
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
					{"rp_tatooine", -560.0, 0.0, -1770.0, 0, 0},
					{"rp_tatooine", -535.0, 0.0, -1708.0, 0, 0},
				},
				public_arrival = {"rp_tatooine", 0.0, 0.0, 0.0, 0, 0}
			}
		},
		landing_sites = {
			{
				tag = "mos_eisley_west",
				name = "Mos Eisley Outskirts, West",
				landing_spots = {
					{"rp_tatooine", 100.0, 0.0, 500.0, 0, 0},
				}
			},
			{
				tag = "mos_eisley_east",
				name = "Mos Eisley Outskirts, East",
				landing_spots = {
					{"rp_tatooine", 1535.0, 0.0, -200.0, 0, 0},
				}
			},
			{
				tag = "wayfar",
				name = "Wayfar",
				landing_spots = {
					{"rp_tatooine", 4207.0, 0.0, -6133.0, 0, 0},
				}
			},
			{
				tag = "jundland",
				name = "Jundland Waste",
				landing_spots = {
					{"rp_tatooine", -4400.0, 0.0, -70.0, 0, 0},
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
		}
	},
	
	--Mandalore
	{ 
		tag = "mandalore",
		name = "Mandalore",
		zone = "rp_mandalore",
		destinations = {
			{"Keldabe", "rp_mandalore", -3860.0, 0.0, -2550.0, 0, "public"},
		}	
	},

	--Truska
	{
		tag = "truska",
		name = "Truska",
		zone = "rp_truska",
		skill = "rp_travel_truska",
		destinations = {
			{"Cyunari", "rp_truska", -1663.0, 0.0, -2923.0, 0, "public"},
		},
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
}