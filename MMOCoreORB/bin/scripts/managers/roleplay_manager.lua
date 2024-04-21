-------------------------
-- Combat
-------------------------
combatBaseDC = 10

aimedDcMods = {
    2,  --chest
    2,  --chest
    5,  --legs
    5,  --feet
    5,  --left bracer
    5,  --right bracer
    5,  --left bicep
    5,  --right bicep
    10, --hands
    10  --head
}

powerAttackDcMod = 5

-------------------------
-- Skills
-------------------------
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
    {"athletics",       "constitution", ""},
    {"bluff",           "charisma",     ""},
    {"command",         "charisma",     ""},
    {"composure",       "mindfulness",  ""},
    {"computers",       "intelligence", ""},
    {"defending",       "strength",     ""},
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
    {"stealth",         "awareness",    ""},
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

-- The number of force skill boxes that need to be learned to level up the Force immersion.
forceTiers = {5, 15, 40, 70}

-------------------------
-- Other settings
-------------------------

stringExcludedNames = {"the", "a", "an", "lord", "darth", "master"}