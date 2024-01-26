TatooineWayfarScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TatooineWayfarScreenPlay",

	planet = "rp_tatooine",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("TatooineWayfarScreenPlay",  true)

function TatooineWayfarScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function TatooineWayfarScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function TatooineWayfarScreenPlay:spawnCivilians() 
	local waypointList = {
		{4364, 7.95637, -6033.78, 312, 0,{"tech"}},
		{4380.07, 8.02055, -6036.77, 33, 0,{"tech"}},
		{4387.96, 8.02667, -6036.85, 194, 0,{"sit"}},
		{4388.6, 8.02584, -6037.46, 226, 0,{"sit"}},
		{4393.1, 8.0087, -6079.46, 258, 0,{"none"}},
		{4393.58, 8.00807, -6078.07, 211, 0,{"social"}},
		{4380.27, 7.99571, -6083.79, 13, 0,{"tech"}},
		{4352.25, 7.8727, -6105.19, 225, 0,{"tech"}},
		{4352.85, 7.88542, -6122.4, 233, 0,{"sit"}},
		{4350.13, 7.88117, -6120.42, 134, 0,{"none"}},
		{4377.86, 8.01838, -6147.97, 235, 0,{"social"}},
		{4376.42, 8.00122, -6148.18, 89, 0,{"social"}},
		{4377.11, 8.01198, -6149.06, 0, 0,{"none"}},
		{4407.49, 7.90689, -6127.38, 234, 0,{"none"}},
		{4408.81, 7.91638, -6132.19, 306, 0,{"sit"}},
		{4407.97, 7.90588, -6132.54, 348, 0,{"sit"}},
		{4407.36, 7.88957, -6131.05, 131, 0,{"social"}},
		{4403.94, 7.93844, -6155.44, 274, 0,{"tech"}},
		{4396.43, 7.91133, -6150.47, 96, 0,{"tech"}},
		{4366.04, 8.26541, -6155.44, 214, 0,{"tech"}},
		{4359.3, 8.68759, -6154.49, 79, 0,{"sit"}},
		{4346.18, 9.27567, -6172.34, 144, 0,{"none"}},
		{4346.89, 9.23902, -6171.96, 141, 0,{"none"}},
		{4278.7, 7.89507, -6102.28, 5, 0,{"sitchair"}},
		{4261.04, 6.32991, -6053.52, 121, 0,{"sit"}},
		{4262.41, 6.343, -6053.3, 202, 0,{"social"}},
		{4293.94, 7.14133, -6046.94, 115, 0,{"social"}},
		{4295.74, 7.18631, -6047.63, 271, 0,{"none"}},
		{4365.17, 8.00935, -6067.23, 264, 0,{"sit"}},
		{4317.37, 7.64776, -6043.01, 108, 0,{"sit"}},
		{4318.09, 7.65529, -6042.63, 150, 0,{"sit"}},
		{4310.92, 8.19903, -6119.21, 13, 0,{"sit"}},
		{4432.75, 7.96595, -6067.04, 7, 0,{"sittable"}},
		{4432.01, 7.94037, -6064.43, 142, 0,{"sittable"}},
		{4449.01, 7.92684, -6056.26, 194, 0,{"social"}},
		{4447.71, 7.90079, -6058.79, 43, 0,{"none"}},
		{4449.35, 7.82107, -6059.03, 350, 0,{"none"}},
		{4454.46, 8.0157, -6064.71, 67, 0,{"none"}},
		{4453.69, 8.00163, -6069.32, 113, 0,{"none"}},
		{4455.5, 8.0082, -6066.01, 266, 0,{"social"}},
		{4458.35, 7.98686, -6068.81, 18, 0,{"tech"}},
		{4431.94, 8.02146, -6074.1, 7, 0,{"sittable"}},
		{4411.08, 7.95369, -6104.89, 155, 0,{"social"}},
		{4411.32, 7.9518, -6106.03, 343, 0,{"social"}},
		{4471.41, 7.77139, -6131.46, 279, 0,{"sit"}},
		--Cantina
		{5.18154, -0.894992, 5.66256, 176, 610030906,{"drinker"}},
		{5.18154, -0.894992, 5.66256, 176, 610030906,{"drinker"}},
		{4.2864, -0.894992, 5.66256, 116, 610030906,{"social"}},
		{16.9006, -0.894992, 6.70324, 225, 610030906,{"sittable"}},
		{14.9501, -0.894991, 4.90083, 51, 610030906,{"sittable"}},
		{4.74006, -0.894992, -4.768, 286, 610030906,{"drinker"}},
		{3.4422, -0.894992, -4.768, 77, 610030906,{"drinker"}},
		{30.8394, 0.105, 4.74075, 164, 610030905,{"sit"}},
		{48.4792, 0.105, 1.52004, 266, 610030904,{"sitchair"}},
		{47.2193, 0.104999, 3.10099, 359, 610030904,{"tech"}},
		{10.8916, -0.894991, -10.4512, 93, 610030906,{"sittable"}},
		{-23.9512, -0.894992, -15.0002, 257, 610030917,{"social"}},
		{-24.9613, -0.894992, -15.0002, 91, 610030917,{"social"}},
		{-36.0603, 0.10501, -12.8024, 101, 610030917,{"sit"}},
		{-36.3189, 0.10501, -13.6733, 66, 610030917,{"sit"}},
		{-43.3708, 0.104592, -18.4885, 5, 610030918,{"social"}},
		{-43.3708, 0.104592, -17.1182, 166, 610030918,{"none"}},
		{-1.80855, -0.894993, 23.3928, 236, 610030912,{"sitchair"}},
		{-5.04466, -0.894993, 23.3776, 121, 610030912,{"sitchair"}},
		{-5.58564, -0.894992, 5.66256, 170, 610030906,{"drinker"}},
		{16.3493, -0.894992, 21.8821, 256, 610030908,{"sittable"}},
		{4.2864, -0.894992, 5.66256, 116, 610030906,{"social"}},
		{16.9006, -0.894992, 6.70324, 225, 610030906,{"sittable"}},
		{14.9501, -0.894991, 4.90083, 51, 610030906,{"sittable"}},
		{4.74006, -0.894992, -4.768, 286, 610030906,{"drinker"}},
		{3.4422, -0.894992, -4.768, 77, 610030906,{"drinker"}},
		{30.8394, 0.105, 4.74075, 164, 610030905,{"sit"}},
		{48.4792, 0.105, 1.52004, 266, 610030904,{"sitchair"}},
		{47.2193, 0.104999, 3.10099, 359, 610030904,{"tech"}},
		{10.8916, -0.894991, -10.4512, 93, 610030906,{"sittable"}},
		{-23.9512, -0.894992, -15.0002, 257, 610030917,{"social"}},
		{-24.9613, -0.894992, -15.0002, 91, 610030917,{"social"}},
		{-36.0603, 0.10501, -12.8024, 101, 610030917,{"sit"}},
		{-36.3189, 0.10501, -13.6733, 66, 610030917,{"sit"}},
		{-43.3708, 0.104592, -18.4885, 5, 610030918,{"social"}},
		{-43.3708, 0.104592, -17.1182, 166, 610030918,{"none"}},
		{-1.80855, -0.894993, 23.3928, 236, 610030912,{"sitchair"}},
		{-5.04466, -0.894993, 23.3776, 121, 610030912,{"sitchair"}},
		{-5.58564, -0.894992, 5.66256, 170, 610030906,{"drinker"}},
		{16.3493, -0.894992, 21.8821, 256, 610030908,{"sittable"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end

function TatooineWayfarScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	
	--Signs

	--Cantina
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_jukebox.iff", 27.0829, -0.894995, 8.68511, 610030906, -0.707107, 0, 0.707107, 0)

end

function TatooineWayfarScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4363.46, 7.95616, -6035.07, 341, 0, "r5", "default", "droid/astromech", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4385.96, 8.02548, -6038.21, 63, 0, "r4", "default", "droid/astromech", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4386.84, 8.02553, -6038.1, 84, 0, "jawa", "default", "factional/common/tech", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4387.12, 8.02472, -6038.93, 26, 0, "jawa", "default", "factional/common/tech", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4390.2, 8.00891, -6079.91, 65, 0, "bantha_saddle", "default", "creature/domestic_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4363.91, 7.99987, -6070.67, 0, 0, "dewback", "default", "creature/domestic_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4311.61, 8.20058, -6119.64, 0, 0, "r5", "default", "droid/astromech", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4438.03, 7.86973, -6134.37, 91, 0, "jawa", "default", "factional/common/tech", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4438.97, 7.86986, -6134.4, 273, 0, "jawa", "default", "factional/common/tech", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	--Bartender
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 8.62281, -0.894992, 0.447349, 91, 610030906, "battle_droid", "default", "factional/common/grunt_army", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("B4-R10")
end