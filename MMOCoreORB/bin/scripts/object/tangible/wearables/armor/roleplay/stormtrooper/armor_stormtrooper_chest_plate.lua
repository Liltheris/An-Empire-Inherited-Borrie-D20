--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_stormtrooper_armor_stormtrooper_chest_plate = object_tangible_wearables_armor_stormtrooper_shared_armor_stormtrooper_chest_plate:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = MEDIUM,
	rpskill = 4,

	price = 1000,
	
	kinetic = 4,
	energy = 4,
	electricity = 0,
	stun = 2,
	blast = -4,
	heat = -2,
	cold = -2,
	acid = -2,
	lightsaber = -1,


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_stormtrooper_armor_stormtrooper_chest_plate, "object/tangible/wearables/armor/roleplay/stormtrooper/armor_stormtrooper_chest_plate.iff")
