--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_rebel_spec_force_armor_rebel_spec_force_gloves_gcw = object_tangible_wearables_armor_rebel_spec_force_shared_armor_rebel_spec_force_gloves_gcw:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 250,


	rating = LIGHT,
	rpskill = 5,

	price = 700,

	kinetic = 0,
	energy = 6,
	electricity = 0,
	stun = 4,
	blast = -6,
	heat = 0,
	cold = 0,
	acid = 0,
	lightsaber = -1,


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_rebel_spec_force_armor_rebel_spec_force_gloves_gcw, "object/tangible/wearables/armor/roleplay/rebel_spec_force/armor_rebel_spec_force_gloves_gcw.iff")
