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

object_weapon_roleplay_melee_onehanded_acid_sword = object_weapon_melee_sword_shared_sword_acid:new {

	--[Info]
	customName = "Acid Sword",

	--[Stats]
	damageType = ACID,
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
}

object_weapon_roleplay_melee_onehanded_bandit_sword = object_weapon_melee_sword_shared_som_sword_mustafar_bandit:new {

	--[Info]
	customName = "Bandit Sword",

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
}

object_weapon_roleplay_melee_onehanded_ceremonial_cutlass = object_weapon_melee_sword_shared_sword_rebel:new {

	--[Info]
	customName = "Ceremonial Cutlass",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_crusader_templar_sword = object_weapon_melee_sword_shared_sword_mandalorian:new {

	--[Info]
	customName = "Crusader Templar Sword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 5, --Type of Die used in Damage
	bonusDamage = 5,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_dagger = object_weapon_melee_knife_shared_knife_dagger:new {

	--[Info]
	customName = "Dagger",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 0,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_elite_gaderiffi_stick = object_weapon_melee_baton_shared_baton_gaderiffi_elite:new {

	--[Info]
	customName = "Elite Gaderiffi Stick",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 3,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_gaderiffi_stick = object_weapon_melee_baton_shared_baton_gaderiffi:new {

	--[Info]
	customName = "Gaderiffi Stick",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 2,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_lightfoil_01_blue = object_weapon_melee_sword_shared_lightfoil_01:new {

	--[Info]
	customName = "Lightfoil, Blue",

	--[Stats]
	damageType = LIGHTSABER,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 7, --Type of Die used in Damage
	bonusDamage = 4,

	bladeColor = 40,
	
	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_lightfoil_01_red = object_weapon_melee_sword_shared_lightfoil_01:new {

	--[Info]
	customName = "Lightfoil, Red",

	--[Stats]
	damageType = LIGHTSABER,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 7, --Type of Die used in Damage
	bonusDamage = 4,
	
	bladeColor = 41,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_lightfoil_01_silver = object_weapon_melee_sword_shared_lightfoil_01:new {

	--[Info]
	customName = "Lightfoil, Silver",

	--[Stats]
	damageType = LIGHTSABER,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 7, --Type of Die used in Damage
	bonusDamage = 4,
	
	bladeColor = 32,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_mace = object_weapon_melee_sword_shared_sword_mace_junti_generic:new {

	--[Info]
	customName = "Mace",

	--[Stats]
	damageType = BLAST,
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
}

object_weapon_roleplay_melee_onehanded_marauder_sword = object_weapon_melee_sword_shared_sword_marauder:new {

	--[Info]
	customName = "Marauder Sword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	bonusDamage = 0,
	
	noDodgeReaction = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_naktra_crystal_knife = object_weapon_melee_knife_ep3_shared_knife_naktra_crystal:new {

	--[Info]
	customName = "Naktra Crystal Knife",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_obsidian_sword = object_weapon_melee_sword_shared_som_sword_obsidian:new {

	--[Info]
	customName = "Obsidian Sword",

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
}

object_weapon_roleplay_melee_onehanded_rantok = object_weapon_melee_sword_shared_sword_rantok:new {

	--[Info]
	customName = "Rantok",

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
}

object_weapon_roleplay_melee_onehanded_rsf_sword = object_weapon_melee_sword_shared_sword_rsf:new {

	--[Info]
	customName = "RSF Sword",

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
}

object_weapon_roleplay_melee_onehanded_ryyk_blade = object_weapon_melee_sword_shared_sword_blade_ryyk:new {

	--[Info]
	customName = "Ryyk Blade",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 7, --Type of Die used in Damage
	bonusDamage = 1,
	
	noDodgeReaction = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_stone_knife = object_weapon_melee_knife_shared_knife_stone:new {

	--[Info]
	customName = "Stone Knife",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 0,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_stun_baton = object_weapon_melee_baton_shared_baton_stun:new {

	--[Info]
	customName = "Stun Baton",

	--[Stats]
	damageType = STUN,
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
}

object_weapon_roleplay_melee_onehanded_survival_knife = object_weapon_melee_knife_shared_knife_survival:new {

	--[Info]
	customName = "Survival Knife",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 1,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_sword = object_weapon_melee_sword_shared_sword_01:new {

	--[Info]
	customName = "Sword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 2, --Type of Die used in Damage
	bonusDamage = 2,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_trandoshan_skinner = object_weapon_melee_knife_ep3_shared_knife_trando_skinner:new {

	--[Info]
	customName = "Trandoshan Skinner",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 3,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_vibroblade = object_weapon_melee_knife_shared_knife_vibroblade:new {

	--[Info]
	customName = "Vibroblade",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 3, --Type of Die used in Damage
	bonusDamage = 2,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_vibrosword = object_weapon_melee_sword_shared_sword_02:new {

	--[Info]
	customName = "Vibrosword",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 4, --Type of Die used in Damage
	bonusDamage = 2,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_vicious_ryyk_blade = object_weapon_melee_sword_shared_sword_pvp_bf_01:new {

	--[Info]
	customName = "Vicious Ryyk Blade",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 6, --Type of Die used in Damage
	bonusDamage = 4,
	
	noDodgeReaction = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

object_weapon_roleplay_melee_onehanded_wookiee_scythe = object_weapon_melee_sword_shared_sword_wod_scyth:new {

	--[Info]
	customName = "Wookiee Scythe",

	--[Stats]
	damageType = KINETIC,
	armorPiercing = NONE,

	--Damage (minDamage[d]maxDamage) i.e. (2d20)
	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 9, --Type of Die used in Damage
	bonusDamage = 1,
	
	noDodgeReaction = true,

	--[Stats]
	attackType = _attackType,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
}

ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_acid_sword, "object/weapon/roleplay/melee/onehanded/acid_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_bandit_sword, "object/weapon/roleplay/melee/onehanded/bandit_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_ceremonial_cutlass, "object/weapon/roleplay/melee/onehanded/ceremonial_cutlass.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_crusader_templar_sword, "object/weapon/roleplay/melee/onehanded/crusader_templar_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_dagger, "object/weapon/roleplay/melee/onehanded/dagger.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_elite_gaderiffi_stick, "object/weapon/roleplay/melee/onehanded/elite_gaderiffi_stick.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_gaderiffi_stick, "object/weapon/roleplay/melee/onehanded/gaderiffi_stick.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_lightfoil_01_blue, "object/weapon/roleplay/melee/onehanded/lightfoil_01_blue.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_lightfoil_01_red, "object/weapon/roleplay/melee/onehanded/lightfoil_01_red.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_lightfoil_01_silver, "object/weapon/roleplay/melee/onehanded/lightfoil_01_silver.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_mace, "object/weapon/roleplay/melee/onehanded/mace.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_marauder_sword, "object/weapon/roleplay/melee/onehanded/marauder_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_naktra_crystal_knife, "object/weapon/roleplay/melee/onehanded/naktra_crystal_knife.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_obsidian_sword, "object/weapon/roleplay/melee/onehanded/obsidian_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_rantok, "object/weapon/roleplay/melee/onehanded/rantok.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_rsf_sword, "object/weapon/roleplay/melee/onehanded/rsf_sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_ryyk_blade, "object/weapon/roleplay/melee/onehanded/ryyk_blade.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_stone_knife, "object/weapon/roleplay/melee/onehanded/stone_knife.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_stun_baton, "object/weapon/roleplay/melee/onehanded/stun_baton.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_survival_knife, "object/weapon/roleplay/melee/onehanded/survival_knife.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_sword, "object/weapon/roleplay/melee/onehanded/sword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_trandoshan_skinner, "object/weapon/roleplay/melee/onehanded/trandoshan_skinner.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_vibroblade, "object/weapon/roleplay/melee/onehanded/vibroblade.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_vibrosword, "object/weapon/roleplay/melee/onehanded/vibrosword.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_vicious_ryyk_blade, "object/weapon/roleplay/melee/onehanded/vicious_ryyk_blade.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_melee_onehanded_wookiee_scythe, "object/weapon/roleplay/melee/onehanded/wookiee_scythe.iff")
