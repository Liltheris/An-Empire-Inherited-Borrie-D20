object_draft_schematic_roleplay_weapon_carbine_carbine_bothan = object_draft_schematic_roleplay_weapon_carbine_shared_carbine_bothan:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Bothan Bola",

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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"receiver","operating_system"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_carbine_rare.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},

	targetTemplate = "object/weapon/roleplay/ranged/carbine/bothan_bola_carbine.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_carbine_carbine_bothan, "object/draft_schematic/roleplay/weapon/carbine/carbine_bothan.iff")
