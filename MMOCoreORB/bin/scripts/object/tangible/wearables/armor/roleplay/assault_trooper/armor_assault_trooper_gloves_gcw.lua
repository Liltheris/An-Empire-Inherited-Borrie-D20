--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_assault_trooper_armor_assault_trooper_gloves_gcw = object_tangible_wearables_armor_assault_trooper_shared_armor_assault_trooper_gloves_gcw:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = HEAVY,
	rpskill = 8,

	price = 1200,

	kinetic = 8,
	energy = 6,
	electricity = 0,
	stun = 2,
	blast = 2,
	heat = -2,
	cold = -6,
	acid = -4,
	lightsaber = -1,
	
	rarity = "Rare",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_assault_trooper_armor_assault_trooper_gloves_gcw, "object/tangible/wearables/armor/roleplay/assault_trooper/armor_assault_trooper_gloves_gcw.iff")
