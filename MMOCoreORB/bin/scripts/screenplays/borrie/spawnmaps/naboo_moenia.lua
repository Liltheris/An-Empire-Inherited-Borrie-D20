NabooMoeniaScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "NabooMoeniaScreenPlay",

	planet = "rp_naboo",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("NabooMoeniaScreenPlay",  true)

function NabooMoeniaScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function NabooMoeniaScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function NabooMoeniaScreenPlay:spawnCivilians() 
	local waypointList = {
		{4898.37, 3.75, -4965.56, 328, 0,{"sit"}},
		{4897.22, 3.75, -4965.71, 30, 0,{"sit"}},
		{4880.02, 3.75, -4956.02, 103, 0,{"none"}},
		{4882.06, 3.75, -4956.24, 258, 0,{"social"}},
		{4779.71, 3.75, -4971.66, 50, 0,{"tech"}},
		{4769.99, 3.75, -4974.62, 15, 0,{"none"}},
		{4686.24, 4.74902, -4891.6, 320, 0,{"social"}},
		{4685.68, 4.75098, -4890.2, 166, 0,{"none"}},
		{4707.54, 3.75, -4891.94, 97, 0,{"none"}},
		{4718.76, 3.85059, -4865.83, 343, 0,{"none"}},
		{4764.18, 6.13477, -4793.84, 345, 0,{"none"}},
		{4913.56, 3.75, -4888.8, 342, 0,{"sit"}},
		{4911.84, 3.75, -4888.43, 14, 0,{"sit"}},
		{4944.46, 4.25, -4834.18, 192, 0,{"sit"}},
		{4856.13, 3.75, -4798.52, 49, 0,{"none"}},
		{4792.7, 3.75, -4825.44, 228, 0,{"none"}},
		{4791.49, 3.75, -4826.47, 38, 0,{"social"}},
		{4751.13, 3.75, -4893.79, 340, 0,{"social"}},
		{4751.19, 3.75, -4891.64, 203, 0,{"social"}},
		{4749.93, 3.75, -4892.64, 94, 0,{"social"}},
		{4745.14, 3.75, -4890.04, 3, 0,{"none"}},
		{4744.57, 3.75, -4888.8, 133, 0,{"none"}},
		{4746.94, 3.75, -4876.89, 224, 0,{"sit"}},
		{4742.05, 3.88867, -4909.79, 122, 0,{"none"}},
		{4738.35, 3.75, -4938.79, 224, 0,{"sit"}},
		{4737.02, 3.75, -4938.89, 129, 0,{"sit"}},
		{4729.78, 3.75, -4934.36, 161, 0,{"none"}},
		{4730.12, 3.75, -4935.35, 328, 0,{"none"}},
		{4735.52, 3.75, -4951.63, 108, 0,{"none"}},
		{4736.93, 3.75, -4953.17, 334, 0,{"social"}},
		{4737.83, 3.75, -4951.65, 250, 0,{"social"}},
		{4748.36, 3.75, -4953.47, 108, 0,{"social"}},
		{4750.79, 3.75, -4954.98, 290, 0,{"none"}},
		{4746.51, 3.75, -4946.94, 260, 0,{"none"}},
		{4745.23, 3.75, -4947.74, 52, 0,{"none"}},
		{4745.14, 3.75, -4946.44, 127, 0,{"social"}},
		{4771.5, 3.75, -4948.36, 355, 0,{"none"}},
		{4769.98, 3.75, -4947.16, 16, 0,{"none"}},
		{4879.94, 3.75, -4893.34, 155, 0,{"none"}},
		{4880.93, 3.75, -4894.52, 311, 0,{"social"}},
		{4919.56, 3.75, -4903.53, 0, 0,{"sitchair"}},
		{4919, 3.75, -4901.53, 154, 0,{"social"}},
		{4953.92, 3.75, -4867.15, 141, 0,{"social"}},
		{4954.83, 3.75, -4868.98, 340, 0,{"none"}},
		{4964.86, 3.75, -4929.98, 178, 0,{"none"}},
		{4965.04, 3.75, -4931.93, 348, 0,{"none"}},
		{4951.6, 4.34863, -4932.5, 81, 0,{"sit"}},
		{4951.87, 4.34863, -4933.36, 44, 0,{"sit"}},
		{4950.3, 3.75, -4962.26, 0, 0,{"sitchair"}},
		{4928.72, 3.75, -4954.91, 216, 0,{"none"}},
		{4927.21, 3.75, -4955.83, 59, 0,{"social"}},
		{4838.21, 3.78711, -4941.22, 150, 0,{"none"}},
		{4829.6, 3.78906, -4942.76, 348, 0,{"none"}},
		{4805.79, 3.79492, -4936.94, 85, 0,{"none"}},
		{4824.92, 3.75, -4828.07, 168, 0,{"none"}},
		{4826.02, 3.75, -4828.92, 263, 0,{"none"}},
		{4800.74, 3.75, -4810, 218, 0,{"sit"}},
		{4799.38, 3.75, -4809.65, 147, 0,{"sit"}},
		{4799.44, 3.75, -4811.85, 17, 0,{"social"}},
		{4754.19, 3.75, -4847.6, 42, 0,{"social"}},
		{4755.93, 3.75, -4846.19, 251, 0,{"social"}},
		{4835.06, 3.75, -4847.27, 126, 0,{"social"}},
		{4837.09, 3.75, -4848.1, 269, 0,{"none"}},
		{4835.91, 3.75, -4848.78, 349, 0,{"none"}},
		{4870.08, 3.75, -4906.61, 256, 0,{"none"}},
		{4868.09, 3.75, -4906.79, 84, 0,{"none"}},
		{4855.33, 3.75, -4895, 309, 0,{"none"}},
		{4854.21, 3.75, -4895.16, 346, 0,{"sit"}},
		{4841.06, 3.75, -4920.95, 49, 0,{"none"}},
		{4841.49, 3.75, -4919.42, 175, 0,{"social"}},
		{4851.67, 3.75, -4938.76, 120, 0,{"social"}},
		{4853.84, 3.75, -4940.1, 236, 0,{"none"}},
		{4852.17, 3.75, -4940.96, 47, 0,{"none"}},
		{4854.23, 3.75, -4979.47, 194, 0,{"none"}},
		{4816.22, 4.0498, -4971.21, 358, 0,{"sit"}},
		{4807.96, 3.75, -4964.45, 133, 0,{"none"}},
		{4808.73, 3.75, -4965.68, 324, 0,{"social"}},
		{2.70719, 0.999959, 24.7394, 103, 1717467,{"social"}},
		{4.14027, 0.999959, 23.4878, 20, 1717467,{"none"}},
		{4.67479, 0.999959, 24.4911, 216, 1717467,{"none"}},
		{-2.64122, 0.999926, 11.6096, 129, 1717469,{"none"}},
		{-21.8728, 1.6, 7.41638, 310, 1717471,{"social"}},
		{-23.6114, 1.59658, 8.87799, 129, 1717471,{"none"}},
		{-22.1412, 1.59802, 10.7703, 124, 1717471,{"none"}},
		{-13.2887, 1.00046, -0.05864, 91, 1717471,{"tech"}},
		{-14.9865, 1.00068, 3.35676, 318, 1717471,{"none"}},
		{-17.0541, 1.00095, 5.23682, 127, 1717471,{"social"}},
		{5.16061, 1, -1.37365, 276, 1717469,{"none"}},
		{22.1416, 1.28309, 5.93696, 272, 1717470,{"sitchair"}},
		{17.0573, 1.28309, 1.63889, 62, 1717470,{"sitchair"}},
		{22.0884, 1.28309, 1.41982, 265, 1717470,{"sitchair"}},
		{22.0968, 1.28309, 2.18551, 243, 1717470,{"sitchair"}},
		{20.0423, 1.28309, 1.51556, 64, 1717470,{"social"}},
		{4696.91, 3.75, -4875.67, 71, 0,{"sit"}},
		{4738.31, 3.75, -4845.02, 50, 0,{"social"}},
		{4739.71, 3.75, -4844.66, 272, 0,{"none"}},
		{4738.63, 3.75, -4843.8, 158, 0,{"none"}},
		{4672.53, 4.46804, -4823.72, 229, 0,{"none"}},
		{4672.76, 4.32921, -4824.32, 243, 0,{"none"}},
		{4704.82, 3.75, -4829.79, 34, 0,{"sit"}},
		{4705.5, 3.75, -4948.76, 24, 0,{"none"}},
		{4706.36, 3.75, -4948.21, 250, 0,{"social"}},
		{4710.02, 3.75, -4932.83, 204, 0,{"social"}},
		{4708.94, 3.75, -4933.58, 77, 0,{"social"}},
		{4709.68, 3.75, -4934.58, 2, 0,{"social"}},
		{4710.65, 3.75, -4934.07, 290, 0,{"social"}},
		{4856.22, 3.75, -4858.5, 136, 0,{"social"}},
		{4857.36, 3.75, -4859.62, 308, 0,{"none"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_naboo", waypointList, self.walkpointList, "humanocentric", "naboo_moenia")
end

function NabooMoeniaScreenPlay:spawnSceneObjects()
	local sObj
	--Travel Terminals
	
	--Signs
	
	--TAILOR--

end

function NabooMoeniaScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	local pNpc

	createTemplatedRoleplayNPC("planet/naboo/borhek_scout", 5027, 3.75, -4905.7, 223, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_scout", 5025.84, 3.75, -4905.68, 101, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_scout", 4987.19, 3.75, -4954.83, 170, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_scout", 4987.29, 3.75, -4956.65, 0, 0, "rp_naboo")

	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 5012.29, 3.75, -4921.42, 268, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 5012.25, 3.75, -4931.3, 269, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 5000.05, 3.75, -4955.67, 232, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 5000.43, 3.75, -4957.07, 323, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 4983.7, 3.75, -4972.32, 274, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 4989.51, 3.75, -4919.26, 104, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 5049.43, 3.75, -4898.82, 89, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 5049.78, 3.75, -4894.43, 98, 0, "rp_naboo")
	createTemplatedRoleplayNPC("planet/naboo/borhek_goon", 5026.47, 3.75, -4907.04, 0, 0, "rp_naboo")

	createTemplatedRoleplayNPC("planet/naboo/borhek_enforcer", 4998.81, 3.75, -4955.97, 91, 0, "rp_naboo")

end