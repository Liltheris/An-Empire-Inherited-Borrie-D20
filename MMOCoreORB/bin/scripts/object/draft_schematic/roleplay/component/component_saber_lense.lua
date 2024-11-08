object_draft_schematic_roleplay_component_component_saber_lense = object_draft_schematic_roleplay_component_shared_component_saber_lense:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Lightsaber Crystal Chamber",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 15,
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
	ingredientTitleNames = {"circuit_board","scrap_metal","scrap_metal2","weapon_parts_uncommon"},
	ingredientSlotType = {1,1,1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_circuit_board.iff","object/tangible/borrp/crafting/shared_scrap_metal.iff","object/tangible/borrp/crafting/shared_scrap_metal.iff","object/tangible/borrp/crafting/shared_comp_weapon_parts_uncommon.iff"},
	resourceQuantities = {1,1,1,1},
	contribution = {100,100,100,100},
	targetTemplate = "object/tangible/item/roleplay/component_saber_lense.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_component_saber_lense, "object/draft_schematic/roleplay/component/component_saber_lense.iff")
