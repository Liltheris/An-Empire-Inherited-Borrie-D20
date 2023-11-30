-------------------------------------------
-- Global Weapon Type Setting
-------------------------------------------
_attackType = MELEEATTACK

_damageType = ENERGY

_armorPiercing = NONE

_pointBlankRange = 1	--Start of ideal range
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

object_weapon_roleplay_melee_polearm_electric_polearm = object_weapon_melee_polearm_shared_lance_electric_polearm:new {

	--[Info]
	customName = "Electric Polearm",

	--[Stats]
	damageType = ELECTRICITY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 9, --Type of Die used in Damage
	bonusDamage = 1,

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

object_weapon_roleplay_melee_polearm_force_pike = object_weapon_melee_polearm_shared_lance_controllerfp:new {

	--[Info]
	customName = "Force Pike",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 4,

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

object_weapon_roleplay_melee_polearm_gand_shockprod_staff = object_weapon_melee_polearm_shared_lance_gcw_gand_shockprod:new {

	--[Info]
	customName = "Gand Shockprod Staff",

	--[Stats]
	damageType = ELECTRICITY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 2,

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

object_weapon_roleplay_melee_polearm_heavy_vibrolance = object_weapon_melee_polearm_shared_polearm_heroic_sd:new {

	--[Info]
	customName = "Heavy Vibrolance",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 3,

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

object_weapon_roleplay_melee_polearm_kaminoan_lance = object_weapon_melee_polearm_shared_lance_kaminoan:new {

	--[Info]
	customName = "Kaminoan Lance",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 9, --Type of Die used in Damage
	bonusDamage = 1,

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

object_weapon_roleplay_melee_polearm_kashyyyk_lance = object_weapon_melee_polearm_shared_lance_kashyyk:new {

	--[Info]
	customName = "Kashyyyk Lance",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 3,

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

object_weapon_roleplay_melee_polearm_metal_staff = object_weapon_melee_polearm_shared_lance_staff_metal:new {

	--[Info]
	customName = "Metal Staff",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 1,

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

object_weapon_roleplay_melee_polearm_nightsister_lance = object_weapon_melee_polearm_shared_lance_nightsister:new {

	--[Info]
	customName = "Nightsister Lance",

	--[Stats]
	damageType = ELECTRICITY,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 2,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 90,
}

object_weapon_roleplay_melee_polearm_obsidian_lance = object_weapon_melee_polearm_shared_som_lance_obsidian:new {

	--[Info]
	customName = "Obsidian Lance",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 9, --Type of Die used in Damage
	bonusDamage = 1,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 90,
}

object_weapon_roleplay_melee_polearm_pestilence = object_weapon_melee_polearm_shared_ep3_loot_pestilence:new {

	--[Info]
	customName = "Pestilence",

	--[Stats]
	damageType = ACID,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 7, --Type of Die used in Damage
	bonusDamage = 3,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	price = 90,
}

object_weapon_roleplay_melee_polearm_phrik_electrostaff = object_weapon_melee_polearm_shared_lance_staff_magna_guard:new {

	--[Info]
	customName = "Phrik Electrostaff",

	--[Stats]
	damageType = STUN,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 7, --Type of Die used in Damage
	bonusDamage = 1,

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

object_weapon_roleplay_melee_polearm_poison_pike = object_weapon_melee_polearm_shared_ep3_loot_poisonspike:new {

	--[Info]
	customName = "Poison Pike",

	--[Stats]
	damageType = ACID,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 2,

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

object_weapon_roleplay_melee_polearm_reinforced_staff = object_weapon_melee_polearm_shared_lance_staff_wood_s2:new {

	--[Info]
	customName = "Reinforced Staff",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 1,

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

object_weapon_roleplay_melee_polearm_shock_lance = object_weapon_melee_polearm_shared_lance_shock:new {

	--[Info]
	customName = "Shock Lance",

	--[Stats]
	damageType = STUN,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 2,

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

object_weapon_roleplay_melee_polearm_strike_assault_lance = object_weapon_melee_polearm_shared_ep3_loot_strike:new {

	--[Info]
	customName = "Strike Assault Lance",

	--[Stats]
	attackType = MELEEATTACK,

	damageType = BLAST,

	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 2,

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

object_weapon_roleplay_melee_polearm_vibro_longaxe = object_weapon_melee_polearm_shared_polearm_vibro_axe:new {

	--[Info]
	customName = "Vibro Longaxe",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 1,

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

object_weapon_roleplay_melee_polearm_vibrolance = object_weapon_melee_polearm_shared_lance_vibrolance:new {

	--[Info]
	customName = "Vibrolance",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 2,

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

object_weapon_roleplay_melee_polearm_wood_staff = object_weapon_melee_polearm_shared_lance_staff_wood_s1:new {

	--[Info]
	customName = "Wood Staff",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 1,

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

object_weapon_roleplay_melee_polearm_xandank_lance = object_weapon_melee_polearm_shared_som_lance_xandank:new {

	--[Info]
	customName = "Xandank Lance",

	--[Stats]
	attackType = MELEEATTACK,

	damageType = KINETIC,

	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 8, --Type of Die used in Damage
	bonusDamage = 4,

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

ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_electric_polearm, "object/weapon/roleplay/melee/polearm/electric_polearm.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_force_pike, "object/weapon/roleplay/melee/polearm/force_pike.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_gand_shockprod_staff, "object/weapon/roleplay/melee/polearm/gand_shockprod_staff.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_heavy_vibrolance, "object/weapon/roleplay/melee/polearm/heavy_vibrolance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_kaminoan_lance, "object/weapon/roleplay/melee/polearm/kaminoan_lance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_kashyyyk_lance, "object/weapon/roleplay/melee/polearm/kashyyyk_lance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_metal_staff, "object/weapon/roleplay/melee/polearm/metal_staff.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_nightsister_lance, "object/weapon/roleplay/melee/polearm/nightsister_lance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_obsidian_lance, "object/weapon/roleplay/melee/polearm/obsidian_lance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_pestilence, "object/weapon/roleplay/melee/polearm/pestilence.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_phrik_electrostaff, "object/weapon/roleplay/melee/polearm/phrik_electrostaff.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_poison_pike, "object/weapon/roleplay/melee/polearm/poison_pike.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_reinforced_staff, "object/weapon/roleplay/melee/polearm/reinforced_staff.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_shock_lance, "object/weapon/roleplay/melee/polearm/shock_lance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_strike_assault_lance, "object/weapon/roleplay/melee/polearm/strike_assault_lance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_vibro_longaxe, "object/weapon/roleplay/melee/polearm/vibro_longaxe.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_vibrolance, "object/weapon/roleplay/melee/polearm/vibrolance.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_wood_staff, "object/weapon/roleplay/melee/polearm/wood_staff.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_polearm_xandank_lance, "object/weapon/roleplay/melee/polearm/xandank_lance.iff")
