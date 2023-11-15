SulonBaronsHedScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "SulonBaronsHedScreenPlay",

	planet = "rp_sulon",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("SulonBaronsHedScreenPlay",  true)

function SulonBaronsHedScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
	end
end

function SulonBaronsHedScreenPlay:spawnCivilians() 
<<<<<<< Updated upstream
	local waypointList = {}
=======
	local waypointList = {
		--Customs
		{-4.2422, 0.184067, -5.0962, 210, 610028016,{"social"}},
		{-3.82485, 0.184067, -5.97042, 280, 610028016,{"social"}},
		{-3.54144, 0.184067, -0.701872, 0, 610028016,{"none"}},
		{-3.69951, 0.184067, -0.119052, 338, 610028016,{"none"}},
		{-3.64394, 0.184067, 0.450429, 0, 610028016,{"none"}},
		{-3.42225, 0.184067, 1.14132, 0, 610028016,{"none"}},
		{-4.13727, 0.184067, 1.10381, 23, 610028016,{"none"}},
		{-7.50198, 0.184067, -1.13204, 0, 610028016,{"none"}},
		{-7.80106, 0.184067, -0.353762, 0, 610028016,{"none"}},
		{-7.10129, 0.184067, -0.489415, 350, 610028016,{"none"}},
		{-7.58207, 0.184067, 0.556962, 0, 610028016,{"none"}},
		{-7.68568, 0.184067, 1.16966, 0, 610028016,{"none"}},
		{-16.6732, 0.184067, -6.58818, 145, 610028016,{"social"}},
		{-16.5875, 0.184067, -7.72418, 25, 610028016,{"social"}},
		{16.7343, 0.184067, 13.1357, 264, 610028015,{"sitting"}},
		{16.72, 0.184067, 12.3466, 281, 610028015,{"sitting"}},
		{12.0667, 0.184067, -0.551748, 190, 610028016,{"none"}},
		{11.2996, 0.184067, -0.562411, 165, 610028016,{"none"}},
		{11.6886, 0.184067, 0.150089, 178, 610028016,{"none"}},
		{11.8954, 0.184067, 1.05825, 182, 610028016,{"none"}},
		{11.5971, 0.184067, 1.91835, 177, 610028016,{"none"}},
		{6.86195, 0.184067, -0.629099, 192, 610028016,{"none"}},
		{7.21134, 0.184067, -0.229667, 190, 610028016,{"none"}},
		{6.96086, 0.184067, 1.47825, 181, 610028016,{"none"}},
		{7.44308, 0.184067, 2.0653, 187, 610028016,{"none"}},
		{7.06039, 0.184067, 2.8835, 182, 610028016,{"none"}},
		{6.95922, 0.184067, 3.22188, 181, 610028016,{"none"}},
		--Market
		{-6542.07, 10, 1814.64, 130, 0,{"social"}},
		{-6541.34, 10, 1813.66, 338, 0,{"social"}},
		{-6536.08, 10, 1814.8, 36, 0,{"social"}},
		{-6534.82, 10, 1815.07, 280, 0,{"social"}},
		{-6538.88, 10, 1815.3, 305, 0,{"social"}},
		{-6539.74, 10, 1816.35, 157, 0,{"social"}},
		{-6535.35, 10, 1815.86, 205, 0,{"none"}},
		{-6532.93, 10, 1811.77, 82, 0,{"none"}},
		{-6532.8, 10, 1813.67, 107, 0,{"none"}},
		{-6530.42, 10, 1823.3, 218, 0,{"none"}},
		{-6529.11, 10, 1819.76, 240, 0,{"none"}},
		{-6528.93, 10, 1817.73, 264, 0,{"none"}},
		{-6527.73, 10, 1809.65, 9, 0,{"social"}},
		{-6528.04, 10, 1810.73, 144, 0,{"social"}},
		{-6524.17, 10, 1812.95, 333, 0,{"social"}},
		{-6524.71, 10, 1814.35, 166, 0,{"social"}},
		{-6521.51, 10, 1830.44, 133, 0,{"social"}},
		{-6520.41, 10, 1830.71, 204, 0,{"social"}},
		{-6519.72, 10, 1829.91, 264, 0,{"social"}},
		{-6520.33, 10, 1828.95, 329, 0,{"social"}},
		{-6521.31, 10, 1829.09, 33, 0,{"social"}},
		{-6513.29, 10, 1826.61, 337, 0,{"social"}},
		{-6514.34, 10, 1827.83, 126, 0,{"social"}},
		{-6511.32, 10, 1827.69, 127, 0,{"none"}},
		{-6512.74, 10, 1821.4, 292, 0,{"none"}},
		{-6514.1, 10, 1821.12, 38, 0,{"none"}},
		{-6514.54, 10, 1821.58, 79, 0,{"social"}},
		{-6507.36, 10, 1809.67, 303, 0,{"social"}},
		{-6508.83, 10, 1810.67, 136, 0,{"social"}},
	}
>>>>>>> Stashed changes
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_sulon", waypointList, self.walkpointList, "sulon", "sulon")
end

function SulonBaronsHedScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	
	--Signs
	
	--TAILOR--
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", 1.34424, 0.625, 0.176758, 610028089, 1, 0, 0, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", -0.208496, 0.625, 0.176758, 610028089, 1, 0, 0, 0) --Pants
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", -1.77686, 0.625, 0.176758, 610028089, 1, 0, 0, 0) --Footwear
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", -3.37451, 0.625, 0.176758, 610028089, 1, 0, 0, 0)--Jacket
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -3.33594, 2.69809, -0.0209961, 610028089, 1, 0, 0, 0) --Vest
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -1.73633, 2.69809, -0.0209961, 610028089, 1, 0, 0, 0) --Robes
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -0.185059, 2.69809, -0.0209961, 610028089, 1, 0, 0, 0) --Bodysuits
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.40088, 2.69809, -0.0209961, 610028089, 1, 0, 0, 0) --Skirts
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -0.898438, 1.625, 6.69434, 610028089, 0, 0, 1, 0) --Women
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 0.101562, 1.625, 6.69434, 610028089, 0, 0, 1, 0) --Heaad & Goggle
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.10156, 1.625, 6.69434, 610028089, 0, 0, 1, 0) --Handwear
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 2.10156, 1.625, 6.69434, 610028089, 0, 0, 1, 0) --Jewelry
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -1.39844, 0.625, 6.69434, 610028089, 0, 0, 1, 0) --Misc/Belts
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -0.398438, 0.625, 6.69434, 610028089, 0, 0, 1, 0) --Aliens
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 0.601562, 0.625, 6.69434, 610028089, 0, 0, 1, 0) --Wookiee
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.60156, 0.625, 6.69434, 610028089, 0, 0, 1, 0) --Ithorian 1
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 2.60156, 0.625, 6.69434, 610028089, 0, 0, 1, 0) --Ithorian 2
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")

end

function SulonBaronsHedScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
end