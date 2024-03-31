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
		{-3789.2, 35, -2593.26, 25, 0,{"sit"}},
		{-3789.43, 35, -2592.24, 79, 0,{"sit"}},
		{-3787.49, 35, -2591.66, 235, 0,{"social"}},
		{-3771.21, 35, -2631, 143, 0,{"social"}},
		{-3770.18, 35, -2632.03, 304, 0,{"social"}},
		{-3792.23, 35, -2626.91, 344, 0,{"social"}},
		{-3793.04, 35, -2625.89, 83, 0,{"social"}},
		{-3791.41, 35, -2626.39, 307, 0,{"none"}},
		{-3791.56, 35, -2625.43, 221, 0,{"none"}},
		{-3792.37, 35, -2625.14, 169, 0,{"none"}},
		{-3801.78, 36, -2644.6, 43, 0,{"sit"}},
		{-3802.63, 36, -2644.14, 43, 0,{"sit"}},
		{-3799.85, 35, -2642.18, 220, 0,{"social"}},
		{-3792.08, 35, -2598.93, 133, 0,{"sit"}},
		{-3791.32, 35, -2600.95, 337, 0,{"social"}},
		{-3776.16, 35, -2595.82, 218, 0,{"social"}},
		{-3777.77, 35, -2596.87, 53, 0,{"social"}},
		{-3769.25, 35, -2586.56, 23, 0,{"social"}},
		{-3768.23, 35, -2585.63, 218, 0,{"social"}},
		{-3734.08, 35, -2597.62, 308, 0,{"sit"}},
		{-3734.09, 35, -2596.53, 244, 0,{"sit"}},
		{-3736.28, 35, -2596.54, 103, 0,{"social"}},
		{-3727.68, 35, -2582.51, 177, 0,{"social"}},
		{-3727.71, 35, -2583.79, 356, 0,{"social"}},
		{-3750.62, 35, -2583.05, 269, 0,{"social"}},
		{-3751.68, 35, -2583.03, 94, 0,{"social"}},
		{-3751.81, 35, -2603.7, 39, 0,{"sit"}},
		{-3751.24, 35, -2604.3, 39, 0,{"none"}},
		{-3737.42, 35, -2655.2, 7, 0,{"tech"}},
		{-3743.46, 35, -2648.45, 15, 0,{"tech"}},
		{-3740.98, 35, -2649.67, 212, 0,{"sit"}},
		{-3749.78, 35.2803, -2640.86, 210, 0,{"sit"}},
		{-3751.44, 35, -2641.96, 62, 0,{"social"}},
		{-3754.12, 35, -2671.96, 61, 0,{"social"}},
		{-3752.58, 35, -2672.51, 302, 0,{"social"}},
		{-3752.37, 35, -2671.46, 252, 0,{"none"}},
		{-3753.32, 35, -2670.74, 180, 0,{"none"}},
		{-3725.36, 35, -2685.47, 312, 0,{"sit"}},
		{-3724.85, 35, -2684.78, 307, 0,{"sit"}},
		{-3735.61, 35, -2706.09, 287, 0,{"sit"}},
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
		{-3792.8, 35, -2772.98, 178, 0,{"sit"}},
		{-3793.61, 35, -2773.77, 104, 0,{"sit"}},
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
		{-3723.73, 35, -2963.63, 341, 0,{"sit"}},
		{-3723.76, 35, -2961.48, 180, 0,{"social"}},
		{-3711.95, 35, -2941.27, 249, 0,{"sit"}},
		{-3711.97, 35, -2942.2, 285, 0,{"sit"}},
		{-3711.99, 35, -2945.75, 263, 0,{"sit"}},
		{-3713.75, 35, -2946.17, 65, 0,{"social"}},
		{-3750.82, 35, -2933.79, 317, 0,{"social"}},
		{-3751.58, 35, -2932.64, 161, 0,{"social"}},
		{-3752.12, 35, -2921.34, 38, 0,{"social"}},
		{-3750.94, 35, -2920.18, 223, 0,{"social"}},
		{-3755.38, 35, -2913.69, 301, 0,{"social"}},
		{-3757.03, 35, -2913.35, 80, 0,{"social"}},
		{-3756.29, 35, -2912.16, 111, 0,{"social"}},
		{-3754.95, 35, -2912.86, 265, 0,{"social"}},
		{-3767.66, 35, -2874.94, 73, 0,{"sit"}},
		{-3767.66, 35, -2873.75, 85, 0,{"sit"}},
		{-3728.48, 35, -2862.17, 189, 0,{"tech"}},
		{-3729.84, 35, -2864.54, 23, 0,{"social"}},
		{-3728.9, 35, -2866.97, 256, 0,{"sit"}},
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
		{-3696.18, 35, -2920.01, 344, 0,{"sit"}},
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
		{-3734.37, 35, -2748.36, 265, 0,{"sit"}},
		{-3734.52, 35, -2747.5, 264, 0,{"none"}},
		{-3750.15, 35, -2736.18, 247, 0,{"tech"}},
		{-3751.31, 35, -2756.65, 207, 0,{"none"}},
		{-3756.35, 35, -2756.71, 147, 0,{"none"}},
		{-3757.21, 35, -2757.38, 117, 0,{"none"}},
		{-3761.79, 35, -2705.98, 104, 0,{"sit"}},
		{-3761.26, 35, -2705.13, 147, 0,{"sit"}},
		{-3760.04, 35, -2707.04, 315, 0,{"social"}},
		--Cantina
		{9.98121, -0.894992, 16.371, 240, 50610,{"sittable"}},
		{6.53136, -0.894992, 14.3807, 58, 50610,{"sitchair"}},
		{-3.08687, -0.899392, 11.5999, 101, 50606,{"sitchair"}},
		{1.17941, -0.894991, 11.5953, 272, 50606,{"sitchair"}},
		{-0.823798, -0.894991, 9.25737, 348, 50606,{"sitchair"}},
		{-2.08681, -0.894992, 17.8404, 270, 50612,{"sittable"}},
		{-3.54817, -0.894993, 16.082, 1, 50612,{"sittable"}},
		{-4.86426, -0.894997, 19.5419, 143, 50612,{"sitchair"}},
		{-5.55994, -0.894997, 17.485, 76, 50612,{"sitchair"}},
		{-4.68007, -0.894995, 16.6852, 34, 50612,{"drinker"}},
		{-9.74527, -0.894991, 5.66256, 181, 50606,{"drinker"}},
		{-9.09484, -0.894992, 5.66256, 180, 50606,{"drinker"}},
		{-5.00249, -0.894992, 5.66256, 180, 50606,{"drinker"}},
		{-4.12651, -0.894992, 5.66256, 180, 50606,{"social"}},
		{-3.28962, -0.894992, 5.66256, 175, 50606,{"none"}},
		{0.738543, -0.894992, 5.66256, 53, 50606,{"social"}},
		{1.8259, -0.894992, 5.66256, 269, 50606,{"drinker"}},
		{1.35765, -0.894992, 6.6192, 194, 50606,{"none"}},
		{27.0816, -0.894996, 5.6266, 242, 50606,{"drinker"}},
		{25.7587, -0.894995, 5.41513, 83, 50606,{"social"}},
		{9.8244, -0.894992, -2.54613, 307, 50606,{"drinker"}},
		{8.67364, -0.894992, -3.81267, 22, 50606,{"social"}},
		{12.8691, -0.894992, 18.5397, 131, 50608,{"sitchair"}},
		{12.7015, -0.894992, 16.1431, 56, 50608,{"sitchair"}},
		{14.8911, -0.894992, 15.9068, 314, 50608,{"social"}},
		{22.7738, -0.894992, 15.7724, 269, 50608,{"sittable"}},
		{22.3504, -0.894992, 17.4237, 165, 50608,{"social"}},
		{21.5658, -0.894992, 16.8731, 133, 50608,{"social"}},
		{3.70618, -0.894992, -4.768, 354, 50606,{"drinker"}},
		{2.70692, -0.894992, -4.768, 27, 50606,{"drinker"}},
		{0.645039, -0.894992, -4.768, 309, 50606,{"drinker"}},
		{-0.500067, -0.894992, -4.768, 63, 50606,{"social"}},
		{-13.691, -0.894869, -16.7256, 141, 50611,{"sittable"}},
		{-13.5499, -0.894962, -19.5835, 26, 50611,{"sitchair"}},
		{-11.0607, -0.89484, -16.763, 235, 50611,{"sitchair"}},
		{-15.8097, -0.894944, -14.9912, 60, 50606,{"social"}},
		{-14.2915, -0.894955, -14.7139, 234, 50606,{"social"}},
		{-24.0912, -0.894991, -10.9992, 172, 50617,{"sit"}},
		{-24.7817, -0.894991, -11.842, 38, 50617,{"social"}},
		{-33.7812, 0.10501, -24.6766, 186, 50617,{"tech"}},
		{-47.7539, 0.105009, -22.9471, 33, 50618,{"sitchair"}},
		{-45.6216, 0.105009, -23.9173, 345, 50618,{"sitchair"}},
		{-45.9728, 0.105009, -22.2402, 212, 50618,{"social"}},
		{-31.9132, 0.105011, -9.68884, 7, 50617,{"tech"}},
		{23.3568, -0.894992, -8.93039, 52, 50606,{"sitchair"}},
		{26.2323, -0.894994, -8.79485, 317, 50606,{"sitchair"}},
		{26.3565, -0.894994, -5.4293, 226, 50606,{"sitchair"}},
		{23.624, -0.894994, -5.78509, 139, 50606,{"sitchair"}},
		{22.893, -0.894993, -7.05691, 100, 50606,{"drinker"}},
		{25.8795, -0.894998, -14.0919, 236, 50607,{"sitchair"}},
		{25.7358, -0.894997, -16.4901, 310, 50607,{"sitchair"}},
		{22.6429, -0.894997, -14.1233, 120, 50607,{"sitchair"}},
		{17.0236, -0.894992, 4.38893, 317, 50606,{"sitchair"}},
		{17.1562, -0.894992, 7.75229, 226, 50606,{"sitchair"}},
		{14.4153, -0.894991, 7.39879, 139, 50606,{"sitchair"}},
		{14.148, -0.894991, 4.25337, 52, 50606,{"sitchair"}},
		{22.1732, -0.894994, 5.96099, 359, 50606,{"drinker"}},
		{21.7201, -0.894993, 7.56839, 157, 50606,{"drinker"}},
		{22.8495, -0.894994, 7.06762, 242, 50606,{"social"}},
		{21.0163, -0.894993, 6.78855, 104, 50606,{"social"}},
		{9.18412, -0.894992, 4.17786, 220, 50606,{"drinker"}},
		{13.8726, -0.894992, -10.6489, 283, 50606,{"sittable"}},
		{38.2375, 0.105, -9.55362, 350, 50604,{"sit"}},
		{38.9173, 0.105, -8.65283, 212, 50604,{"social"}},
		{35.4184, 0.105, 0.0377059, 333, 50605,{"social"}},
		{36.1345, 0.105, 0.899458, 250, 50605,{"social"}},
		{35.3246, 0.105, 1.51783, 173, 50605,{"none"}},
		{31.8961, 0.105, 4.76302, 169, 50605,{"sit"}},
		--Vornsk's Tail
		{-6.79956, -0.745953, -11.4409, 73, 50716,{"sittable"}},
		{-6.38184, -0.745953, -10.2764, 136, 50716,{"sitchair"}},
		{-3.53985, 0.249991, 3.98267, 50, 50716,{"drinker"}},
		{-2.92088, 0.24999, 3.3637, 47, 50716,{"drinker"}},
		{7.89468, 0.249874, -3.78694, 220, 50716,{"drinker"}},
		{7.212, 0.249874, -3.30397, 164, 50716,{"social"}},
		{-9.45862, 0.249992, 1.69251, 116, 50716,{"none"}},
		{4.13369, 1.25, 8.49982, 260, 50715,{"social"}},
		{3.22645, 1.25, 8.77048, 106, 50715,{"social"}},
		{-3627.29, 35, -2995.11, 152, 0,{"sit"}},
		{-3626.7, 35, -2995.14, 176, 0,{"sit"}},
		{-3645.47, 36.1699, -2991.81, 176, 0,{"sit"}},
		{-3645.74, 36.1699, -2992.86, 13, 0,{"social"}},
		--Backstreet
		{-3682.43, 35, -2981.42, 217, 0,{"tech"}},
		{-3671.69, 35, -2970.05, 272, 0,{"sit"}},
		{-3671.69, 35, -2968.96, 194, 0,{"social"}},
		{-3681.37, 35, -2951.29, 353, 0,{"social"}},
		{-3681.4, 35, -2949.59, 160, 0,{"social"}},
		{-3665.31, 35, -2956.67, 323, 0,{"sit"}},
		{-3664.14, 35, -2954.88, 214, 0,{"sit"}},
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

	--Cantina
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_jukebox.iff", 27.0829, -0.894995, 8.68511, 50606, -0.707107, 0, 0.707107, 0)

	--Signs
	local sObj = spawnSceneObject("rp_mandalore", "object/tangible/sign/all_sign_city_s03.iff", -3637.4, 41.1699, -2991.81, 0, 0.5, -0.5, -0.5, 0.5)
	SceneObject(sObj):setCustomObjectName("Vornsk's Tail")
	sObj = spawnSceneObject("rp_mandalore", "object/tangible/sign/all_sign_city_s03.iff", -4026.19, 35, -2795.35, 0, 0.92388, 0, 0.382683, 0)
	SceneObject(sObj):setCustomObjectName("House Keima")
	sObj = spawnSceneObject("rp_mandalore", "object/tangible/sign/all_sign_city_s03.iff", -3984.68, 35, -2750.19, 0, 0.927184, 0, 0.374607, 0)
	SceneObject(sObj):setCustomObjectName("House Deomer")

	--Weapon Parts
	sObj = spawnSceneObject("rp_mandalore", "object/tangible/furniture/cheap/chest_s01.iff", 23.4868, 1.30119, 2.03038, 50663, -4.37114e-08, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Scopes, Stocks and & Muzzles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("weapon_attachments")

end

function RpMandaloreKeldabeScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	--Spaceport
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3752.22, 35, -2583.75, 81, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3756.98, 35, -2600.78, 271, 0, "r2", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r2")
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3807.04, 35, -2620, 60, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, -3778.67, 35, -2622.53, 244, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")

	--Cantina
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_base_npc", 1, 8.62285, -0.894992, 0.447493, 89, 50606, "rp_human_male", "unique/scrubber", "factional/common/elite", "unique/clone") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Scrubber")
	
	--Vendors
	pNpc = spawnRoleplayMobile("rp_mandalore", "rp_convo_npc", 1, 21.3145, 1.29931, 6.98357, 259, 50663, "rp_human_female", "faction/mando/halli", "unique/halli_akul", "faction/mando/halli_akul", "rpg_shopkeeper") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Halli Akul (a Mandalorian Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "halli")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mando")
end