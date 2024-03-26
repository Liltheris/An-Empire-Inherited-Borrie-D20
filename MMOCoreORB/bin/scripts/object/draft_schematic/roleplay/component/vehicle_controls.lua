object_draft_schematic_roleplay_component_vehicle_controls = object_draft_schematic_roleplay_component_shared_vehicle_controls:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "swoop Chassis",

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
	ingredientTitleNames = {"scrap_metal","scrap_electronics","circuit_board"},
	ingredientSlotType = {1,1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_scrap_metal.iff","object/tangible/borrp/crafting/shared_scrap_electronics.iff","object/tangible/borrp/crafting/shared_circuit_board.iff"},
	resourceQuantities = {1,1,1},
	contribution = {100,100,100,100},
	targetTemplate = "object/tangible/borrp/crafting/vehicle_controls.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_vehicle_controls, "object/draft_schematic/roleplay/component/vehicle_controls.iff")
