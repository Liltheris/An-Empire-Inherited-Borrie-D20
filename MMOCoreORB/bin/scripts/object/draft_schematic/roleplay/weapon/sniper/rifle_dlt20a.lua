object_draft_schematic_roleplay_weapon_rifle_rifle_dlt20a = object_draft_schematic_roleplay_weapon_rifle_shared_rifle_dlt20a:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "DLT20a Sniper Rifle",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 8,
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
	ingredientTitleNames = {"receiver","operating_system","scope"},
	ingredientSlotType = {1,1,3,3},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_sniper_common.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff","object/tangible/component/weapon/shared_scope_weapon.iff"},
	resourceQuantities = {1,1,1},
	contribution = {100,100,100},
	ingredientAppearance = {"", "", "scope"},
	targetTemplate = "object/weapon/roleplay/ranged/rifle/dlt20a_heavy_blaster_rifle.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_rifle_rifle_dlt20a, "object/draft_schematic/roleplay/weapon/sniper/rifle_dlt20a.iff")
