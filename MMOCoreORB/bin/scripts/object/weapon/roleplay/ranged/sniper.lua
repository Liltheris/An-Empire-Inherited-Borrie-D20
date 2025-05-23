-------------------------------------------
-- Global Weapon Type Setting
-------------------------------------------
_attackType = RANGEDATTACK

_damageType = ENERGY

_armorPiercing = NONE

_pointBlankRange = 100	--Start of ideal range
_idealRange = 256		--End of ideal range
_maxRange = 260			--Total max range

_pointBlankAccuracy = 5	--DC under point blank range
_idealAccuracy = 10		--DC within ideal range
_maxRangeAccuracy = 99	--DC before max range

_ammoPack = "ammo_powerpack_large"
_maxAmmo = 5

--Unused junk data
_xpType = "combat_general"
_certificationsRequired = {}
_creatureAccuracyModifiers = {}
_creatureAimModifiers = {}
_defenderDefenseModifiers = {}
_defenderSecondaryDefenseModifiers = {}
_speedModifiers = {}
_damageModifiers = {}
_healthAttackCost = 0
_actionAttackCost = 0
_mindAttackCost = 0
_forceCost = 0
_attackSpeed = 1
_woundsRatio = 1
_numberExperimentalProperties = { 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2}
_experimentalProperties = { "XX", "XX", "CD", "OQ", "CD", "OQ", "CD", "OQ", "CD", "OQ", "CD", "OQ", "CD", "OQ", "XX", "XX", "XX", "CD", "OQ", "CD", "OQ", "CD", "OQ", "CD", "OQ"}
_experimentalWeights = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
_experimentalGroupTitles = { "null", "null", "expDamage", "expDamage", "expDamage", "expDamage", "expEffeciency", "exp_durability", "null", "null", "null", "expRange", "expEffeciency", "expEffeciency", "expEffeciency"}
_experimentalSubGroupTitles = { "null", "null", "mindamage", "maxdamage", "attackspeed", "woundchance", "roundsused", "hitpoints", "zerorangemod", "maxrangemod", "midrange", "midrangemod", "attackhealthcost", "attackactioncost", "attackmindcost"}
_experimentalMin = { 0, 0, 28, 67, 4.3, 7, 15, 750, -40, -80, 30, -5, 33, 42, 20}
_experimentalMax = { 0, 0, 52, 124, 3, 13, 45, 1500, -40, -80, 30, 5, 18, 22, 11}
_experimentalPrecision = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
_experimentalCombineType = { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}

-------------------------------------------
-- Weapon Definitions
-------------------------------------------

--C-M Sniper Rifle
object_weapon_roleplay_ranged_rifle_cm_sniper_rifle = object_weapon_ranged_rifle_shared_rifle_rebel:new {

	--[Info]
	customName = "C-M Sniper Rifle",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 4,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	rarity="Rare",

	ammoPack = _ammoPack,
	maxAmmo = _maxAmmo,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 1800,
}

--DLT-20A Sniper Rifle
object_weapon_roleplay_ranged_rifle_dlt20a_heavy_blaster_rifle = object_weapon_ranged_rifle_shared_rifle_dlt20a:new {

	--[Info]
	customName = "DLT-20A Sniper Rifle",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 2,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	rarity="Common",

	ammoPack = _ammoPack,
	maxAmmo = _maxAmmo,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 1800,
}

--LD-1 Target Blaster Rifle
object_weapon_roleplay_ranged_rifle_ld1_target_blaster_rifle = object_weapon_ranged_rifle_shared_rifle_ld1:new {

	--[Info]
	customName = "LD-1 Target Blaster Rifle",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 8,
	
	noDodgeReaction = true,	
	primaryAttributeOnly = true,

	rarity="Legendary",

	ammoPack = _ammoPack,
	maxAmmo = _maxAmmo,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 2000,
}

--Tusken Elite Rifle"
object_weapon_roleplay_ranged_rifle_tusken_elite_rifle = object_weapon_ranged_rifle_shared_rifle_tusken_elite:new {

	--[Info]
	customName = "Tusken Elite Rifle",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 6,
	
	noPowerAttack = true,
	primaryAttributeOnly = true,

	rarity="Common",

	ammoPack = "ammo_kinetic",
	maxAmmo = 1,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 1000,
}

--Czerka Adventurer
object_weapon_roleplay_ranged_rifle_czerka_adventurer = object_weapon_ranged_rifle_shared_rifle_adventurer:new {

	--[Info]
	customName = "Czerka Adventurer",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 2, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 4,
	
	primaryAttributeOnly = true,

	rarity="Common",

	ammoPack = "ammo_kinetic",
	maxAmmo = _maxAmmo,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 1000,
	
}

--Valken 38X Sniper Rifle
object_weapon_roleplay_ranged_rifle_valken38x_sniper_rifle = object_weapon_ranged_rifle_shared_rifle_valken38x:new {

	--[Info]
	customName = "Valken 38X Sniper Rifle",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 4,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	rarity="Epic",

	ammoPack = _ammoPack,
	maxAmmo = _maxAmmo,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 1800,
}








-------------------------------------------
-- Templates
-------------------------------------------
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_rifle_cm_sniper_rifle, "object/weapon/roleplay/ranged/rifle/cm_sniper_rifle.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_rifle_dlt20a_heavy_blaster_rifle, "object/weapon/roleplay/ranged/rifle/dlt20a_heavy_blaster_rifle.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_rifle_ld1_target_blaster_rifle, "object/weapon/roleplay/ranged/rifle/ld1_target_blaster_rifle.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_rifle_tusken_elite_rifle, "object/weapon/roleplay/ranged/rifle/tusken_elite_rifle.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_rifle_czerka_adventurer, "object/weapon/roleplay/ranged/rifle/czerka_adventurer.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_rifle_valken38x_sniper_rifle, "object/weapon/roleplay/ranged/rifle/valken38x_sniper_rifle.iff")















