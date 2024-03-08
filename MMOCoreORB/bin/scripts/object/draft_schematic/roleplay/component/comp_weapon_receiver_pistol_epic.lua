object_draft_schematic_roleplay_component_weapon_receiver_pistol_epic = object_draft_schematic_roleplay_component_shared_weapon_receiver_pistol_epic:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "epic Weapon Parts",

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
	ingredientTitleNames = {"weapon_parts_rare","weapon_parts_epic"},
	ingredientSlotType = {1,1},
	resourceTypes = {"object/draft_schematic/roleplay/component/weapon_parts_rare.iff","object/draft_schematic/roleplay/component/weapon_parts_epic.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/tangible/borrp/crafting/shared_comp_weapon_receiver_pistol_epic.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_component_weapon_receiver_pistol_epic, "object/draft_schematic/roleplay/component/weapon_receiver_pistol_epic.iff")
