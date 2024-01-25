local shopListTag = "shop_mando"

rpg_shop_general = {
	manifest = {
		{
			name = "Blasters",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/pistol/westar35_blaster_pistol.iff", cost = 1400, max = 2, chance = 100, overridePrice = false },
				{template = "object/weapon/roleplay/ranged/pistol/model_q2_holdout_blaster_pistol.iff", cost = 400, max = 2, chance = 100, overridePrice = false },
				{template = "object/weapon/roleplay/ranged/carbine/advanced_elite_carbine.iff", cost = 400, max = 2, chance = 100, overridePrice = false },
				{template = "object/weapon/roleplay/ranged/carbine/ee3_carbine.iff", cost = 400, max = 2, chance = 100, overridePrice = false },
				{template = "object/weapon/roleplay/ranged/rifle/dlt20a_heavy_blaster_rifle.iff", cost = 1800, max = 2, chance = 100, overridePrice = false },
				{template = "object/weapon/roleplay/ranged/rifle/czerka_adventurer.iff", cost = 400, max = 2, chance = 100, overridePrice = false },
				{template = "object/weapon/roleplay/ranged/rifle/dp23_rifle.iff", cost = 1800, max = 10, chance = 100 },

			}
		},
		
		{
			name = "Jetpacks",
			minItems = 1,
			items = {
				{customName = "Mandalorian Jetpack",template = "object/tangible/wearables/backpack/backpack_jetpack_s01.iff", cost = 1500, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Ammunition",
			minItems = 1,
			items = {
				{template = "object/tangible/borrp/ammo/ammo_powerpack_small.iff", cost = 15, max = 10, chance = 100, overridePrice = true},
				{template = "object/tangible/borrp/ammo/ammo_powerpack_medium.iff", cost = 25, max = 10, chance = 100, overridePrice = true},
				{template = "object/tangible/borrp/ammo/ammo_powerpack_large.iff", cost = 50, max = 5, chance = 100, overridePrice = true},
				{template = "object/tangible/borrp/ammo/ammo_kinetic.iff", cost = 20, max = 5, chance = 100, overridePrice = true},
			}

		},
		{
			name = "Grenades",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/thrown/grenade/fragmentation_grenade.iff", cost = 600, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/thrown/grenade/glop_grenade.iff", cost = 700, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/thrown/grenade/cryoban_grenade.iff", cost = 1500, max = 10, chance = 100 },
			}
		},
		{
			name = "Medicine",
			minItems = 1,
			items = {
				{template = "object/tangible/medicine/roleplay/rp_stimpack_a.iff", cost = 75, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/medicine/roleplay/rp_stimpack_b.iff", cost = 125, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/medicine/roleplay/rp_stimpack_c.iff", cost = 250, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/medicine/roleplay/rp_stimpack_d.iff", cost = 500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/medicine/roleplay/rp_stimpack_e.iff", cost = 1000, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Utility Items",
			minItems = 1,
			requiesSaberTraining = false,
			items = {
				{template = "object/tangible/borrp/item/campfire_kit.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/computer_spike.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/hydrospanner.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/prybar.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/security_spike.iff", cost = 250, max = 10, chance = 100 }, 
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)
