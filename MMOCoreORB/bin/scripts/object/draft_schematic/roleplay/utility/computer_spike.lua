arbineobject_draft_schematic_roleplay_utility_computer_spike = object_draft_schematic_roleplay_utility_shared_computer_spike:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Computer Spike",

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
	ingredientTitleNames = {"electronic_scrap","circuit_board"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_electronic_scrap.iff","object/tangible/borrp/crafting/shared_comp_circuit_board.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},

	targetTemplate = "object/borrp/item/computer_spike.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_utility_computer_spike, "object/draft_schematic/roleplay/utility/computer_spike.iff")
