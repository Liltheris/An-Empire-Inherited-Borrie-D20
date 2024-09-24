local shopListTag = "shop_ship"

rpg_shop_general = {
	manifest = {
		{
			name = "Patrol Fighters",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_z95_deed.iff", cost = 5000, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_kihraxz_a_deed.iff", cost = 6000, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_kihraxz_b_deed.iff", cost = 6000, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Fighters",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_scyk_deed.iff", cost = 8000, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_dunelizard_a_deed.iff", cost = 7500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_dunelizard_b_deed.iff", cost = 7500, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Heavy Fighters",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_rihkxyrk_a_deed.iff", cost = 7500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_rihkxyrk_b_deed.iff", cost = 7500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_kimogila_a_deed.iff", cost = 8500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_kimogila_b_deed.iff", cost = 8500, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Strike Fighters",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_ixiyen_a_deed.iff", cost = 8000, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_ixiyen_b_deed.iff", cost = 8000, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Freighters",
			minItems = 2,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_g9_deed.iff", cost = 12500, max = 10, chance = 100, overridePrice = true},
				{template = "object/tangible/deed/rp_ship_deed/rp_ykl37r_deed.iff", cost = 18000, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_yt1300_deed.iff", cost = 18000, max = 10, chance = 100 , overridePrice = true},
				{template = "object/tangible/deed/rp_ship_deed/rp_yt2400_deed.iff", cost = 20000, max = 10, chance = 100, overridePrice = true },					
			}
		},
		{
			name = "Yachts",
			minItems = 2,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_sorosuub_space_yacht_deed.iff", cost = 100000, max = 10, chance = 100, overridePrice = true },				
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)
