object_draft_schematic_roleplay_weapon_pistol_pistol_bryar = object_draft_schematic_roleplay_weapon_pistol_shared_pistol_bryar:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Bryar Blaster Pistol",

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
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_pistol_common.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff","object/tangible/component/weapon/shared_blaster_pistol_barrel.iff","object/tangible/component/weapon/shared_scope_weapon.iff"},
	resourceQuantities = {1,1,1,1},
	contribution = {100,100,100,100},
	ingredientAppearance = {"", "", "muzzle", "scope"},
	targetTemplate = "object/weapon/roleplay/ranged/pistol/pistol_bryar.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_pistol_pistol_bryar, "object/draft_schematic/roleplay/weapon/pistol/pistol_bryar.iff")
