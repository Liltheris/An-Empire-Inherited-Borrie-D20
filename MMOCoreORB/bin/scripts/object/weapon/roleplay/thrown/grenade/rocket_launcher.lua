object_weapon_roleplay_thrown_heavy_rocket_launcher = object_weapon_ranged_heavy_shared_heavy_rocket_launcher:new {

	--[Info]
	customName = "Rocket Launcher",

	--[Stats]
	attackType = HEAVYROCKETLAUNCHERATTACKK,

	damageType = BLAST,

	armorPiercing = HEAVY,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 4, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 0,

	pointBlankRange = 40,
	pointBlankAccuracy = 5,
	price = 100,
	idealRange = 80,
	idealAccuracy = 10,

	maxRange = 120,
	maxRangeAccuracy = 99,
	
	area = 10,
	
	dodgeDC = 20,
	
	rpSkillLevel = 5,
	
	rarity="Uncommon",
	
	animationType = "rocket_launcher",
}

ObjectTemplates:addTemplate(object_weapon_roleplay_thrown_heavy_rocket_launcher, "object/weapon/roleplay/thrown/heavy/rocket_launcher.iff")