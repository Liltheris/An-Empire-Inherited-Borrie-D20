object_draft_schematic_roleplay_weapon_pistol_pistol_d18 = object_draft_schematic_roleplay_weapon_pistol_shared_pistol_d18:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "D-18 Blaster Pistol",

	craftingToolTab = 2048, -- (See DraftSchematicObjectTemplate.h)
	complexity = 16,
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

	ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n","craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"weapon_components","receiver","operating_system","furniture"},
	ingredientSlotType = {1,1,1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_parts_common.iff","object/tangible/borrp/crafting/shared_comp_weapon_receiver_pistol.iff","object/tangible/borrp/crafting/shared_comp_op_system_energy.iff","object/tangible/borrp/crafting/shared_comp_weapon_furniture.iff"},
	resourceQuantities = {1,1,1,1},
	contribution = {100,100,100,100},

	targetTemplate = "object/weapon/roleplay/ranged/pistol/d18_pistol.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_pistol_pistol_d18, "object/draft_schematic/roleplay/weapon/pistol/pistol_d18.iff")
