object_building_ship_rp_g9 = object_building_ship_rp_shared_g9:new {
	entrancePoint = {0,0},
	entranceCell = 2,

	childObjects = {
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -3.15717, z = 3.62095, y = -1.28922, cellid = 2, ow = -4.37114e-08, ox = 0, oy = 1, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_navicomputer.iff", x = -0.0398465, z = 6.83227, y = 7.35068, cellid = 1, ow = -4.37114e-08, ox = 0, oy = 1, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_ship_exit.iff", x = -0.797393, z = 3.92095, y = -1.18144, cellid = 2, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, containmentType = -1},
	},
}
ObjectTemplates:addTemplate(object_building_ship_rp_g9, "object/building/ship_rp/g9.iff")
