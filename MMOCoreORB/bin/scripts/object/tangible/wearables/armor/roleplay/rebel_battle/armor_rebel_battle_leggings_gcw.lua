--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_rebel_battle_armor_rebel_battle_leggings_gcw = object_tangible_wearables_armor_rebel_battle_shared_armor_rebel_battle_leggings_gcw:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 150,


	rating = MEDIUM,
	rpskill = 4,

	price = 500,

	kinetic = 4,
	energy = 4,
	electricity = 0,
	stun = 0,
	blast = -4,
	heat = -4,
	cold = 0,
	acid = -2,
	lightsaber = -1,


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_rebel_battle_armor_rebel_battle_leggings_gcw, "object/tangible/wearables/armor/roleplay/rebel_battle/armor_rebel_battle_leggings_gcw.iff")
