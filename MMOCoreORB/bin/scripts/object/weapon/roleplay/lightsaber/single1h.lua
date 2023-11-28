-------------------------------------------
-- Global Weapon Type Setting
-------------------------------------------
_attackType = MELEEATTACK

_damageType = LIGHTSABER

_armorPiercing = HEAVY

_pointBlankRange = 0	--Start of ideal range
_idealRange = 1			--End of ideal range
_maxRange = 2			--Total max range

_minDamage = 1
_maxDamage = 10

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

_childObjects = {
		{templateFile = "object/tangible/inventory/lightsaber_inventory_2.iff", x = 0, z = 0, y = 0, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = 4}
	}

-------------------------------------------
-- Weapon Definitions
-------------------------------------------

object_weapon_roleplay_lightsaber_single_1h_sword_saber_aayla = object_weapon_melee_plasma_saber_sword_shared_sword_saber_aayla:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_aayla.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_abjudicator = object_weapon_melee_plasma_saber_sword_shared_sword_saber_abjudicator:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_abjudicator.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_adept = object_weapon_melee_plasma_saber_sword_shared_sword_saber_adept:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_adept.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ady = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ady:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ady.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ahsoka:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ahsoka.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ahsoka2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ahsoka2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka3 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ahsoka3:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ahsoka3.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka4 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ahsoka4:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ahsoka4.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_anakin = object_weapon_melee_plasma_saber_sword_shared_sword_saber_anakin:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_anakin.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_anakin_solo = object_weapon_melee_plasma_saber_sword_shared_sword_saber_anakin_solo:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_anakin_solo.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_anakin2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_anakin2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_anakin2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_arbiter = object_weapon_melee_plasma_saber_sword_shared_sword_saber_arbiter:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_arbiter.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_bane = object_weapon_melee_plasma_saber_sword_shared_sword_saber_bane:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_bane.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_barriss = object_weapon_melee_plasma_saber_sword_shared_sword_saber_barriss:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_barriss.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_boc = object_weapon_melee_plasma_saber_sword_shared_sword_saber_boc:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_boc.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_byph = object_weapon_melee_plasma_saber_sword_shared_sword_saber_byph:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_byph.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_cin = object_weapon_melee_plasma_saber_sword_shared_sword_saber_cin:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_cin.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_consul = object_weapon_melee_plasma_saber_sword_shared_sword_saber_consul:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_consul.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_dan = object_weapon_melee_plasma_saber_sword_shared_sword_saber_dan:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_dan.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_defender = object_weapon_melee_plasma_saber_sword_shared_sword_saber_defender:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_defender.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_desann = object_weapon_melee_plasma_saber_sword_shared_sword_saber_desann:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_desann.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_dooku = object_weapon_melee_plasma_saber_sword_shared_sword_saber_dooku:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_dooku.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_even = object_weapon_melee_plasma_saber_sword_shared_sword_saber_even:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_even.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ezra = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ezra:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ezra.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ezra2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ezra2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ezra2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_firebrand = object_weapon_melee_plasma_saber_sword_shared_sword_saber_firebrand:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_firebrand.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ganodi = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ganodi:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ganodi.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_gungi = object_weapon_melee_plasma_saber_sword_shared_sword_saber_gungi:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_gungi.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_imperial = object_weapon_melee_plasma_saber_sword_shared_sword_saber_imperial:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_imperial.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_jacen = object_weapon_melee_plasma_saber_sword_shared_sword_saber_jacen:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_jacen.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_jaina = object_weapon_melee_plasma_saber_sword_shared_sword_saber_jaina:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_jaina.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_jerec = object_weapon_melee_plasma_saber_sword_shared_sword_saber_jerec:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_jerec.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_jocasta = object_weapon_melee_plasma_saber_sword_shared_sword_saber_jocasta:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_jocasta.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_jolee = object_weapon_melee_plasma_saber_sword_shared_sword_saber_jolee:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_jolee.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_juhani = object_weapon_melee_plasma_saber_sword_shared_sword_saber_juhani:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_juhani.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_kanan = object_weapon_melee_plasma_saber_sword_shared_sword_saber_kanan:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_kanan.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_katooni = object_weapon_melee_plasma_saber_sword_shared_sword_saber_katooni:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_katooni.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_ki_adi = object_weapon_melee_plasma_saber_sword_shared_sword_saber_ki_adi:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_ki_adi.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_kouru = object_weapon_melee_plasma_saber_sword_shared_sword_saber_kouru:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_kouru.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_kyle = object_weapon_melee_plasma_saber_sword_shared_sword_saber_kyle:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_kyle.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke = object_weapon_melee_plasma_saber_sword_shared_sword_saber_luke:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_luke.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_luke2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_luke2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke3 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_luke3:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_luke3.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke4 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_luke4:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_luke4.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke5 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_luke5:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_luke5.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke6 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_luke6:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_luke6.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_luminara = object_weapon_melee_plasma_saber_sword_shared_sword_saber_luminara:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_luminara.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_mace = object_weapon_melee_plasma_saber_sword_shared_sword_saber_mace:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_mace.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_malak = object_weapon_melee_plasma_saber_sword_shared_sword_saber_malak:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_malak.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_mara = object_weapon_melee_plasma_saber_sword_shared_sword_saber_mara:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_mara.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_marauder = object_weapon_melee_plasma_saber_sword_shared_sword_saber_marauder:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_marauder.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_marek = object_weapon_melee_plasma_saber_sword_shared_sword_saber_marek:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_marek.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_marek2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_marek2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_marek2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_marek3 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_marek3:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_marek3.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_maul_broke = object_weapon_melee_plasma_saber_sword_shared_sword_saber_maul_broke:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_maul_broke.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_maw = object_weapon_melee_plasma_saber_sword_shared_sword_saber_maw:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_maw.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_nari = object_weapon_melee_plasma_saber_sword_shared_sword_saber_nari:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_nari.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_nihilus = object_weapon_melee_plasma_saber_sword_shared_sword_saber_nihilus:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_nihilus.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan = object_weapon_melee_plasma_saber_sword_shared_sword_saber_obi_wan:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_obi_wan.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_obi_wan2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_obi_wan2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan3 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_obi_wan3:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_obi_wan3.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan4 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_obi_wan4:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_obi_wan4.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan5 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_obi_wan5:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_obi_wan5.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_oppo = object_weapon_melee_plasma_saber_sword_shared_sword_saber_oppo:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_oppo.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_petro = object_weapon_melee_plasma_saber_sword_shared_sword_saber_petro:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_petro.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_pic_gorc = object_weapon_melee_plasma_saber_sword_shared_sword_saber_pic_gorc:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_pic_gorc.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_plo = object_weapon_melee_plasma_saber_sword_shared_sword_saber_plo:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_plo.iff",
	
	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_plo2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_plo2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_plo2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_praetor = object_weapon_melee_plasma_saber_sword_shared_sword_saber_praetor:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_praetor.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_qu_rahn = object_weapon_melee_plasma_saber_sword_shared_sword_saber_qu_rahn:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_qu_rahn.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_qui_gon = object_weapon_melee_plasma_saber_sword_shared_sword_saber_qui_gon:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_qui_gon.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_quinlan = object_weapon_melee_plasma_saber_sword_shared_sword_saber_quinlan:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_quinlan.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_rahm = object_weapon_melee_plasma_saber_sword_shared_sword_saber_rahm:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_rahm.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_reborn = object_weapon_melee_plasma_saber_sword_shared_sword_saber_reborn:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_reborn.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_retaliator = object_weapon_melee_plasma_saber_sword_shared_sword_saber_retaliator:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_retaliator.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_revan = object_weapon_melee_plasma_saber_sword_shared_sword_saber_revan:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_revan.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey = object_weapon_melee_plasma_saber_sword_shared_sword_saber_rey:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_rey.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_rey2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_rey2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey3 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_rey3:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_rey3.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey4 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_rey4:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_rey4.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey5 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_rey5:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_rey5.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_rig = object_weapon_melee_plasma_saber_sword_shared_sword_saber_rig:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_rig.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_sariss = object_weapon_melee_plasma_saber_sword_shared_sword_saber_sariss:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_sariss.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_scardont = object_weapon_melee_plasma_saber_sword_shared_sword_saber_scardont:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_scardont.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_sentinel = object_weapon_melee_plasma_saber_sword_shared_sword_saber_sentinel:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_sentinel.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_shaak_ti = object_weapon_melee_plasma_saber_sword_shared_sword_saber_shaak_ti:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_shaak_ti.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_sharad = object_weapon_melee_plasma_saber_sword_shared_sword_saber_sharad:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_sharad.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_sidious = object_weapon_melee_plasma_saber_sword_shared_sword_saber_sidious:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_sidious.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_sidious2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_sidious2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_sidious2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_sion = object_weapon_melee_plasma_saber_sword_shared_sword_saber_sion:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_sion.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_solo = object_weapon_melee_plasma_saber_sword_shared_sword_saber_solo:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_solo.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_starcruiser = object_weapon_melee_plasma_saber_sword_shared_sword_saber_starcruiser:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_starcruiser.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_tajin = object_weapon_melee_plasma_saber_sword_shared_sword_saber_tajin:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_tajin.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_temple_guard2_single = object_weapon_melee_plasma_saber_sword_shared_sword_saber_temple_guard2_single:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_temple_guard2_single.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_the_ren = object_weapon_melee_plasma_saber_sword_shared_sword_saber_the_ren:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_the_ren.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_tiin = object_weapon_melee_plasma_saber_sword_shared_sword_saber_tiin:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_tiin.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader = object_weapon_melee_plasma_saber_sword_shared_sword_saber_vader:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_vader.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_vader2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_vader2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader3 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_vader3:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_vader3.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader4 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_vader4:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_vader4.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_visas = object_weapon_melee_plasma_saber_sword_shared_sword_saber_visas:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_visas.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_yaddle = object_weapon_melee_plasma_saber_sword_shared_sword_saber_yaddle:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_yaddle.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_yarael = object_weapon_melee_plasma_saber_sword_shared_sword_saber_yarael:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_yarael.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_yoda = object_weapon_melee_plasma_saber_sword_shared_sword_saber_yoda:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_yoda.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_youngling = object_weapon_melee_plasma_saber_sword_shared_sword_saber_youngling:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_youngling.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_youngling2 = object_weapon_melee_plasma_saber_sword_shared_sword_saber_youngling2:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_youngling2.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_yun = object_weapon_melee_plasma_saber_sword_shared_sword_saber_yun:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_yun.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

object_weapon_roleplay_lightsaber_single_1h_sword_saber_zatt = object_weapon_melee_plasma_saber_sword_shared_sword_saber_zatt:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_zatt.iff",

	attackType = _attackType,
	minDamage = _minDamage,
	maxDamage = _maxDamage,
	attackType = _attackType,
	damageType = _damageType,
	armorPiercing = _armorPiercing,
	pointBlankRange = _pointBlankRange,
	pointBlankAccuracy = _pointBlankAccuracy,
	idealRange = _idealRange,
	idealAccuracy = _idealAccuracy,
	maxRange = _maxRange,
	maxRangeAccuracy = _maxRangeAccuracy,
	childObjects = _childObjects
}

ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_aayla, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_aayla.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_abjudicator, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_abjudicator.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_adept, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_adept.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ady, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ady.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ahsoka.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ahsoka2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka3, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ahsoka3.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ahsoka4, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ahsoka4.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_anakin, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_anakin.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_anakin_solo, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_anakin_solo.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_anakin2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_anakin2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_arbiter, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_arbiter.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_bane, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_bane.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_barriss, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_barriss.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_boc, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_boc.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_byph, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_byph.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_cin, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_cin.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_consul, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_consul.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_dan, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_dan.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_defender, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_defender.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_desann, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_desann.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_dooku, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_dooku.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_even, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_even.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ezra, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ezra.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ezra2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ezra2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_firebrand, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_firebrand.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ganodi, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ganodi.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_gungi, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_gungi.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_imperial, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_imperial.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_jacen, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_jacen.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_jaina, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_jaina.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_jerec, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_jerec.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_jocasta, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_jocasta.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_jolee, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_jolee.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_juhani, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_juhani.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_kanan, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_kanan.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_katooni, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_katooni.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_ki_adi, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_ki_adi.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_kouru, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_kouru.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_kyle, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_kyle.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_luke.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_luke2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke3, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_luke3.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke4, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_luke4.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke5, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_luke5.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_luke6, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_luke6.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_luminara, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_luminara.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_mace, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_mace.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_malak, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_malak.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_mara, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_mara.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_marauder, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_marauder.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_marek, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_marek.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_marek2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_marek2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_marek3, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_marek3.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_maul_broke, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_maul_broke.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_maw, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_maw.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_nari, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_nari.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_nihilus, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_nihilus.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_obi_wan.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_obi_wan2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan3, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_obi_wan3.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan4, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_obi_wan4.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_obi_wan5, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_obi_wan5.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_oppo, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_oppo.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_petro, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_petro.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_pic_gorc, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_pic_gorc.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_plo, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_plo.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_plo2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_plo2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_praetor, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_praetor.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_qu_rahn, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_qu_rahn.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_qui_gon, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_qui_gon.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_quinlan, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_quinlan.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_rahm, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_rahm.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_reborn, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_reborn.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_retaliator, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_retaliator.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_revan, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_revan.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_rey.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_rey2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey3, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_rey3.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey4, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_rey4.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_rey5, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_rey5.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_rig, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_rig.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_sariss, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_sariss.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_scardont, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_scardont.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_sentinel, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_sentinel.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_shaak_ti, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_shaak_ti.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_sharad, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_sharad.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_sidious, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_sidious.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_sidious2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_sidious2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_sion, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_sion.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_solo, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_solo.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_starcruiser, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_starcruiser.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_tajin, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_tajin.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_temple_guard2_single, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_temple_guard2_single.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_the_ren, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_the_ren.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_tiin, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_tiin.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_vader.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_vader2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader3, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_vader3.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_vader4, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_vader4.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_visas, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_visas.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_yaddle, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_yaddle.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_yarael, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_yarael.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_yoda, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_yoda.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_youngling, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_youngling.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_youngling2, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_youngling2.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_yun, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_yun.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_zatt, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_zatt.iff")
