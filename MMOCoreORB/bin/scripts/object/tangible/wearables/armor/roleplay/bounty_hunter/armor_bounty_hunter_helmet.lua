--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_bounty_hunter_armor_bounty_hunter_helmet = object_tangible_wearables_armor_bounty_hunter_shared_armor_bounty_hunter_helmet:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = HEAVY,
	rpskill = 6,

	price = 1400,

	kinetic = 2,
	energy = 6,
	electricity = -4,
	stun = 6,
	blast = -4,
	heat = 2,
	cold = 2,
	acid = 2,
	lightsaber = -1,
	
	rarity = "Epic",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_bounty_hunter_armor_bounty_hunter_helmet, "object/tangible/wearables/armor/roleplay/bounty_hunter/armor_bounty_hunter_helmet.iff")
