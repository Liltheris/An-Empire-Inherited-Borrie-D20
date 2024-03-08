object_draft_schematic_roleplay_component_comp_weapon_receiver_shotgun_rare = object_draft_schematic_roleplay_component_shared_comp_weapon_receiver_shotgun_rare:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "rare Weapon Parts",

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
	ingredientTitleNames = {"weapon_parts_uncommon","weapon_parts_rare"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_weapon_parts_uncommon.iff","object/tangible/borrp/crafting/shared_weapon_parts_rare.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/tangible/borrp/crafting/comp_weapon_receiver_shotgun_rare.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_comp_weapon_receiver_shotgun_rare, "object/draft_schematic/roleplay/component/comp_weapon_receiver_shotgun_rare.iff")
