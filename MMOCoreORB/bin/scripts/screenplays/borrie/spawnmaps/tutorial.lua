TutorialZoneScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TutorialZone",

	planet = "tutorial",	
}

function TutorialZoneScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnPatrolMobiles()
		self:spawnStationaryMobiles()
		self:spawnSceneObjects()
	end
end

registerScreenPlay("TutorialZoneScreenPlay",  true)

function TutorialZoneScreenPlay:spawnSceneObjects() 
	
	--TAILOR--
	--Ithorian 1
	local sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2602, -3.7, -162.442, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	--Ithorian 1
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2602, -2.8, -162.442, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")
	--Wookiee Wear
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2602, -1.9, -162.442, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	--Alien Wear
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2602, -1, -162.442, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Alien Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	--Boots
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2852, -3.7, -160.693, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	--Pants
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2852, -2.8, -160.693, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	--Shirts
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2852, -1.9, -160.693, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	--Hats
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2852, -1, -160.693, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	--Jewelry
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2425, -3.26, -159.376, 694200001, -0.707107, 0, 0, 0.707107)
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	--Skirts
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2405, -3.7, -158.046, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	--Belts
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2405, -2.8, -158.046, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	--Gloves
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2405, -1.9, -158.046, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	--Women's Wear
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2405, -1, -158.046, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	--Bodysuits
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.241, -3.7, -156.298, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	--Vests
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.241, -2.8, -156.298, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	--Robes
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.241, -1.9, -156.298, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	--Jacket
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.2374, -1, -156.298, 694200001, 0.5, 0.5, 0.5, -0.5)
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	
	--Jukebox
end

function TutorialZoneScreenPlay:spawnMobiles()
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 42.0283, -4.19999, -161.714, 273, 694200001, "rp_nikto_male", "xovros_ranged_vendor", "default", "random", "rpg_shopkeeper") --Ranged Weapon Vendor
	SceneObject(pNpc):setCustomObjectName("Nilok (a Ranged Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
    SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_ranged_novice")
	pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 42.0407, -4.19999, -159.345, 268, 694200001, "rp_human_female", "xovros_vendor_melee", "default", "random", "rpg_shopkeeper") --Melee Weapon Vendor
	SceneObject(pNpc):setCustomObjectName("Kara Il (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
    SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")
	pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 42.0407, -4.19999, -156.791, 268, 694200001, "rp_sullustan_male", "xovros_senior_engineer", "default", "random", "rpg_shopkeeper") --Lead Engineer
	SceneObject(pNpc):setCustomObjectName("Dieyko Ciecee (an Armorsmith Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")

	pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 27.564, -3.49999, -170.933, 0, 694200001, "rp_human_female", "char_creation/stranger", "default", "random", "character_creation") --Lead Engineer
	SceneObject(pNpc):setCustomObjectName("a Mysterious Stranger (Character Creation)")
end