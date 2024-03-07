object_draft_schematic_roleplay_weapon_rifle_rifle_adventurer = object_draft_schematic_roleplay_weapon_rifle_shared_rifle_adventurer:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Striker Blaster rifle",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 12,
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
	resourceTypes = {"object/tangible/borrp/crafting/shared_comp_weapon_receiver_sniper_rare.iff","object/tangible/borrp/crafting/shared_comp_op_system_base.iff"},
	resourceQuantities = {1,1},
	contribution = {100,100},
	targetTemplate = "object/weapon/roleplay/ranged/rifle/adventurer_rifle.iff",

	additionalTemplates = {}

}ObjectTemplates:addTemplate(object_draft_schematic_roleplay_weapon_rifle_rifle_adventurer, "object/draft_schematic/roleplay/weapon/rifle/rifle_adventurer.iff")
