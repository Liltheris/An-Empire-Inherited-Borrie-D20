--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_tantel_armor_tantel_skreej_chest_plate = object_tangible_wearables_armor_tantel_shared_armor_tantel_skreej_chest_plate:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 85,


	rating = MEDIUM,
	rpskill = 2,

	price = 700,

	kinetic = 6,
	energy = 2,
	electricity = 0,
	stun = 4,
	blast = -2,
	heat = 0,
	cold = 0,
	acid = -4,
	lightsaber = -1,


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_tantel_armor_tantel_skreej_chest_plate, "object/tangible/wearables/armor/roleplay/tantel/armor_tantel_skreej_chest_plate.iff")
