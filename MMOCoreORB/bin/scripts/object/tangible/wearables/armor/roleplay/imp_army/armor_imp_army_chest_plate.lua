--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_imp_army_armor_imp_army_chest_plate = object_tangible_wearables_armor_imp_army_shared_armor_imp_army_chest_plate:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 150,


	rating = MEDIUM,
	rpskill = 5,


	kinetic = 4,
	energy = 4,
	electricity = 0,
	stun = 0,
	blast = -4,
	heat = 2,
	cold = 2,
	acid = 0,
	lightsaber = -1,


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_imp_army_armor_imp_army_chest_plate, "object/tangible/wearables/armor/roleplay/imp_army/armor_imp_army_chest_plate.iff")
