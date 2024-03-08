object_draft_schematic_roleplay_component_comp_weapon_receiver_sniper_uncommon = object_draft_schematic_roleplay_component_shared_comp_weapon_receiver_sniper_uncommon:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "uncommon Weapon Parts",

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
	ingredientTitleNames = {"weapon_parts_common","weapon_parts_uncommon"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_weapon_parts_common.iff","object/tangible/borrp/crafting/shared_weapon_parts_uncommon.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/tangible/borrp/crafting/comp_weapon_receiver_sniper_uncommon.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_comp_weapon_receiver_sniper_uncommon, "object/draft_schematic/roleplay/component/comp_weapon_receiver_sniper_uncommon.iff")
