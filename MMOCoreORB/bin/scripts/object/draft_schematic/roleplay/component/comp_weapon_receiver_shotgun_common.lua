object_draft_schematic_roleplay_component_comp_weapon_receiver_shotgun_common = object_draft_schematic_roleplay_component_shared_comp_weapon_receiver_shotgun_common:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Common Weapon Parts",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 8,
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
	ingredientTitleNames = {"scrap_metal","weapon_parts_common"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_scrap_metal.iff","object/draft_schematic/roleplay/component/weapon_parts_common.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/tangible/borrp/crafting/shared_comp_weapon_receiver_shotgun_common.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_comp_weapon_receiver_shotgun_common, "object/draft_schematic/roleplay/component/comp_weapon_receiver_shotgun_common.iff")
