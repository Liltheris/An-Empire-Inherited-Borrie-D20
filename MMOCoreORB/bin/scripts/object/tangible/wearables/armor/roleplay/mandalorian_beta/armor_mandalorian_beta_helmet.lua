--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_mandalorian_beta_armor_mandalorian_beta_helmet = object_tangible_wearables_armor_mandalorian_beta_shared_armor_mandalorian_beta_helmet:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 450,


	rating = MEDIUM,
	rpskill = 8,

	price = 10000,

	kinetic = 6,
	energy = 8,
	electricity = 0,
	stun = 2,
	blast = -4,
	heat = 0,
	cold = -2,
	acid = 0,
	lightsaber = 1,
	
	rarity = "Legendary",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_mandalorian_beta_armor_mandalorian_beta_helmet, "object/tangible/wearables/armor/roleplay/mandalorian_beta/armor_mandalorian_beta_helmet.iff")
