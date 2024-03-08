object_draft_schematic_roleplay_component_component_saber_emitter = object_draft_schematic_roleplay_component_shared_component_saber_emitter:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Lightsaber Blade Emitter",

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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"circuit_board","operating_system_energy","comp_weapon_parts_rare"},
	ingredientSlotType = {1,1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_circuit_board","object/tangible/borrp/crafting/shared_comp_op_system_energy.iff","object/draft_schematic/roleplay/component/comp_weapon_parts_rare.iff"},
	resourceQuantities = {1,1,1},
	contribution = {100,100,100},
	targetTemplate = "object/tangible/item/roleplay/shared_component_saber_emitter.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_component_saber_emitter, "object/draft_schematic/roleplay/component/component_saber_emitter.iff")
