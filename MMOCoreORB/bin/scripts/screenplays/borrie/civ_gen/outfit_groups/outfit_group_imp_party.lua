local outfitGroupTag = "imp_party"

outfit_group = {
	female = { 
		"civ/carida/civilian_female_s01",
		"civ/carida/civilian_female_s03",
		"civ/carida/civilian_female_s04",
		"civ/carida/civilian_female_s05",
		"civ/carida/civilian_female_s06",
		"civ/carida/civilian_female_s08",
		"faction/imperial/officer_colonel",
		"faction/imperial/officer_captain",
		"faction/imperial/officer_commander",
		"civ/rori/civilian_female_s01",
		"civ/rori/civilian_female_s03",
		"civ/rori/civilian_female_s05",
		"civ/rori/civilian_female_s08",
	},
	
	male = {
		"civ/carida/civilian_male_s01",
		"civ/carida/civilian_male_s03",
		"civ/carida/civilian_male_s04",
		"civ/carida/civilian_male_s07",
		"civ/carida/civilian_male_s09",
		"faction/imperial/officer_colonel",
		"faction/imperial/officer_captain",
		"faction/imperial/officer_commander",
	},
	
	unisex = {

	},	
}

CivOutfitGroups:addCivOutfitGroup(outfitGroupTag, outfit_group)