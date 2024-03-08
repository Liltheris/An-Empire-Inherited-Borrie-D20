object_draft_schematic_roleplay_weapon_rifle_rifle_bowcaster = object_draft_schematic_roleplay_weapon_rifle_shared_rifle_bowcaster:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Wookiee Bowcaster",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 10,
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
	ingredientTitleNames = {"receiver","operating_system","barrel","scope"},
	ingredientSlotType = {1,1,3,3},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_rifle_common.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff","object/tangible/component/weapon/shared_blaster_rifle_barrel.iff","object/tangible/component/weapon/shared_scope_weapon.iff"},
	resourceQuantities = {1,1,1,1},
	contribution = {100,100,100,100},
	ingredientAppearance = {"", "", "muzzle", "scope"},
	targetTemplate = "object/weapon/roleplay/ranged/rifle/bowcaster.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_rifle_rifle_bowcaster, "object/draft_schematic/roleplay/weapon/rifle/rifle_bowcaster.iff")
