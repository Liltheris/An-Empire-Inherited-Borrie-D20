object_draft_schematic_roleplay_weapon_rifle_rifle_trando_hunter = object_draft_schematic_roleplay_weapon_rifle_shared_rifle_trando_hunter:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Trandoshan Hunter Rifle",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
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

	ingredientTemplateNames = {"craft_weapon_ingredients_n","craft_weapon_ingredients_n"},
	ingredientTitleNames = {"receiver","operating_system"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_rifle_rare.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	ingredientAppearance = {"", ""},
	targetTemplate = "object/weapon/roleplay/ranged/rifle/trando_hunter_rifle.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_rifle_rifle_trando_hunter, "object/draft_schematic/roleplay/weapon/rifle/rifle_trando_hunter.iff")
