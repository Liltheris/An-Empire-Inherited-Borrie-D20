-------------------------------------------
-- Global Weapon Type Setting
-------------------------------------------
_attackType = MELEEATTACK

_damageType = ENERGY

_armorPiercing = NONE

_pointBlankRange = 0	--Start of ideal range
_idealRange = 1			--End of ideal range
_maxRange = 2			--Total max range

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

object_weapon_roleplay_melee_twohanded_axe = object_weapon_melee_axe_shared_axe_heavy_duty:new {

	--[Info]
	customName = "Axe",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 7, --Type of Die used in Damage
	bonusDamage = 1,

	primaryAttributeOnly = true,

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

object_weapon_roleplay_melee_twohanded_ceremonial_scythe = object_weapon_melee_2h_sword_shared_2h_sword_wod_scyth:new {

	--[Info]
	customName = "Ceremonial Scythe",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 3,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 130,
}

object_weapon_roleplay_melee_twohanded_cleaver = object_weapon_melee_2h_sword_shared_2h_sword_cleaver:new {

	--[Info]
	customName = "Cleaver",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 2,
	
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 110,
}

object_weapon_roleplay_melee_twohanded_executioners_axe = object_weapon_melee_2h_sword_shared_2h_sword_blacksun_hack:new {

	--[Info]
	customName = "Executioners Axe",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 4,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 160,
}

object_weapon_roleplay_melee_twohanded_fierce_cleaver = object_weapon_melee_2h_sword_shared_2h_sword_pvp_bf_01:new {

	--[Info]
	customName = "Fierce Cleaver",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 2,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 140,
}

object_weapon_roleplay_melee_twohanded_gamorean_axe = object_weapon_melee_2h_sword_shared_2h_sword_battleaxe:new {

	--[Info]
	customName = "Gamorean Axe",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 9, --Type of Die used in Damage
	bonusDamage = 1,

	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 100,
}

object_weapon_roleplay_melee_twohanded_katana = object_weapon_melee_2h_sword_shared_2h_sword_katana:new {

	--[Info]
	customName = "Katana",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 2,

	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 120,
}

object_weapon_roleplay_melee_twohanded_massassi_great_sword = object_weapon_melee_2h_sword_shared_2h_sword_kun_massassi:new {

	--[Info]
	customName = "Massassi Great Sword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 6,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 180,
}

object_weapon_roleplay_melee_twohanded_obsidian_great_sword = object_weapon_melee_2h_sword_shared_som_2h_sword_obsidian:new {

	--[Info]
	customName = "Obsidian Great Sword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 2,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 150,
}

object_weapon_roleplay_melee_twohanded_power_hammer = object_weapon_melee_2h_sword_shared_2h_sword_maul:new {

	--[Info]
	customName = "Power Hammer",

	--[Stats]
	damageType = BLAST,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 8,
	
	noPowerAttack = true,
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 180,
}

object_weapon_roleplay_melee_twohanded_scythe_blade = object_weapon_melee_2h_sword_shared_2h_sword_scythe:new {

	--[Info]
	customName = "Scythe Blade",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 4,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 160,
}

object_weapon_roleplay_melee_twohanded_sith_great_sword = object_weapon_melee_2h_sword_shared_2h_sword_sith:new {

	--[Info]
	customName = "Sith Great Sword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 12, --Type of Die used in Damage
	bonusDamage = 2,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 150,
}

object_weapon_roleplay_melee_twohanded_tulrus_sword = object_weapon_melee_2h_sword_shared_som_2h_sword_tulrus:new {

	--[Info]
	customName = "Tulrus Sword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 11, --Type of Die used in Damage
	bonusDamage = 1,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 130,
}

object_weapon_roleplay_melee_twohanded_vibroaxe = object_weapon_melee_axe_shared_axe_vibroaxe:new {

	--[Info]
	customName = "Vibroaxe",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 9, --Type of Die used in Damage
	bonusDamage = 1,
	
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 100,
}

object_weapon_roleplay_melee_twohanded_wookiee_broadsword = object_weapon_melee_2h_sword_shared_2h_sword_kashyyk:new {

	--[Info]
	customName = "Wookiee Broadsword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 2,
	
	noDodgeReaction = true,
	primaryAttributeOnly = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 140,
}

ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_axe, "object/weapon/roleplay/melee/twohanded/axe.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_ceremonial_scythe, "object/weapon/roleplay/melee/twohanded/ceremonial_scythe.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_cleaver, "object/weapon/roleplay/melee/twohanded/cleaver.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_executioners_axe, "object/weapon/roleplay/melee/twohanded/executioners_axe.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_fierce_cleaver, "object/weapon/roleplay/melee/twohanded/fierce_cleaver.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_gamorean_axe, "object/weapon/roleplay/melee/twohanded/gamorean_axe.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_katana, "object/weapon/roleplay/melee/twohanded/katana.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_massassi_great_sword, "object/weapon/roleplay/melee/twohanded/massassi_great_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_obsidian_great_sword, "object/weapon/roleplay/melee/twohanded/obsidian_great_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_power_hammer, "object/weapon/roleplay/melee/twohanded/power_hammer.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_scythe_blade, "object/weapon/roleplay/melee/twohanded/scythe_blade.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_sith_great_sword, "object/weapon/roleplay/melee/twohanded/sith_great_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_tulrus_sword, "object/weapon/roleplay/melee/twohanded/tulrus_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_vibroaxe, "object/weapon/roleplay/melee/twohanded/vibroaxe.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_twohanded_wookiee_broadsword, "object/weapon/roleplay/melee/twohanded/wookiee_broadsword.iff")
