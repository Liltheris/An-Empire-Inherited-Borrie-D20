DathomirLandingZoneScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "DathomirLandingZoneScreenPlay",

	planet = "rp_dathomir",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("DathomirLandingZoneScreenPlay",  true)

function DathomirLandingZoneScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
	end
end

function DathomirLandingZoneScreenPlay:spawnCivilians() 
	local waypointList_smc = {
		{157.207, 430, 4573.33, 206, 0,{"social"}},
		{155.605, 430, 4573.1, 127, 0,{"social"}},
		{156.674, 430, 4571.65, 352, 0,{"none"}},
		{145.201, 430, 4572.89, 112, 0,{"meditating"}},
		{146.404, 430, 4574.03, 140, 0,{"meditating"}},
		{0.149119, 2.01, 23.2881, 254, 2665879,{"meditating"}},
		{7.56626, 2.01, 9.87024, 290, 2665879,{"meditating"}},
		{6.89698, 2.01, 9.28326, 326, 2665879,{"meditating"}},
		{6.28011, 2.01, 10.6725, 137, 2665879,{"none"}},
		{-12.167, 2.01, 9.45687, 232, 2665880,{"meditating"}},
		{-11.0794, 2.01, 13.341, 103, 2665880,{"social"}},
		{-9.3927, 2.01, 13.1551, 271, 2665880,{"none"}},
		{-20.2129, 2.01, 4.49607, 223, 2665881,{"sit"}},
		{-21.1057, 2.01, 3.35166, 39, 2665881,{"sit"}},
		{-24.9001, 2.01, -7.69596, 229, 2665882,{"meditating"}},
		{-26.2631, 2.01, -6.66842, 176, 2665882,{"meditating"}},
		{4.87374, 2.01, -25.5643, 176, 2665884,{"meditating"}},
		{0.746223, 2.01, -25.3245, 186, 2665884,{"meditating"}},
		{25.0598, 2.01, -20.1989, 49, 2665886,{"meditating"}},
		{14.0149, 2.01, -1.98578, 171, 2665885,{"social"}},
		{13.9043, 2.01, -4.03493, 351, 2665885,{"social"}},
		{145.405, 430, 4537.51, 340, 0,{"social"}},
		{145.032, 430, 4540.21, 185, 0,{"social"}},
		{193.256, 430, 4593.26, 117, 0,{"meditating"}},
		{195.485, 430, 4592, 295, 0,{"meditating"}},
		{158.845, 395.121, 4630.88, 319, 0,{"none"}},
		{173.715, 378.165, 4669.07, 315, 0,{"sit"}},
		{172.429, 375.688, 4668.15, 320, 0,{"sit"}},
		{500.395, 275, 4718.91, 161, 0,{"none"}},
		{499.079, 275, 4716.6, 47, 0,{"none"}},
		{501.863, 275, 4716.42, 305, 0,{"social"}},
		{519.144, 275, 4718.59, 130, 0,{"sit"}},
		{519.683, 275, 4714.83, 25, 0,{"meditating"}},
		{522.049, 275, 4715.54, 317, 0,{"meditating"}},
		{547.631, 275, 4702.4, 75, 0,{"meditating"}},
		{547.45, 275, 4703.71, 62, 0,{"meditating"}},
		{534.114, 273.993, 4740.01, 181, 0,{"meditating"}},
		{536.978, 273.618, 4738.1, 242, 0,{"meditating"}},
		{536.122, 274.15, 4739.1, 217, 0,{"meditating"}},
		{535.23, 274.194, 4739.66, 206, 0,{"meditating"}},
		{629.228, 256.305, 4561.92, 62, 0,{"meditating"}},
		{628.129, 256.803, 4562.43, 73, 0,{"social"}},
		{594.894, 260, 4548.89, 238, 0,{"social"}},
		{592.364, 260, 4549.31, 99, 0,{"none"}},
		{593.004, 260, 4547.53, 33, 0,{"none"}},
		{608.91, 260, 4515.04, 112, 0,{"sit"}},
		{608.488, 260, 4513.94, 100, 0,{"social"}},
		{603.336, 260, 4508.65, 264, 0,{"social"}},
		{601.374, 260, 4509.05, 102, 0,{"none"}},
		{601.531, 260, 4508.02, 61, 0,{"none"}},
		{576.799, 260, 4524.06, 36, 0,{"meditating"}},
		{595.726, 260, 4534.05, 209, 0,{"none"}},
		{594.281, 260, 4531.93, 32, 0,{"social"}},
		{613.931, 260, 4538.55, 198, 0,{"social"}},
		{641.38, 258.389, 4502.21, 91, 0,{"meditating"}},
		{625.873, 273.465, 4437.64, 210, 0,{"social"}},
		{624.734, 272.413, 4435.02, 1, 0,{"none"}},
		{557.275, 229.5, 4201.9, 190, 0,{"social"}},
		{554.566, 229.5, 4202.62, 160, 0,{"social"}},
		{548.594, 229.5, 4219.79, 110, 0,{"social"}},
		{550.471, 229.5, 4217.54, 317, 0,{"none"}},
		{563.264, 229.5, 4234.01, 124, 0,{"meditating"}},
		{565.086, 229.5, 4234.53, 193, 0,{"meditating"}},
		{566.046, 229.5, 4232.54, 273, 0,{"meditating"}},
		{564.266, 229.5, 4231.55, 356, 0,{"meditating"}},
		{563.061, 229.5, 4232.66, 71, 0,{"meditating"}},
		{544.201, 229.5, 4237.54, 253, 0,{"none"}},
		{541.924, 229.5, 4236.38, 36, 0,{"none"}},
		{525.777, 229.5, 4202.02, 328, 0,{"none"}},
		{525.335, 229.5, 4204.03, 179, 0,{"none"}},
		{507.029, 229.5, 4191.87, 180, 0,{"sit"}},
		{505.492, 229.5, 4191.7, 149, 0,{"sit"}},
		{504.358, 229.5, 4190.58, 113, 0,{"sit"}},
		{516.127, 229.5, 4174.75, 46, 0,{"none"}},
		{517.963, 229.5, 4175.77, 246, 0,{"none"}},
		{525.574, 229.5, 4185.69, 269, 0,{"meditating"}},
		{577.131, 229.5, 4203.97, 144, 0,{"sit"}},
		{560.455, 229.491, 4152.59, 182, 0,{"meditating"}},
		{558.27, 229.496, 4152.35, 147, 0,{"meditating"}},
		{-435.494, 121, 4168.93, 109, 0,{"social"}},
		{-434.148, 121, 4167.29, 326, 0,{"none"}},
		{-437.986, 121, 4183.31, 112, 0,{"meditating"}},
	}

	local waypointList_nightsisters = {
		{-3979.6, 131.5, -173.785, 63, 0,{"sit"}},
		{-3978.51, 131.5, -175.462, 33, 0,{"sit"}},
		{-3976.71, 131.5, -176.099, 355, 0,{"sit"}},
		{-3974.53, 131.5, -175.475, 312, 0,{"sit"}},
		{-3983.01, 131.5, -167.938, 125, 0,{"meditating"}},
		{-3977.63, 131.5, -164.34, 163, 0,{"meditating"}},
		{-3971.37, 131.5, -184.652, 227, 0,{"none"}},
		{-3972.52, 131.5, -185.628, 19, 0,{"social"}},
		{-3980.6, 131.5, -193.172, 237, 0,{"social"}},
		{-3982.63, 131.5, -193.041, 119, 0,{"social"}},
		{-3981.98, 131.5, -195.037, 21, 0,{"none"}},
		{-4045.93, 120.62, -265.229, 167, 0,{"social"}},
		{-3996.97, 121, -275.38, 237, 0,{"social"}},
		{-3998.1, 121, -276.435, 8, 0,{"none"}},
		{-3999.25, 121, -262.619, 205, 0,{"meditating"}},
		{-4009.9, 121, -259.976, 156, 0,{"meditating"}},
		{-4165.09, 121, -90.2837, 298, 0,{"meditating"}},
		{-4150.31, 121, -105.602, 205, 0,{"meditating"}},
		{-4151.97, 121, -105.119, 165, 0,{"meditating"}},
		{-4153.05, 121, -106.194, 106, 0,{"meditating"}},
		{-4152.54, 121, -87.0916, 112, 0,{"social"}},
		{-4151.15, 121, -88.1138, 306, 0,{"social"}},
		{-4163.83, 121, -104.295, 54, 0,{"sit"}},
		{-4162.37, 121, -104.065, 256, 0,{"social"}},
		{-4161.34, 129.866, -153.883, 292, 0,{"sit"}},
		{-4168.49, 130.455, -159.172, 231, 0,{"social"}},
		{-4170.12, 130.445, -159.932, 59, 0,{"none"}},
		{-4080.76, 133.234, -207.207, 255, 0,{"meditating"}},
		{-4085.26, 133.798, -210.996, 33, 0,{"meditating"}},
		{-4137.2, 135.035, -189.162, 52, 0,{"meditating"}},
		{-4045.62, 127.563, -145.566, 284, 0,{"meditating"}},
		{1.28473, 0.759886, 2.30164, 355, 189375,{"meditating"}},
		{-7.75924, 0.759886, 0.419606, 9, 189375,{"social"}},
		{-8.12711, 0.759886, 2.03614, 143, 189375,{"none"}},
		{4.46538, 0.759883, -10.5407, 85, 189376,{"none"}},
		{6.58606, 0.759884, -10.9219, 276, 189376,{"none"}},
		{13.0519, 0.759882, -11.5062, 229, 189376,{"meditating"}},
		{13.3474, 0.759883, -25.8283, 138, 189377,{"social"}},
		{13.0352, 0.759883, -27.5945, 22, 189377,{"social"}},
		{14.8018, 0.759882, -27.319, 295, 189377,{"social"}},
		{-11.3789, 0.759882, -12.4864, 17, 189378,{"none"}},
		{-12.9528, 0.759882, -11.9167, 351, 189378,{"none"}},
		{-20.573, 0.759882, -28.0567, 80, 189378,{"sit"}},
		{4.99208, 0.759882, -54.6509, 117, 189379,{"none"}},
		{7.0077, 0.759882, -45.7567, 242, 189379,{"meditating"}},
		{7.33763, 0.759882, -46.7603, 280, 189379,{"meditating"}},
		{-18.1555, 7.219, -28.5193, 202, 189384,{"none"}},
		{-17.0932, 7.219, -29.8091, 248, 189384,{"none"}},
		{-16.0843, 7.21899, -11.9122, 309, 189384,{"none"}},
		{-19.4691, 7.219, -16.7359, 282, 189384,{"none"}},
		{6.6326, 7.21881, -30.9898, 282, 189382,{"none"}},
		{14.8292, 7.21881, -19.9538, 320, 189382,{"none"}},
		{12.4961, 7.21881, -16.2277, 145, 189382,{"none"}},
		{9.43188, 7.21881, -18.1649, 270, 189382,{"none"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_dathomir", waypointList_smc, self.walkpointList, "singing_mountain", "singing_mountain")
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_dathomir", waypointList_nightsisters, self.walkpointList, "nightsister", "nightsister")
end

function DathomirLandingZoneScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	--spawnSceneObject("rp_dathomir", "object/tangible/terminal/terminal_travel_rp.iff", 1520.12, 127, 1489.68, 0, 0.953717, 0, -0.300706, 0)
	
	--Signs
	
	
	--TAILOR--
	

end

function DathomirLandingZoneScreenPlay:spawnMobiles()
	
	local pNpc = createTemplatedRoleplayNPC("faction/nightsister/matriarch", -4151.37, 121, -107.367, 341, 0, "rp_dathomir")
	CreatureObject(pNpc):setMoodString("npc_meditate")

	-- Nightsister spawns
	createTemplatedRoleplayNPC("faction/nightsister/matriarch", -3976.73, 131.5, -170.364, 181, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/nightsister/warrior", -4057.89, 122.841, -277.704, 234, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/nightsister/warrior", -4125.83, 120.951, -45.5268, 7, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/nightsister/warrior", -4066.04, 130.5, -107.068, 47, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/nightsister/warrior", -4061.77, 130.5, -110.799, 27, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/nightsister/warrior", -4003.67, 123.875, -77.8944, 10, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/nightsister/warrior", -4009.19, 123.273, -76.2536, 13, 0, "rp_dathomir")

	-- Singing Mountain Clan spawns
	createTemplatedRoleplayNPC("faction/smc/matriarch", 2.93397, 3.01, -4.97753, 174, 2665884, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/matriarch", 533.907, 273.841, 4736.64, 31, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/matriarch", 611.656, 260, 4513.21, 289, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/matriarch", 506.86, 229.5, 4188.87, 325, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 154.531, 430, 4578.79, 4, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 148.54, 430, 4578.44, 10, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 160.094, 432.015, 4517.1, 339, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 156.155, 432.016, 4516.35, 346, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", -3.40761, 2.01, 6.95283, 56, 2665879, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 6.04498, 2.01, -9.8915, 171, 2665884, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", -2.3782, 2.01, -9.35803, 113, 2665884, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 276.828, 340.467, 4744.81, 30, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 506.185, 275.038, 4739.39, 94, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 506.462, 274.074, 4744.67, 120, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 630.337, 260, 4539.38, 68, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 611.822, 276.773, 4331.31, 195, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 586.085, 229.5, 4208.85, 179, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 424.717, 214.331, 4108.88, 181, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 423.153, 213.889, 4108.62, 154, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 178.319, 150.717, 4035.34, 257, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", 176.261, 150.85, 4041.01, 247, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", -438.697, 121, 4173.73, 307, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", -824.83, 121, 4173.52, 294, 0, "rp_dathomir")
	createTemplatedRoleplayNPC("faction/smc/warrior", -824.501, 121, 4178.32, 236, 0, "rp_dathomir")


	--Species, Equipment, Skills, Customization
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, 612.922, 260, 4534.88, 0, 0, "rancor", "default", "creature/predator_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Rancor")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, 556.19, 229.5, 4196.77, 0, 0, "rancor", "default", "creature/predator_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Rancor")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -6146.9, 127.865, 989.37, 82, 0, "atst", "default", "vehicle/atst", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("AT-ST")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -6144.43, 128.595, 956.88, 88, 0, "atst", "default", "vehicle/atst", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("AT-ST")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -6153.89, 126.156, 1001.76, 71, 0, "atst", "default", "vehicle/atst", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("AT-ST")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -6145.82, 130.054, 941.853, 96, 0, "atst", "default", "vehicle/atst", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("AT-ST")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -6136.29, 130.004, 949.792, 90, 0, "atst", "default", "vehicle/atst", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("AT-ST")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -6141.55, 124.899, 999.338, 76, 0, "atst", "default", "vehicle/atst", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("AT-ST")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -4120.51, 122.109, -30.4637, 319, 0, "rancor", "default", "creature/predator_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Rancor")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -4032.47, 118.666, -232.993, 188, 0, "rancor", "default", "creature/predator_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Rancor")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -4044.14, 121.114, -272.768, 357, 0, "rancor", "default", "creature/predator_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Rancor")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -4060.26, 123.42, -306.155, 294, 0, "rancor", "default", "creature/predator_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Rancor")
	pNpc = spawnRoleplayMobile("rp_dathomir", "rp_base_npc", 1, -4054.74, 127.961, -142.923, 105, 0, "rancor", "default", "creature/predator_large", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Rancor")
end