-------------------------------------------
-- Global Weapon Type Setting
-------------------------------------------
_attackType = RANGEDATTACK

_damageType = ENERGY

_armorPiercing = NONE

_pointBlankRange = 4	--Start of ideal range
_idealRange = 32		--End of ideal range
_maxRange = 86			--Total max range

_pointBlankAccuracy = 5	--DC under point blank range
_idealAccuracy = 10		--DC within ideal range
_maxRangeAccuracy = 99	--DC before max range

_ammoPack = "ammo_powerpack_small"
_maxAmmo = 10

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

--Alliance Disruptor
object_weapon_roleplay_ranged_pistol_alliance_disruptor = object_weapon_ranged_pistol_shared_pistol_alliance_disruptor:new {

	--[Info]
	customName = "Alliance Disruptor",

	--[Stats]
	damageType = LIGHTSABER,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 5,
	
	noPowerAttack = true,
	
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
	price = 10000,
}

--Anti-Riot Tangle Gun 7
object_weapon_roleplay_ranged_pistol_antiriot_tangle_gun_7 = object_weapon_ranged_pistol_shared_pistol_tangle:new {

	--[Info]
	customName = "Anti-Riot Tangle Gun 7",

	--[Stats]
	damageType = STUN,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 1,
	
	rarity="Uncommon",

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
	price = 120,
}

--C-M Dead Bolt Pistol
object_weapon_roleplay_ranged_pistol_cm_dead_bolt_pistol = object_weapon_ranged_pistol_shared_pistol_rebel:new {

	--[Info]
	customName = "C-M Dead Bolt Pistol",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 1,
	
	noPowerAttack = true,
	
	rarity="Rare",

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
	price = 400,
}

--Crimson Nova Pistol
object_weapon_roleplay_ranged_pistol_crimson_nova_pistol = object_weapon_ranged_pistol_shared_pistol_pvp:new {

	--[Info]
	customName = "Crimson Nova Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 5,
	
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
	price = 500,
}

--Crusader M-XII Pistol
object_weapon_roleplay_ranged_pistol_crusader_mxii_pistol = object_weapon_ranged_pistol_shared_pistol_mandalorian:new {

	--[Info]
	customName = "Crusader M-XII Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 5,

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
	price = 500,
}

--D-18 Pistol
object_weapon_roleplay_ranged_pistol_d18_pistol = object_weapon_ranged_pistol_shared_pistol_d18:new {

	--[Info]
	customName = "D-18 Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 0,
	
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
	price = 200,
}

--DD6 Pistol
object_weapon_roleplay_ranged_pistol_dd6_pistol = object_weapon_ranged_pistol_shared_pistol_dd6:new {

	--[Info]
	customName = "DD6 Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
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
	price = 400,
}

--DE-10 Blaster Pistol
object_weapon_roleplay_ranged_pistol_de10_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_de_10_generic:new {

	--[Info]
	customName = "DE-10 Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 4,
	
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
	price = 1200,
}

--DH-18A Blaster Pistol
object_weapon_roleplay_ranged_pistol_dh18a_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_dh18a_gcw:new {

	--[Info]
	customName = "DH-18A Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 2,
	
	rarity = "Rare",

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
	price = 500,
}

--Disruptor Pistol
object_weapon_roleplay_ranged_pistol_disruptor_pistol = object_weapon_ranged_pistol_shared_som_disruptor_pistol:new {

	--[Info]
	customName = "Disruptor Pistol",

	--[Stats]
	damageType = LIGHTSABER,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 4,
	
	noPowerAttack = true,
	
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
	price = 50000,
}

--DL-18 Pistol
object_weapon_roleplay_ranged_pistol_dl18_pistol = object_weapon_ranged_pistol_shared_pistol_d18_npe:new {

	--[Info]
	customName = "DL-18 Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 0,
	
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
	price = 200,
}

--DL-44 Blaster Pistol
object_weapon_roleplay_ranged_pistol_dl44_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_dl44:new {

	--[Info]
	customName = "DL-44 Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
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
	price = 400,
}

--DL-44 Metal Blaster Pistol
object_weapon_roleplay_ranged_pistol_dl44_metal_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_dl44_metal:new {

	--[Info]
	customName = "DL-44 Metal Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 2,
	
	rarity="Uncommon",

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
	price = 400,
}

--DX-2 Disruptor Pistol
object_weapon_roleplay_ranged_pistol_dx2_disruptor_pistol = object_weapon_ranged_pistol_shared_pistol_dx2:new {

	--[Info]
	customName = "DX-2 Disruptor Pistol",

	--[Stats]
	damageType = LIGHTSABER,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 6,
	
	noPowerAttack = true,
	
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
	price = 500000,
}

--Flare Gun
object_weapon_roleplay_ranged_pistol_flare_gun = object_weapon_ranged_pistol_shared_pistol_flare:new {

	--[Info]
	customName = "Flare Gun",

	--[Stats]
	damageType = HEAT,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 0,
	
	rarity="Uncommon",

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
	price = 100,
}

--Flechette Pistol
object_weapon_roleplay_ranged_pistol_flechette_pistol = object_weapon_ranged_pistol_shared_pistol_flechette:new {

	--[Info]
	customName = "Flechette Pistol",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
	noPowerAttack = true,
	
	rarity="Rare",

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
	price = 400,
}

--FWG-5 Flechette Smart Pistol
object_weapon_roleplay_ranged_pistol_fwg5_flechette_smart_pistol = object_weapon_ranged_pistol_shared_pistol_fwg5:new {

	--[Info]
	customName = "FWG-5 Flechette Smart Pistol",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 2,
	
	noPowerAttack = true,
	
	rarity = "Epic",

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
	price = 500,
}

--Ion Pistol
object_weapon_roleplay_ranged_pistol_ion_pistol = object_weapon_ranged_pistol_shared_pistol_jawa:new {

	--[Info]
	customName = "Ion Pistol",

	--[Stats]
	damageType = ELECTRICITY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 1,
	
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
	price = 240,
}

--Ion Relic Pistol
object_weapon_roleplay_ranged_pistol_ion_relic_pistol = object_weapon_ranged_pistol_shared_som_ion_relic_pistol:new {

	--[Info]
	customName = "Ion Relic Pistol",

	--[Stats]
	damageType = ELECTRICITY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 3,
	
	noPowerAttack = true,
	
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
	price = 450,
}

--Ion Stunner Pistol
object_weapon_roleplay_ranged_pistol_ion_stunner_pistol = object_weapon_ranged_pistol_ep3_shared_pistol_ion_stunner:new {

	--[Info]
	customName = "Ion Stunner Pistol",

	--[Stats]
	damageType = ELECTRICITY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 1,
	
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
	price = 100,
}

--IR-5 Intimidator Pistol
object_weapon_roleplay_ranged_pistol_ir5_intimidator_pistol = object_weapon_ranged_pistol_shared_pistol_intimidator:new {

	--[Info]
	customName = "IR-5 Intimidator Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
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
	price = 400,
}

--KYD-21 Blaster Pistol
object_weapon_roleplay_ranged_pistol_kyd21_blaster_pistol = object_weapon_ranged_pistol_ep3_shared_pistol_kyd21:new {

	--[Info]
	customName = "KYD-21 Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 2,
	
	rarity="Uncommon",

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
	price = 260,
}

--Model 434 Heavy Blaster Pistol
object_weapon_roleplay_ranged_pistol_model_434_heavy_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_deathhammer:new {

	--[Info]
	customName = "Model 434 Heavy Blaster Pistol",

	--[Stats]
	damageType = HEAT,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 1,
	
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
	price = 220,
}

--Model Q2 Hold-out Blaster Pistol
object_weapon_roleplay_ranged_pistol_model_q2_holdout_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_republic_blaster:new {

	--[Info]
	customName = "Model Q2 Hold-out Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 2,
	
	rarity = "Uncommon",

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
	price = 180,
}


object_weapon_roleplay_ranged_pistol_power_5_heavy_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_power5:new {

	--[Info]
	customName = "Power 5 Heavy Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 1,
	
	rarity="Uncommon",

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
	price = 300,
}

--Renegade Heavy Blaster Pistol
object_weapon_roleplay_ranged_pistol_renegade_heavy_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_renegade:new {

	--[Info]
	customName = "Renegade Heavy Blaster Pistol",

	--[Stats]
	damageType = BLAST,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 3,
	
	noPowerAttack = true,
	
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
	price = 450,
}

--Scout Blaster Pistol
object_weapon_roleplay_ranged_pistol_scout_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_scout_blaster_static:new {

	--[Info]
	customName = "Scout Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 1,
	
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
	price = 100,
}

--SE-14 Blaster Pistol
object_weapon_roleplay_ranged_pistol_se14_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_srcombat:new {

	--[Info]
	customName = "SE-14 Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 0,
	
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
	price = 200,
}

--Striker Projectile Pistol
object_weapon_roleplay_ranged_pistol_striker_projectile_pistol = object_weapon_ranged_pistol_shared_pistol_striker:new {

	--[Info]
	customName = "Striker Projectile Pistol",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 1,
	
	noPowerAttack = true,
	
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
	price = 220,
}

--Trandoshan Suppressor Pistol
object_weapon_roleplay_ranged_pistol_trandoshan_suppressor_pistol = object_weapon_ranged_pistol_ep3_shared_pistol_trando_suppressor:new {

	--[Info]
	customName = "Trandoshan Suppressor Pistol",

	--[Stats]
	damageType = STUN,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 1,
	
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
	price = 450,
}

--WESTAR-34 Blaster Pistol
object_weapon_roleplay_ranged_pistol_westar34_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_westar_34:new {

	--[Info]
	customName = "WESTAR-34 Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 4,
	
	rarity = "Legendary",

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
	price = 1000,
}

--Wookiee Pistol
object_weapon_roleplay_ranged_pistol_wookiee_pistol = object_weapon_ranged_pistol_ep3_shared_pistol_wookiee:new {

	--[Info]
	customName = "Wookiee Pistol",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 3,
	
	noPowerAttack = true,
	
	rarity="Uncommon",

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
	price = 450,
}

--WESTAR-35 Blaster Pistol
object_weapon_roleplay_ranged_pistol_westar35_blaster_pistol = object_weapon_ranged_pistol_shared_pistol_westar35:new {

	--[Info]
	customName = "WESTAR-35 Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 2,
	
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
	price = 1400,
}

--CDEF Pistol
object_weapon_roleplay_ranged_pistol_cdef_pistol = object_weapon_ranged_pistol_shared_pistol_cdef:new {

	--[Info]
	customName = "CDEF Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 0,
	
	noPowerAttack = true,
	
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
	price = 200,
}
--Bryar Pistol
object_weapon_roleplay_ranged_pistol_bryar_pistol = object_weapon_ranged_pistol_shared_pistol_bryar:new {

	--[Info]
	customName = "Bryar Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
	noPowerAttack = false,
	
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
	price = 400,
}

--Blurrg Pistol
object_weapon_roleplay_ranged_pistol_blurrg_pistol = object_weapon_ranged_pistol_shared_pistol_blurrg:new {

	--[Info]
	customName = "Blurrg Holdout Blaster",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 2,
	
	noPowerAttack = false,
	
	rarity="Rare",

	ammoPack = _ammoPack,
	maxAmmo = 5,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 350,
}

--Blurrg Pistol
object_weapon_roleplay_ranged_pistol_rk3_pistol = object_weapon_ranged_pistol_shared_pistol_rk3:new {

	--[Info]
	customName = "RK-3 Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
	noPowerAttack = false,
	
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
	price = 350,
}

--DC-17 Pistol
object_weapon_roleplay_ranged_pistol_dc17_pistol = object_weapon_ranged_pistol_shared_pistol_dc17:new {

	--[Info]
	customName = "DC-17 Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,
	
	noPowerAttack = false,
	
	rarity = "Uncommon",

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
	price = 350,
}

--S-5 Heavy Blaster Pistol
object_weapon_roleplay_ranged_pistol_s5_pistol = object_weapon_ranged_pistol_shared_pistol_s5_combined:new {

	--[Info]
	customName = "S-5 Heavy Blaster Pistol",

	--[Stats]
	damageType = ENERGY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 3,
	
	noPowerAttack = false,
	
	rarity = "Uncommon",

	ammoPack = _ammoPack,
	maxAmmo = 6,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 600,
}

-------------------------------------------
-- Templates
-------------------------------------------
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_alliance_disruptor, "object/weapon/roleplay/ranged/pistol/alliance_disruptor.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_antiriot_tangle_gun_7, "object/weapon/roleplay/ranged/pistol/antiriot_tangle_gun_7.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_cm_dead_bolt_pistol, "object/weapon/roleplay/ranged/pistol/cm_dead_bolt_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_crimson_nova_pistol, "object/weapon/roleplay/ranged/pistol/crimson_nova_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_crusader_mxii_pistol, "object/weapon/roleplay/ranged/pistol/crusader_mxii_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_d18_pistol, "object/weapon/roleplay/ranged/pistol/d18_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_dd6_pistol, "object/weapon/roleplay/ranged/pistol/dd6_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_de10_blaster_pistol, "object/weapon/roleplay/ranged/pistol/de10_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_dh18a_blaster_pistol, "object/weapon/roleplay/ranged/pistol/dh18a_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_disruptor_pistol, "object/weapon/roleplay/ranged/pistol/disruptor_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_dl18_pistol, "object/weapon/roleplay/ranged/pistol/dl18_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_dl44_blaster_pistol, "object/weapon/roleplay/ranged/pistol/dl44_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_dl44_metal_blaster_pistol, "object/weapon/roleplay/ranged/pistol/dl44_metal_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_dx2_disruptor_pistol, "object/weapon/roleplay/ranged/pistol/dx2_disruptor_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_flare_gun, "object/weapon/roleplay/ranged/pistol/flare_gun.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_flechette_pistol, "object/weapon/roleplay/ranged/pistol/flechette_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_fwg5_flechette_smart_pistol, "object/weapon/roleplay/ranged/pistol/fwg5_flechette_smart_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_ion_pistol, "object/weapon/roleplay/ranged/pistol/ion_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_ion_relic_pistol, "object/weapon/roleplay/ranged/pistol/ion_relic_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_ion_stunner_pistol, "object/weapon/roleplay/ranged/pistol/ion_stunner_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_ir5_intimidator_pistol, "object/weapon/roleplay/ranged/pistol/ir5_intimidator_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_kyd21_blaster_pistol, "object/weapon/roleplay/ranged/pistol/kyd21_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_model_434_heavy_blaster_pistol, "object/weapon/roleplay/ranged/pistol/model_434_heavy_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_model_q2_holdout_blaster_pistol, "object/weapon/roleplay/ranged/pistol/model_q2_holdout_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_power_5_heavy_blaster_pistol, "object/weapon/roleplay/ranged/pistol/power_5_heavy_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_renegade_heavy_blaster_pistol, "object/weapon/roleplay/ranged/pistol/renegade_heavy_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_scout_blaster_pistol, "object/weapon/roleplay/ranged/pistol/scout_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_se14_blaster_pistol, "object/weapon/roleplay/ranged/pistol/se14_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_striker_projectile_pistol, "object/weapon/roleplay/ranged/pistol/striker_projectile_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_trandoshan_suppressor_pistol, "object/weapon/roleplay/ranged/pistol/trandoshan_suppressor_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_westar34_blaster_pistol, "object/weapon/roleplay/ranged/pistol/westar34_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_wookiee_pistol, "object/weapon/roleplay/ranged/pistol/wookiee_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_westar35_blaster_pistol, "object/weapon/roleplay/ranged/pistol/westar35_blaster_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_cdef_pistol, "object/weapon/roleplay/ranged/pistol/cdef_pistol.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_bryar_pistol, "object/weapon/roleplay/ranged/pistol/pistol_bryar.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_blurrg_pistol, "object/weapon/roleplay/ranged/pistol/pistol_blurrg.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_rk3_pistol, "object/weapon/roleplay/ranged/pistol/pistol_rk3.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_dc17_pistol, "object/weapon/roleplay/ranged/pistol/pistol_dc17.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_ranged_pistol_s5_pistol, "object/weapon/roleplay/ranged/pistol/pistol_s5.iff")

