local Logger = require("utils.logger")

RpMandaloreKeldabeScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpMandaloreKeldabeScreenPlay",

	planet = "rp_mandalore",	
	
	walkpointList = {
		market_shopper1 = {

		},
	}
	
	
}

registerScreenPlay("RpMandaloreKeldabeScreenPlay",  true)

function RpMandaloreKeldabeScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function RpMandaloreKeldabeScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end

function RpMandaloreKeldabeScreenPlay:spawnCivilians() 
	local waypointList = {
		--Spaceport
		{-3778.92, 35, -2618.16, 126, 0,{"tech"}},
		{-3757.78, 35, -2599.98, 224, 0,{"tech"}},
		{-3789.2, 35, -2593.26, 25, 0,{"sitting"}},
		{-3789.43, 35, -2592.24, 79, 0,{"sitting"}},
		{-3787.49, 35, -2591.66, 235, 0,{"social"}},
		{-3771.21, 35, -2631, 143, 0,{"social"}},
		{-3770.18, 35, -2632.03, 304, 0,{"social"}},
		{-3792.23, 35, -2626.91, 344, 0,{"social"}},
		{-3793.04, 35, -2625.89, 83, 0,{"social"}},
		{-3791.41, 35, -2626.39, 307, 0,{"none"}},
		{-3791.56, 35, -2625.43, 221, 0,{"none"}},
		{-3792.37, 35, -2625.14, 169, 0,{"none"}},
		{-3801.78, 36, -2644.6, 43, 0,{"sitting"}},
		{-3802.63, 36, -2644.14, 43, 0,{"sitting"}},
		{-3799.85, 35, -2642.18, 220, 0,{"social"}},
		{-3792.08, 35, -2598.93, 133, 0,{"sitting"}},
		{-3791.32, 35, -2600.95, 337, 0,{"social"}},
		{-3776.16, 35, -2595.82, 218, 0,{"social"}},
		{-3777.77, 35, -2596.87, 53, 0,{"social"}},
		{-3769.25, 35, -2586.56, 23, 0,{"social"}},
		{-3768.23, 35, -2585.63, 218, 0,{"social"}},
		{-3734.08, 35, -2597.62, 308, 0,{"sitting"}},
		{-3734.09, 35, -2596.53, 244, 0,{"sitting"}},
		{-3736.28, 35, -2596.54, 103, 0,{"social"}},
		{-3727.68, 35, -2582.51, 177, 0,{"social"}},
		{-3727.71, 35, -2583.79, 356, 0,{"social"}},
		{-3750.62, 35, -2583.05, 269, 0,{"social"}},
		{-3751.68, 35, -2583.03, 94, 0,{"social"}},
		{-3751.81, 35, -2603.7, 39, 0,{"sitting"}},
		{-3751.24, 35, -2604.3, 39, 0,{"none"}},
		{-3737.42, 35, -2655.2, 7, 0,{"tech"}},
		{-3743.46, 35, -2648.45, 15, 0,{"tech"}},
		{-3740.98, 35, -2649.67, 212, 0,{"sitting"}},
		{-3749.78, 35.2803, -2640.86, 210, 0,{"sitting"}},
		{-3751.44, 35, -2641.96, 62, 0,{"social"}},
		{-3754.12, 35, -2671.96, 61, 0,{"social"}},
		{-3752.58, 35, -2672.51, 302, 0,{"social"}},
		{-3752.37, 35, -2671.46, 252, 0,{"none"}},
		{-3753.32, 35, -2670.74, 180, 0,{"none"}},
		{-3725.36, 35, -2685.47, 312, 0,{"sitting"}},
		{-3724.85, 35, -2684.78, 307, 0,{"sitting"}},
		{-3735.61, 35, -2706.09, 287, 0,{"sitting"}},
		{-3731.79, 35, -2710.33, 327, 0,{"social"}},
		{-3732.29, 35, -2709, 161, 0,{"social"}},
		{-3736.56, 35, -2713.43, 254, 0,{"none"}},
		{-3753.37, 35, -2696.28, 123, 0,{"none"}},
		{-3753.03, 35, -2697.82, 356, 0,{"none"}},
		{-3751.82, 35, -2696.88, 271, 0,{"social"}},
		{-3711.44, 35, -2655.6, 261, 0,{"social"}},
		{-3712.62, 35, -2655.65, 77, 0,{"social"}},
		{-3774.32, 35, -2809.24, 151, 0,{"social"}},
		{-3774.32, 35, -2810.9, 354, 0,{"social"}},
		{-3773.26, 35, -2810.39, 288, 0,{"social"}},
		{-3741.44, 35, -2798.59, 176, 0,{"none"}},
		{-3741.34, 35, -2800.42, 343, 0,{"none"}},
		{-3742.64, 35, -2799.85, 67, 0,{"social"}},
		{-3749.3, 35, -2822.99, 7, 0,{"social"}},
		{-3748.68, 35, -2821.4, 202, 0,{"social"}},
		{-3798.5, 35, -2778.65, 65, 0,{"social"}},
		{-3797.76, 35, -2777.93, 184, 0,{"social"}},
		{-3792.8, 35, -2772.98, 178, 0,{"sitting"}},
		{-3793.61, 35, -2773.77, 104, 0,{"sitting"}},
		{-3774.68, 35, -2759.22, 42, 0,{"social"}},
		{-3773.86, 35, -2759.78, 344, 0,{"none"}},
		{-3773.41, 35, -2758.4, 220, 0,{"none"}},
		--Capitol & Main road
		{-10.2089, 1.30291, 8.75848, 244, 50663,{"social"}},
		{-11.2409, 1.30243, 8.86239, 115, 50663,{"social"}},
		{3.73364, 3.16664, 23.5974, 265, 50662,{"social"}},
		{2.42541, 3.16654, 23.5942, 93, 50662,{"none"}},
		{-3724.06, 35.1943, -2999.49, 307, 0,{"none"}},
		{-3725.71, 35.1943, -2998.79, 91, 0,{"social"}},
		{-3724.65, 35.1943, -2997.77, 168, 0,{"social"}},
		{-3737.03, 35.1953, -2989.81, 191, 0,{"social"}},
		{-3737.08, 35.1953, -2991.1, 0, 0,{"social"}},
		{-3723.51, 35.1963, -2987.59, 249, 0,{"social"}},
		{-3724.64, 35.1953, -2988.7, 35, 0,{"social"}},
		{-3749.3, 35, -2959.38, 123, 0,{"social"}},
		{-3748.95, 35, -2960.81, 3, 0,{"social"}},
		{-3723.73, 35, -2963.63, 341, 0,{"sitting"}},
		{-3723.76, 35, -2961.48, 180, 0,{"social"}},
		{-3711.95, 35, -2941.27, 249, 0,{"sitting"}},
		{-3711.97, 35, -2942.2, 285, 0,{"sitting"}},
		{-3711.99, 35, -2945.75, 263, 0,{"sitting"}},
		{-3713.75, 35, -2946.17, 65, 0,{"social"}},
		{-3750.82, 35, -2933.79, 317, 0,{"social"}},
		{-3751.58, 35, -2932.64, 161, 0,{"social"}},
		{-3752.12, 35, -2921.34, 38, 0,{"social"}},
		{-3750.94, 35, -2920.18, 223, 0,{"social"}},
		{-3755.38, 35, -2913.69, 301, 0,{"social"}},
		{-3757.03, 35, -2913.35, 80, 0,{"social"}},
		{-3756.29, 35, -2912.16, 111, 0,{"social"}},
		{-3754.95, 35, -2912.86, 265, 0,{"social"}},
		{-3767.66, 35, -2874.94, 73, 0,{"sitting"}},
		{-3767.66, 35, -2873.75, 85, 0,{"sitting"}},
		{-3728.48, 35, -2862.17, 189, 0,{"tech"}},
		{-3729.84, 35, -2864.54, 23, 0,{"social"}},
		{-3728.9, 35, -2866.97, 256, 0,{"sitting"}},
		{-3737.51, 35, -2855.59, 313, 0,{"social"}},
		{-3737.74, 35, -2853.85, 181, 0,{"social"}},
		{-3739, 35, -2854.65, 118, 0,{"social"}},
		{-3763.74, 35, -2851.5, 173, 0,{"social"}},
		{-3763.72, 35, -2852.83, 355, 0,{"social"}},
		{-3776.55, 35, -2829.28, 94, 0,{"social"}},
		{-3776.41, 35, -2830.24, 57, 0,{"social"}},
		{-3774.7, 35, -2829.56, 282, 0,{"social"}},
		{-3731.13, 35, -2820.22, 251, 0,{"social"}},
		{-3732.98, 35, -2820.22, 102, 0,{"social"}},
		{-3733.94, 35, -2838.19, 60, 0,{"social"}},
		{-3732, 35, -2838.5, 281, 0,{"none"}},
		{-3732, 35, -2836.86, 239, 0,{"none"}},
		{-3696.18, 35, -2920.01, 344, 0,{"sitting"}},
		{-3699.22, 35, -2920.01, 349, 0,{"none"}},
		{-3695.54, 35, -2918.73, 220, 0,{"none"}},
		{-3696.74, 35, -2918.6, 149, 0,{"social"}},
		{-3693.2, 35, -2925.51, 333, 0,{"none"}},
		{-3707.77, 35, -2880.18, 238, 0,{"none"}},
		{-3708.89, 35, -2879.9, 124, 0,{"none"}},
		{-3708.7, 35, -2881.19, 15, 0,{"social"}},
		{-3714.87, 35, -2912.47, 180, 0,{"social"}},
		{-3715.53, 35, -2913.84, 22, 0,{"social"}},
		{-3767.5, 35, -2897.78, 222, 0,{"tech"}},
		{-3769.22, 35, -2896.19, 199, 0,{"tech"}},
		{-3766.84, 35, -2896.18, 220, 0,{"social"}},
		{-3784.17, 35, -2899.93, 337, 0,{"tech"}},
		{-3768.32, 35, -2881.33, 137, 0,{"social"}},
		{-3767.96, 35, -2882.74, 347, 0,{"social"}},
		{-3734.37, 35, -2748.36, 265, 0,{"sitting"}},
		{-3734.52, 35, -2747.5, 264, 0,{"none"}},
		{-3750.15, 35, -2736.18, 247, 0,{"tech"}},
		{-3751.31, 35, -2756.65, 207, 0,{"none"}},
		{-3756.35, 35, -2756.71, 147, 0,{"none"}},
		{-3757.21, 35, -2757.38, 117, 0,{"none"}},
		{-3761.79, 35, -2705.98, 104, 0,{"sitting"}},
		{-3761.26, 35, -2705.13, 147, 0,{"sitting"}},
		{-3760.04, 35, -2707.04, 315, 0,{"social"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_mandalore", waypointList, self.walkpointList, "mandalore", "mandalore")
end

function RpMandaloreKeldabeScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 50515, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 50515, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 50515, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 50515, 0.909306, 0, -0.416129, 0)

	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 50535, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 50535, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 50535, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 50535, 0.909306, 0, -0.416129, 0)

end

function RpMandaloreKeldabeScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	--Spaceport
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3752.22, 35, -2583.75, 81, 0, "r5", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3756.98, 35, -2600.78, 271, 0, "r2", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r2")
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3807.04, 35, -2620, 60, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3778.67, 35, -2622.53, 244, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	
	--Vendors
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, 21.3145, 1.29931, 6.98357, 259, 50663, "object/mobile/rp_human_female.iff", "faction/mando/halli", "unique/halli_akul", "faction/mando/halli_akul") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Halli Akul (a Mandalorian Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "halli")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mando")
end