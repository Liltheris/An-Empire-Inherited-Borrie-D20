faction = {
    -- Visual and theme data
    name = "Galactic Empire",
    adjective = "imperial",

    -- Functional data
    tag = "imp_thrawn",
    enemies = {
		"newrepublic",
        "smugglers",
        "mando",
	},
	allies = {},

    -- Base spawning data
    unitgroup = "imperial",
    recruiter_theme = "rt_imperial",

    branches = {
        {
            name = "Stormtrooper Corps",
            ranks = {"Private", "Lance Corporal", "Corporal", "Sergeant", "Master Sergeant", "Lieutenant"},

            uniform = "faction/empire/uniform/stormtrooper",

            roles = {
                -- role, loadout, munitions
                {"Stormtrooper", "faction/empire/loadout/stormtrooper", "faction/empire/munitions/stormtrooper"},
                {"Heavy Trooper", "faction/empire/loadout/heavytrooper", "faction/empire/munitions/heavytrooper"},
                {"Scout Trooper", "faction/empire/loadout/scouttrooper", "faction/empire/munitions/scouttrooper"},
                {"Shock Trooper", "faction/empire/loadout/shocktrooper", "faction/empire/munitions/shocktrooper"},
            }
        },

        {
            name = "Stormtrooper Corps",
            ranks = {"Private", "Lance Corporal", "Corporal", "Sergeant", "Master Sergeant", "Lieutenant"},

            uniform = "faction/empire/uniform/generic",

            roles = {
                -- role, loadout, munitions
                {"Infantry", "faction/empire/loadout/grunt_army", "faction/empire/munitions/grunt_army"},
                {"Engineer", "faction/empire/loadout/driver", "faction/empire/munitions/driver"},
            }
        },
        
        {
            name = "Navy",
            ranks = {"Ensign", "Junior Lieutenant", "Senior Lieutenant", "Captain", "Senior Captain", "Commander"},

            uniform = "faction/empire/uniform/generic",

            roles = {
                -- role, loadout, munitions
                {"Bridge Crew", "faction/empire/loadout/officer", "faction/empire/munitions/officer"},
                {"Technician", "faction/empire/loadout/officer", "faction/empire/munitions/officer"},
                {"Naval Infantry", "faction/empire/loadout/grunt_navy", "faction/empire/munitions/grunt_navy"},
                {"Pilot", "faction/empire/loadout/pilot", "faction/empire/munitions/officer"},
            }
        },
    },
}