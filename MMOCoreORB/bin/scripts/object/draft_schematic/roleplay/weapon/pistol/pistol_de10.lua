object_draft_schematic_roleplay_weapon_pistol_pistol_de10 = object_draft_schematic_roleplay_weapon_pistol_shared_pistol_de10:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "DE-10 Blaster Pistol",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 20,
	size = 1,
	factoryCrateType = "object/factory/factory_crate_weapon.iff",

	xpType = "",
	xp = 0,

	assemblySkill = "",
	experimentingSkill = "",
	customizationSkill = "",
 	factoryCrateSize = 0,

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"receiver","operating_system"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_pistol_legendary.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/weapon/roleplay/ranged/pistol/de10_blaster_pistol.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_pistol_pistol_de10, "object/draft_schematic/roleplay/weapon/pistol/pistol_de10.iff")
