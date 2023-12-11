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

object_weapon_roleplay_lightsaber_double_lance_saber_avenger = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_avenger:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_bastila = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_bastila:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_cal_staff = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_cal_staff:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_champion = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_champion:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_guardian = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_guardian:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_pike = object_weapon_melee_polearm_crafted_saber_shared_sword_lightsaber_pike_s1:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_pong = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_pong:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_rey3_staff = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_rey3_staff:new {


	
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

object_weapon_roleplay_lightsaber_double_lance_saber_vanquisher = object_weapon_melee_plasma_saber_polearm_shared_lance_saber_vanquisher:new {


	
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

ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_avenger, "object/weapon/roleplay/lightsaber/double/lance_saber_avenger.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_bastila, "object/weapon/roleplay/lightsaber/double/lance_saber_bastila.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_cal_staff, "object/weapon/roleplay/lightsaber/double/lance_saber_cal_staff.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_champion, "object/weapon/roleplay/lightsaber/double/lance_saber_champion.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_guardian, "object/weapon/roleplay/lightsaber/double/lance_saber_guardian.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_pike, "object/weapon/roleplay/lightsaber/double/lance_saber_pike.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_pong, "object/weapon/roleplay/lightsaber/double/lance_saber_pong.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_rey3_staff, "object/weapon/roleplay/lightsaber/double/lance_saber_rey3_staff.iff")
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_double_lance_saber_vanquisher, "object/weapon/roleplay/lightsaber/double/lance_saber_vanquisher.iff")
