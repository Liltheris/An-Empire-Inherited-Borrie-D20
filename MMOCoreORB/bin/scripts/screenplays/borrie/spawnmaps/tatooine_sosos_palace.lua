TatooineSososPalaceScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TatooineSososPalaceScreenPlay",

	planet = "rp_tatooine",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("TatooineSososPalaceScreenPlay",  true)

function TatooineSososPalaceScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function TatooineSososPalaceScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function TatooineSososPalaceScreenPlay:spawnCivilians() 
	local waypointList = {
		{25.9593, 0.199999, 26.2254, 185, 610009475,{"social"}},
		{26, 0.199999, 24.8299, 357, 610009475,{"social"}},
		{23.8344, 0.199999, 16.8547, 298, 610009475,{"tech"}},
		{26.5, 0.199999, 49.454, 85, 610009475,{"sit"}},
		{26.5, 0.199999, 50.4836, 103, 610009475,{"sit"}},
		{7.23654, 2, 51.33, 66, 610009490,{"social"}},
		{8.25581, 2, 50.5343, 346, 610009490,{"drinker"}},
		{-5.37834, 2, 50.4771, 131, 610009490,{"drinker"}},
		{-5.55351, 2, 49.2977, 38, 610009490,{"drinker"}},
		{-14.0184, 2, 34.5, 4, 610009490,{"drinker"}},
		{-12.0327, 2, 53.5, 155, 610009490,{"drinker"}},
		{-10.9486, 2, 53.5, 197, 610009490,{"drinker"}},
		{-8.87745, 2, 53.5, 171, 610009490,{"sit"}},
		{-13.5, 3, 22.5, 30, 610009490,{"sit"}},
		{-12.2216, 3, 23.1677, 229, 610009490,{"social"}},
		{-10.5319, 2, 35.7851, 31, 610009490,{"social"}},
		{-9.4442, 2, 35.9149, 283, 610009490,{"social"}},
		{-9.60339, 2, 36.9813, 200, 610009490,{"social"}},
		{-10.7152, 2, 36.9535, 122, 610009490,{"social"}},
		{-1.89204, 2, 38.0341, 151, 610009490,{"social"}},
		{-1.52231, 2, 37.0766, 328, 610009490,{"social"}},
		{-13.265, 3, 55.9517, 283, 610009477,{"social"}},
		{-15.1582, 3, 56.383, 103, 610009477,{"social"}},
		{-27, 3, 56.516, 64, 610009477,{"sit"}},
		{-0.609307, 0.199999, 84.8949, 171, 610009483,{"sitchair"}},
		{2.18828, 0.199999, 84.5442, 207, 610009483,{"sitchair"}},
		{-34, 0.199997, 84.5, 190, 610009479,{"sit"}},
		{-13.9026, 0.199997, 80.5, 10, 610009483,{"sit"}},
		{-13, 0.199997, 80.5, 320, 610009483,{"sit"}},
		{-13.5588, 0.199997, 81.6981, 172, 610009483,{"social"}},
		{-20.5896, 0.199998, 80, 267, 610009478,{"social"}},
		{-30, 3, 67.3561, 184, 610009491,{"social"}},
		{-30.0169, 3, 65.4478, 0, 610009491,{"social"}},
		{11.3407, 5.8, 62.5979, 270, 610009473,{"sitchair"}},
		{8.0118, 5.8, 59.8706, 0, 610009473,{"sitchair"}},
		{6.42552, 5.8, 64.8797, 148, 610009473,{"sitchair"}},
		{7.39198, 5.8, 65.7023, 178, 610009473,{"social"}},
		{5.8995, 5.8, 60.078, 45, 610009473,{"social"}},
		{10.5773, 5.8, 72.2424, 296, 610009473,{"social"}},
		{9.60077, 5.8, 73.5317, 141, 610009473,{"social"}},
		{-6.51912, 5.8, 70.9945, 279, 610009472,{"social"}},
		{-8.13815, 5.8, 71.5736, 108, 610009472,{"drinker"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end

function TatooineSososPalaceScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	
	--Signs

	--Cantina
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_jukebox.iff", -23.3687, 3.6, 54.7999, 610009490, -4.37114e-08, 0, 1, 0)
end

function TatooineSososPalaceScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	--dancers
	local pNpc = createTemplatedRoleplayNPC("special/dancer", -5.79712, 2, 38.1038, 294, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_dance_basic")
	pNpc = createTemplatedRoleplayNPC("special/dancer", -4.87609, 2, 46.3153, 241, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_dance_basic")
	pNpc = createTemplatedRoleplayNPC("special/dancer", 8.55862, 2, 38.8336, 346, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_dance_basic")

	pNpc = createTemplatedRoleplayNPC("special/merc", 9.74416, 2, 36.8452, 268, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_sitting_chair")
	pNpc = createTemplatedRoleplayNPC("special/merc", 6.8436, 2, 37.0211, 91, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_sitting_chair")
	pNpc = createTemplatedRoleplayNPC("special/merc", 6.79151, 2, 35.7162, 94, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_sitting_chair")
	pNpc = createTemplatedRoleplayNPC("special/merc", 9.47762, 2, 41.9247, 222, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_sitting_chair")
	pNpc = createTemplatedRoleplayNPC("special/merc", 7.28536, 2, 41.9171, 135, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("npc_sitting_chair")

	pNpc = createTemplatedRoleplayNPC("special/merc", -0.682149, 3, 22.5, 1, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("conversation")
	pNpc = createTemplatedRoleplayNPC("special/merc", -0.665684, 3, 24.0124, 179, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("conversation")
	pNpc = createTemplatedRoleplayNPC("special/merc", -4.38356, 2, 49.7332, 265, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("conversation")
	pNpc = createTemplatedRoleplayNPC("special/merc", -25.5659, 3, 56.7949, 259, 610009477, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("conversation")

	pNpc = createTemplatedRoleplayNPC("special/merc", 3.52202, 2, 50.1554, 84, 610009490, "rp_tatooine")
	CreatureObject(pNpc):setMoodString("angry")

	createTemplatedRoleplayNPC("special/merc", 9.50162, 2, 28.9012, 296, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("special/merc", 8.36774, 2, 29.6492, 122, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("special/merc", 9.69359, 2, 22.8248, 327, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("special/merc", 0.2, 3, 29.8187, 266, 610009490, "rp_tatooine")

	--Gamorreans
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -14.5, 6.56522, 81.0883, 92, 610009472, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -7.13332, 0.299998, 139.008, 87, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 7.28731, 0.299998, 139.028, 266, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 7.33841, 0.199997, 143.582, 358, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -6.99606, 0.199998, 144.166, 1, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 7.3, 0.199999, 122.921, 264, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -15.1135, 5.8, 73.9489, 93, 610009472, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -7.2, 0.2, 122.687, 88, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 16.25, -11, 43.3737, 82, 610009505, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -5.07446, 0.199999, 111.5, 4, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 4.60806, 0.199999, 111.919, 353, 610009469, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -0.38214, 0.2, 102.5, 0, 610009470, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -0.388469, 5.8, 98.5, 180, 610009472, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -9.00891, 5.8, 98.5, 178, 610009472, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 10.0977, 5.8, 5.07141, 357, 610009485, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 1.49996, 5.83154, 81.3236, 268, 610009472, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 4.5, 5.8, 70.2606, 88, 610009473, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -12.5, 3, 33.2161, 91, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -22.0544, 3.6, 27.1445, 91, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -3.33918, 3, 10.5, 2, 610009504, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -9.02632, 3, 10.5, 1, 610009504, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -17.7282, 3, 12.013, 42, 610009504, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 4, 3, 12.5877, 271, 610009504, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 4, 3, 17.3132, 270, 610009504, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -24.303, 3.6, 31.1461, 1, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -25.5, 3.6, 47.2469, 93, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -25.5, 3.6, 40.3412, 96, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -4.54185, 2, 53.5, 172, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 41.3845, 0.199999, 18.5, 186, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 32.1919, 0.199997, -18.5, 0, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -42.4388, 0.199997, 82.4804, 90, 610009479, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", 19.8308, 0.199999, 71.0313, 274, 610009481, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -51.3694, 3, 41.5332, 261, 610009484, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/gamorrean", -51.4491, 3, 38.5539, 273, 610009484, "rp_tatooine")

	--Pilots
	createTemplatedRoleplayNPC("faction/hutt/grunt_navy", 33.9677, 0.199999, -11.5554, 318, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/grunt_navy", 33.1299, 0.199999, -10.5938, 141, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/grunt_navy", 20.312, 0.199999, -2.85807, 189, 610009487, "rp_tatooine")

	--Techs
	createTemplatedRoleplayNPC("faction/hutt/tech", 39.1589, 0.199999, -9.71805, 11, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 38.6582, 0.199999, 7.27984, 38, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 38.8943, 0.199999, 6.41074, 166, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 30.807, 0.199998, -0.0578678, 236, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 30.2034, 0.199999, 11.1614, 289, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 19.7737, 0.199999, -4.41359, 20, 610009487, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 14.6376, 0.199998, 4.24214, 348, 610009487, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 24.0675, 0.199999, -10.1236, 169, 610009487, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 8.88194, 0.2, 83.1362, 337, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 27.259, 0.2, 86.3663, 61, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 14.6592, 0.2, 83.4592, 249, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech", 13.433, 0.2, 89.5268, 314, 610009482, "rp_tatooine")

	--Elite Guards
	createTemplatedRoleplayNPC("faction/hutt/elite", 26, 0.199999, 11.1659, 268, 610009475, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", 27.4005, 0.2, 56.7319, 214, 610009475, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", 0.5, 2, 41.9864, 271, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", 0.5, 2, 49.9779, 266, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", 0.5, 2, 34.5, 289, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", 6.1276, 2, 22.5, 333, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", 8.32777, 2, 51.6975, 211, 610009490, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", -34.8143, 2.99411, 58.5, 357, 610009491, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", -32.8808, 3, 74.5, 183, 610009491, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", -2.4182, 0.199998, 80, 358, 610009483, "rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/elite", -22.0578, 0.199998, 80.0078, 87, 610009478, "rp_tatooine")

	--Droids
	createTemplatedRoleplayNPC("droid/r2", -0.712566, 5.91651, 89.6565, 138, 610009472, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/r2", 28.2682, 0.2, 85.8697, 267, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/r2", 7.3, 0.199999, 133.841, 211, 610009469, "rp_tatooine")

	createTemplatedRoleplayNPC("droid/r4", 4.5, 5.8, 64.4831, 108, 610009473, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/r4", 39.3866, 0.199999, -5.72719, 149, 610009502, "rp_tatooine")

	createTemplatedRoleplayNPC("droid/r5", 37.8428, 0.199999, 8.41869, 83, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/r5", 28.9781, 0.199999, -11.356, 23, 610009502, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/r5", 28.5, 0.2, 87.6765, 270, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/r5", 28.5, 0.2, 86.7792, 265, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/r5", -7.01494, 0.199999, 113.235, 223, 610009469, "rp_tatooine")

	createTemplatedRoleplayNPC("droid/protocol_droid", -13.8121, 6.32594, 86.4533, 270, 610009472, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/protocol_droid", 11.2809, 5.8, 61.4556, 267, 610009473, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/protocol_droid", 25.775, 0.2, 81.55, 348, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/protocol_droid", 24.84, 0.2, 81.99, 33, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/protocol_droid", 13.488, 0.2, 83.6426, 188, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/protocol_droid", 8.77834, 0.2, 84.205, 222, 610009482, "rp_tatooine")
	createTemplatedRoleplayNPC("droid/protocol_droid", 7.0222, 0.2, 132.941, 354, 610009469, "rp_tatooine")
end