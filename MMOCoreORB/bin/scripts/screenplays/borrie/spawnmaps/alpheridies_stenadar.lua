AlpheridiesStenadarScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "AlpheridiesStenadarScreenPlay",

	planet = "rp_alpheridies",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("AlpheridiesStenadarScreenPlay",  true)

function AlpheridiesStenadarScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function AlpheridiesStenadarScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function AlpheridiesStenadarScreenPlay:spawnCivilians() 
	local waypointList = {
		{1086.14, 9.8, -6555.22, 4, 0,{"social"}},
		{1086.49, 9.8, -6553.97, 193, 0,{"social"}},
		{1088.92, 9.8, -6551.54, 314, 0,{"tech"}},
		{1089.92, 9.8, -6549.78, 186, 0,{"none"}},
		{1096.92, 10, -6550.27, 221, 0,{"none"}},
		{1096.63, 10, -6551.71, 338, 0,{"social"}},
		{1076.51, 9.8, -6552.51, 38, 0,{"social"}},
		{1079.85, 9.8, -6551.34, 200, 0,{"social"}},
		{1074.65, 9.8, -6540.05, 15, 0,{"social"}},
		{1075.77, 9.8, -6538.36, 232, 0,{"none"}},
		{1077.4, 9.8, -6541.88, 322, 0,{"none"}},
		{1083.91, 9.8, -6536.24, 159, 0,{"tech"}},
		{1076.61, 10.1943, -6514.22, 104, 0,{"social"}},
		{1077.69, 10.1943, -6515.75, 311, 0,{"tech"}},
		{1077.69, 10.1943, -6509.82, 280, 0,{"none"}},
		{1136.39, 10, -6503.3, 286, 0,{"none"}},
		{1135.24, 10, -6502.19, 128, 0,{"social"}},
		{1121.4, 9.8, -6489.54, 22, 0,{"social"}},
		{1121.86, 9.8, -6487.98, 196, 0,{"social"}},
		{1131.84, 10, -6541.17, 303, 0,{"none"}},
		{1046.12, 9.8, -6519.04, 232, 0,{"none"}},
		{1027.47, 10.501, -6502.45, 82, 0,{"sit"}},
		{1029.95, 9.8, -6502.43, 271, 0,{"social"}},
		{1035.44, 9.8, -6499.26, 128, 0,{"none"}},
		{1033.84, 10.0219, -6427.33, 112, 0,{"social"}},
		{1036.19, 10, -6427.91, 277, 0,{"social"}},
		{1041.73, 9.8, -6464.3, 278, 0,{"none"}},
		{1015.23, 11, -6553.44, 29, 0,{"sit"}},
		{1016.55, 11, -6553.79, 321, 0,{"sit"}},
		{1016.27, 11, -6551.37, 190, 0,{"social"}},
		{16.9389, 1.28309, 1.59966, 90, 880034504,{"sitchair"}},
		{16.2521, 1.28309, 5.89795, 270, 880034504,{"sitchair"}},
		{-1.45156, 0.998434, -9.4719, 1, 880034503,{"social"}},
		{-1.68963, 1, -7.70603, 164, 880034503,{"none"}},
		{-3.17321, 0.999953, 17.8549, 155, 880034502,{"none"}},
		{24.286, 3.22324, -26.2824, 167, 880034451,{"tech"}},
		{17.5969, 3.22324, -33.5759, 2, 880034451,{"tech"}},
		{-14.0129, 1.29985, 12.2792, 94, 880034443,{"social"}},
		{-12.7189, 1.30039, 12.2556, 266, 880034443,{"none"}},
		{-17.9722, 1.30277, 1.9126, 98, 880034443,{"none"}},
		{-4.4413, 3.16178, 23.4363, 80, 880034442,{"none"}},
		{-2.94215, 3.16608, 23.5789, 264, 880034442,{"social"}},
		{13.8425, 1.30007, 11.9044, 198, 880034443,{"none"}},
		{-3.10648, 0.749991, 3.5493, 31, 880034623,{"drinker"}},
		{-4.54785, -0.249999, -9.62988, 272, 880034623,{"sittable"}},
		{-6.39233, -0.249999, -9.45215, 94, 880034623,{"sitchair"}},
		{6.01392, -0.237286, -6.0083, 231, 880034623,{"sittable"}},
		{1150.76, 10.4922, -6542.29, 23, 0,{"sit"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_alpheridies", waypointList, self.walkpointList, "miraluka", "alpheridies")
end


function AlpheridiesStenadarScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_alpheridies", "object/tangible/terminal/terminal_travel_rp.iff", -799.243, 83, 1599.14, 0, 0.707107, 0, 0.707107, 0)

	
	--Signs
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/sign/all_sign_city_s03.iff", 1172.76, 10.499, -6511.01, 0, 1, 0, 0, 0) --Tailor & Arms shop
	SceneObject(sObj):setCustomObjectName("Clothing")
	
	--TAILOR--
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -7.19999, 0.7, -3.96204, 880034577, 0.707107, 0, 0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -7.20999, 0.7, -2.74794, 880034577, 0.707107, 0, 0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -7.19999, 0.7, -1.5084, 880034577, 0.707107, 0, 0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -7.18537, 0.7, -0.26256, 880034577, 0.707107, 0, 0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -7.15579, 0.7, 0.984574, 880034577, 0.707107, 0, 0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -7.2, 0.7, 3.62311, 880034577, 0.707107, 0, 0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -5.24201, 0.7, 4.19999, 880034577, -4.37114e-08, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -3.60105, 0.7, 4.19999, 880034577, -4.37114e-08, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -1.05569, 0.7, 3.24453, 880034577, 0.707107, 0, -0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -1.05383, 0.7, 2.03359, 880034577, 0.707107, 0, -0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -1.04733, 0.7, 0.797634, 880034577, 0.707107, 0, -0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -1.04361, 0.7, -0.405796, 880034577, 0.707107, 0, -0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -1.03202, 0.7, -1.60877, 880034577, -0.707107, 0, 0.707107, 0)
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_alpheridies", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -2.40394, 0.7, -5.29965, 880034577, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Blindfolds")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_blindfolds")


end

function AlpheridiesStenadarScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	--Vendors
	local pNpc
	
	--Special
	pNpc = spawnRoleplayMobile("rp_alpheridies", "rp_base_npc", 1, 8.09042, 0.749981, 2.36658, 235, 610014332,	"le_repair_droid", "default", "default", "default") --Ignitor
	SceneObject(pNpc):setCustomObjectName("IG-N1-T0R")
end