object_draft_schematic_roleplay_weapon_rifle_rifle_dp23 = object_draft_schematic_roleplay_weapon_rifle_shared_rifle_dp23:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "DP-23 Shotgun",

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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"receiver","operating_system"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_shotgun_common.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/weapon/roleplay/ranged/rifle/dp23_rifle.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_rifle_rifle_dp23, "object/draft_schematic/roleplay/weapon/shotgun/rifle_dp23.iff")
