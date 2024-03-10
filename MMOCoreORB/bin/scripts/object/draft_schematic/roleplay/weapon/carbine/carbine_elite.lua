object_draft_schematic_roleplay_weapon_carbine_carbine_elite = object_draft_schematic_roleplay_weapon_carbine_shared_carbine_elite:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Elite Blaster Carbine",

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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n","craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"receiver","operating_system","stock","scope"},
	ingredientSlotType = {1,1,3,3},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_carbine_uncommon.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff","object/tangible/component/weapon/shared_stock.iff","object/tangible/component/weapon/shared_scope_weapon.iff"},
	resourceQuantities = {1,1,1,1},
	contribution = {100,100,100,100},
	ingredientAppearance = {"", "", "stock", "scope"},
	targetTemplate = "object/weapon/roleplay/ranged/carbine/elite_carbine.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_carbine_carbine_elite, "object/draft_schematic/roleplay/weapon/carbine/carbine_elite.iff")
