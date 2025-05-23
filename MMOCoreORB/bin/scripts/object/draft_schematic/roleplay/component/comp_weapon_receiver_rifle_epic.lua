object_draft_schematic_roleplay_component_comp_weapon_receiver_rifle_epic = object_draft_schematic_roleplay_component_shared_comp_weapon_receiver_rifle_epic:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "epic Weapon Parts",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 18,
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
	ingredientTitleNames = {"weapon_parts_rare","weapon_parts_epic"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_parts_rare.iff","object/tangible/borrp/crafting/shared_comp_weapon_parts_epic.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/tangible/borrp/crafting/comp_weapon_receiver_rifle_epic.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_comp_weapon_receiver_rifle_epic, "object/draft_schematic/roleplay/component/comp_weapon_receiver_rifle_epic.iff")
