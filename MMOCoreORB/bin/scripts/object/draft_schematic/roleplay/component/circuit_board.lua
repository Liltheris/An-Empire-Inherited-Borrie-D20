object_draft_schematic_roleplay_component_circuit_board = object_draft_schematic_roleplay_component_shared_circuit_board:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Circuit Board",

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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"scrap_electronics","scrap_electronics2"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_scrap_electronics.iff","object/tangible/borrp/crafting/shared_scrap_electronics.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/tangible/borrp/crafting/circuit_board.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_circuit_board, "object/draft_schematic/roleplay/component/circuit_board.iff")
