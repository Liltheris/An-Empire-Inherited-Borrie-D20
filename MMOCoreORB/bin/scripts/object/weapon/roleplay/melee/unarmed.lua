-------------------------------------------
-- Global Weapon Type Setting
-------------------------------------------
_attackType = MELEEATTACK

_damageType = KINETIC

_armorPiercing = NONE

_pointBlankRange = 0	--Start of ideal range
_idealRange = 2			--End of ideal range
_maxRange = 3			--Total max range

_pointBlankAccuracy = 5	--DC under point blank range
_idealAccuracy = 10		--DC within ideal range
_maxRangeAccuracy = 99	--DC before max range

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

object_weapon_roleplay_melee_unarmed_black_sun_razor = object_weapon_melee_special_shared_blacksun_razor:new {

	--[Info]
	customName = "Black Sun Razor",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 3,
	
	rarity="Epic",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 60,
}

object_weapon_roleplay_melee_unarmed_blaster_fist = object_weapon_melee_special_shared_blasterfist:new {

	--[Info]
	customName = "Blaster Fist",

	--[Stats]
	damageType = BLAST,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 3,
	
	rarity="Rare",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 60,
}

object_weapon_roleplay_melee_unarmed_ceremonial_knuckler = object_weapon_melee_special_shared_pvp_bf_knuckler:new {

	--[Info]
	customName = "Ceremonial Knuckler",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 2,
	
	rarity="Uncommon",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 80,
}

object_weapon_roleplay_melee_unarmed_massassi_knuckler = object_weapon_melee_special_shared_massassiknuckler:new {

	--[Info]
	customName = "Massassi Knuckler",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 3,
	
	rarity="Legendary",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 75,
}

object_weapon_roleplay_melee_unarmed_metal_fan = object_weapon_melee_special_shared_fan_metal:new {

	--[Info]
	customName = "Metal Fan",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 2,
	
	rarity="Common",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 70,
}

object_weapon_roleplay_melee_unarmed_punch_dagger = object_weapon_melee_special_shared_punch_dagger:new {

	--[Info]
	customName = "Punch Dagger",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 1,
	
	rarity="Common",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 65,
}

object_weapon_roleplay_melee_unarmed_vibroknuckler = object_weapon_melee_special_shared_vibroknuckler:new {

	--[Info]
	customName = "Vibroknuckler",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 1,
	
	rarity="Common",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 50,
}

object_weapon_roleplay_melee_unarmed_wookiee_knuckler = object_weapon_melee_special_shared_vibroknuckler:new {

	--[Info]
	customName = "Wookiee Knuckler",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
	rarity="Uncommon",

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 50,
}

ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_black_sun_razor, "object/weapon/roleplay/melee/unarmed/black_sun_razor.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_blaster_fist, "object/weapon/roleplay/melee/unarmed/blaster_fist.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_ceremonial_knuckler, "object/weapon/roleplay/melee/unarmed/ceremonial_knuckler.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_massassi_knuckler, "object/weapon/roleplay/melee/unarmed/massassi_knuckler.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_metal_fan, "object/weapon/roleplay/melee/unarmed/metal_fan.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_punch_dagger, "object/weapon/roleplay/melee/unarmed/punch_dagger.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_vibroknuckler, "object/weapon/roleplay/melee/unarmed/vibroknuckler.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_unarmed_wookiee_knuckler, "object/weapon/roleplay/melee/unarmed/wookiee_knuckler.iff")
