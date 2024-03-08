object_draft_schematic_roleplay_weapon_pistol_pistol_fwg5 = object_draft_schematic_roleplay_weapon_pistol_shared_pistol_fwg5:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Striker Blaster Pistol",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 12,
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
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_pistol_rare.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/weapon/roleplay/ranged/pistol/fwg5_flechette_smart_pistol.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_pistol_pistol_fwg5, "object/draft_schematic/roleplay/weapon/pistol/pistol_fwg5.iff")
