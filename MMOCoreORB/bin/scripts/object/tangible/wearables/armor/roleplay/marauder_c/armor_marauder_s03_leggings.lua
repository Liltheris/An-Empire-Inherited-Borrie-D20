--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_marauder_c_armor_marauder_s03_leggings = object_tangible_wearables_armor_marauder_shared_armor_marauder_s03_leggings:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 30,


	rating = LIGHT,
	rpskill = 2,


	price = 350,

	kinetic = 4,
	energy = 2,
	electricity = 2,
	stun = 2,
	blast = -2,
	heat = 0,
	cold = 0,
	acid = -4,
	lightsaber = -1,
	
	rarity = "Uncommon",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_marauder_c_armor_marauder_s03_leggings, "object/tangible/wearables/armor/roleplay/marauder_c/armor_marauder_s03_leggings.iff")
