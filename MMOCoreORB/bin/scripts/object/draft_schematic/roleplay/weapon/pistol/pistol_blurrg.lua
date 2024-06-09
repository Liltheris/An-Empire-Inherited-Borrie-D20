object_draft_schematic_roleplay_weapon_pistol_pistol_blurrg = object_draft_schematic_roleplay_weapon_pistol_shared_pistol_blurrg:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Blurrg Holdout Blaster",

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
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_pistol_common.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	ingredientAppearance = {"", ""},
	targetTemplate = "object/weapon/roleplay/ranged/pistol/pistol_blurrg.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_pistol_pistol_blurrg, "object/draft_schematic/roleplay/weapon/pistol/pistol_blurrg.iff")
