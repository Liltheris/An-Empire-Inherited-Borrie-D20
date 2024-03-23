--The maximum amount of attribute levels a player can have over 1.
maxAttributes = 40

maxTraining = 2

maxFeats = 5

--Multiplier added on top of each skill's XP cost for being over the attribute cap.
skillCostMultiplier = 1.5

skillLevels = {
    [1]  = "novice",
    [2]  = "a01",
    [3]  = "a02",
    [4]  = "a03",
    [5]  = "a04",
    [6]  = "b01",
    [7]  = "b02",
    [8]  = "b03",
    [9]  = "b04",
    [10] = "master",
}

attributes = {
    --name, parent, altParent
    {"awareness",       "", ""},
	{"charisma",        "", ""},
	{"constitution",    "", ""},
	{"dexterity",       "", ""},
	{"intelligence",    "", ""},
	{"mindfulness",     "", ""},
	{"precision",       "", ""},
	{"strength",        "", ""},
}

skills = {
    {"armor",           "constitution", ""},
    {"athletics",       "dexterity",    ""},
    {"bluff",           "charisma",     ""},
    {"command",         "charisma",     ""},
    {"composure",       "mindfulness",  ""},
    {"computers",       "intelligence", ""},
    {"defending",       "dexterity",    ""},
    {"demolitions",     "precision",    ""},
    {"engineering",     "intelligence", ""},
    {"intimidation",    "charisma",     ""},
    {"investigation",   "awareness",    ""},
    {"larceny",         "dexterity",    ""},
    {"maneuverability", "dexterity",    ""},
    {"mechanics",       "precision",    ""},
    {"medicine",        "intelligence", ""},
    {"melee",           "dexterity",    ""},
    {"performance",     "charisma",     ""},
    {"persuasion",      "charisma",     ""},
    {"piloting",        "awareness",    ""},
    {"ranged",          "precision",    ""},
    {"resolve",         "mindfulness",  ""},
    {"science",         "intelligence", ""},
    {"slicing",         "intelligence", ""},
    {"stealth",         "dexterity",    ""},
    {"survival",        "awareness",    ""},
    {"throwing",        "precision",    ""},
    {"unarmed",         "dexterity",    ""},    
}

forceSkills = {
    {"alter",       "", ""},
    {"control",     "", ""},
    {"inward",      "", ""},
    {"lightning",   "", ""},
    {"lightsaber",  "", ""},
    {"sense",       "", ""},
    {"telekinesis", "", ""},    
}