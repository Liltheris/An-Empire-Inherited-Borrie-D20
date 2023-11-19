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
		{16.7343, 0.184067, 13.1357, 264, 610028015,{"sit"}},
		{16.72, 0.184067, 12.3466, 281, 610028015,{"sit"}},
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
		--Slums
		{-6776.17, 10, 1865.75, 0, 0,{"sit"}},
		{-6775.49, 10, 1867.02, 212, 0,{"social"}},
		{-6776.19, 10, 1866.97, 174, 0,{"none"}},
		{-6756.31, 10, 1888.96, 121, 0,{"none"}},
		{-6754.71, 10, 1888.73, 259, 0,{"social"}},
		{-6709.1, 10, 1890.05, 203, 0,{"social"}},
		{-6709.99, 10, 1890.05, 150, 0,{"sit"}},
		{-6679.35, 10, 1864.43, 0, 0,{"sit"}},
		{-6684.55, 10, 1867.87, 245, 0,{"social"}},
		{-6685.36, 10, 1866.99, 5, 0,{"social"}},
		{-6682.04, 10, 1866.78, 287, 0,{"none"}},
		{-6701.99, 10, 1870.37, 274, 0,{"social"}},
		{-6703.4, 10, 1870.41, 87, 0,{"none"}},
		{-6763.55, 10, 1935.88, 178, 0,{"sit"}},
		{-6764.61, 10, 1935.89, 151, 0,{"sit"}},
		{-6737.59, 10, 1934.94, 214, 0,{"none"}},
		{-6729.29, 10, 1906.06, 357, 0,{"social"}},
		{-6728.59, 10, 1907.42, 244, 0,{"social"}},
		{-6729.94, 10, 1907.42, 121, 0,{"social"}},
		{-6715.15, 10, 1924.32, 47, 0,{"social"}},
		{-6712.99, 10, 1926.36, 226, 0,{"social"}},
		{-6714.13, 10, 1926.54, 173, 0,{"none"}},
		{-6712.94, 10, 1924.36, 314, 0,{"none"}},
		{-6686.72, 10, 1912.64, 286, 0,{"none"}},
		{-6687.88, 10, 1913.32, 133, 0,{"none"}},
		{-6687.89, 10, 1912.16, 38, 0,{"social"}},
		{-6698.5, 10, 1936.84, 146, 0,{"social"}},
		{-6697.42, 10, 1936.66, 216, 0,{"none"}},
		{-6801.07, 11, 1873.47, 339, 0,{"sit"}},
		{-6802.29, 11, 1873.34, 0, 0,{"sit"}},
		{-6817.89, 10, 1939.11, 164, 0,{"sit"}},
		{-6787.92, 10, 1922.73, 128, 0,{"none"}},
		{-6787.68, 10, 1921.53, 20, 0,{"social"}},
		{-6810.38, 10, 1900.38, 152, 0,{"social"}},
		{-6810.14, 10, 1899.14, 0, 0,{"social"}},
		{-6809.4, 10, 1900.18, 249, 0,{"none"}},
		{-6830.71, 10, 1941.27, 0, 0,{"none"}},
		{-6830.57, 10, 1942.58, 190, 0,{"none"}},
		{-6652.62, 10, 1888.98, 202, 0,{"sit"}},
		{-6652.62, 10, 1887.16, 268, 0,{"sit"}},
		{-6849.36, 10, 1951.13, 210, 0,{"sit"}},
		{-6850.08, 10, 1949.04, 0, 0,{"none"}},
		{-6852.56, 10, 1935.51, 249, 0,{"none"}},
		{-6853.24, 10, 1934.52, 334, 0,{"none"}},
		{-6854.24, 10, 1936.14, 139, 0,{"social"}},
		{-6854.46, 10, 1934.67, 42, 0,{"social"}},
		{-6881.15, 10, 1917.57, 0, 0,{"sit"}},
		{-6882.51, 10, 1917.63, 338, 0,{"sit"}},
		{-6883.9, 10, 1917.69, 25, 0,{"sit"}},
		{-6881.28, 10, 1922.35, 202, 0,{"none"}},
		{-6933.69, 10, 1914.39, 185, 0,{"none"}},
		{-6933.8, 10, 1913.13, 0, 0,{"none"}},
		{-6885.01, 10, 1956.68, 306, 0,{"social"}},
		{-6885.96, 10, 1957.63, 228, 0,{"sit"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_sulon", waypointList, self.walkpointList, "sulon", "sulon")
end

function SulonBaronsHedScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 610029859, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 610029859, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 610029859, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 610029859, 0.909306, 0, -0.416129, 0)
	
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 610029873, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 610029873, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 610029873, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 610029873, 0.909306, 0, -0.416129, 0)
	
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 610029907, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 610029907, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 610029907, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 610029907, 0.909306, 0, -0.416129, 0)
	--Signs
	
	--TAILOR--
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", 1.34424, 0.625, 0.176758, 610028090, 1, 0, 0, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", -0.208496, 0.625, 0.176758, 610028090, 1, 0, 0, 0) --Pants
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", -1.77686, 0.625, 0.176758, 610028090, 1, 0, 0, 0) --Footwear
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_cabinet_s01.iff", -3.37451, 0.625, 0.176758, 610028090, 1, 0, 0, 0)--Jacket
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -3.33594, 2.69809, -0.0209961, 610028090, 1, 0, 0, 0) --Vest
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -1.73633, 2.69809, -0.0209961, 610028090, 1, 0, 0, 0) --Robes
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -0.185059, 2.69809, -0.0209961, 610028090, 1, 0, 0, 0) --Bodysuits
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.40088, 2.69809, -0.0209961, 610028090, 1, 0, 0, 0) --Skirts
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -0.898438, 1.625, 6.69434, 610028090, 0, 0, 1, 0) --Women
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 0.101562, 1.625, 6.69434, 610028090, 0, 0, 1, 0) --Heaad & Goggle
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.10156, 1.625, 6.69434, 610028090, 0, 0, 1, 0) --Handwear
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 2.10156, 1.625, 6.69434, 610028090, 0, 0, 1, 0) --Jewelry
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -1.39844, 0.625, 6.69434, 610028090, 0, 0, 1, 0) --Misc/Belts
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", -0.398438, 0.625, 6.69434, 610028090, 0, 0, 1, 0) --Aliens
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 0.601562, 0.625, 6.69434, 610028090, 0, 0, 1, 0) --Wookiee
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.60156, 0.625, 6.69434, 610028090, 0, 0, 1, 0) --Ithorian 1
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_sulon", "object/tangible/furniture/plain/plain_chest_s01.iff", 2.60156, 0.625, 6.69434, 610028090, 0, 0, 1, 0) --Ithorian 2
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")

end

function SulonBaronsHedScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
end