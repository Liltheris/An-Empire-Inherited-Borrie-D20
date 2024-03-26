object_draft_schematic_roleplay_vehicle_speederbike = object_draft_schematic_roleplay_vehicle_shared_speederbike:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Speederbike",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 14,
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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n","craft_weapon_ingredients_n"}
	ingredientTitleNames = {"Chassis","Engine","Vehicle Controls"},
	ingredientSlotType = {1,1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_speeder_chassis.iff","object/tangible/borrp/crafting/shared_comp_speeder_engine.iff",}"object/tangible/borrp/crafting/shared_comp_vehicle_controls.iff",
	resourceQuantities = {1,1,1},
	contribution = {100,100,100},

	targetTemplate = "object/tangible/deed/vehicle_deed/speederbike_deed.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_vehicle_speederbike, "object/draft_schematic/roleplay/vehicle/speederbike.iff")
