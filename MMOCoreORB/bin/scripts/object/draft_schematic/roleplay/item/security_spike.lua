arbineobject_draft_schematic_roleplay_item_security_spike = object_draft_schematic_roleplay_item_shared_security_spike:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Security Spike",

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
	ingredientTitleNames = {"computer_spike","circuit_board"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/item/computer_spike.iff","object/tangible/borrp/crafting/shared_comp_circuit_board.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},

	targetTemplate = "object/borrp/item/security_spike.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_item_security_spike, "object/draft_schematic/roleplay/item/security_spike.iff")
