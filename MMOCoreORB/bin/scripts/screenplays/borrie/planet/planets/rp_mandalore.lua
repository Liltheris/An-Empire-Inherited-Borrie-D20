planet = {
	name = "Mandalore",
	zone = "rp_mandalore",
	startingFaction = "mando",
	startingFactionControl = 70,
	bases = {
		"keldabe",
	},
	
	landing_points = {
		--Tag, Name, Zone, x, z, y, angle, cell, shipVisible
		{"keldabe_starport", "Keldabe", "rp_mandalore", -3860.0, 0.0, -2550.0, 0, true,},
	}	
}

BorPlanetManager:addPlanet(planet)