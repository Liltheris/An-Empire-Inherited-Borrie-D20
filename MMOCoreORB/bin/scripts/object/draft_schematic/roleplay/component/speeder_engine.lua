object_draft_schematic_roleplay_component_speeder_engine = object_draft_schematic_roleplay_component_shared_speeder_engine:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Speeder engine",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 6,
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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n","craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"scrap_metal","scrap_metal2","scrap_metal3","scrap_metal4"},
	ingredientSlotType = {1,1,1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_scrap_metal.iff","object/tangible/borrp/crafting/shared_scrap_metal.iff","object/tangible/borrp/crafting/shared_scrap_metal.iff","object/tangible/borrp/crafting/shared_scrap_metal.iff"},
	resourceQuantities = {1,1,1,1},
	contribution = {100,100,100,100},
	targetTemplate = "object/tangible/borrp/crafting/speeder_engine.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_speeder_engine, "object/draft_schematic/roleplay/component/speeder_engine.iff")
