--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_ithorian_sentinel_ith_armor_s03_gloves = object_tangible_wearables_armor_ithorian_sentinel_shared_ith_armor_s03_gloves:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = LIGHT,
	rpskill = 4,

	price = 1200,

	kinetic = 4,
	energy = 4,
	electricity = 2,
	stun = 0,
	blast = 0,
	heat = 2,
	cold = 2,
	acid = 0,
	lightsaber = -1,
	
	rarity = "Rare",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_ithorian_sentinel_ith_armor_s03_gloves, "object/tangible/wearables/armor/roleplay/ithorian_sentinel/ith_armor_s03_gloves.iff")
