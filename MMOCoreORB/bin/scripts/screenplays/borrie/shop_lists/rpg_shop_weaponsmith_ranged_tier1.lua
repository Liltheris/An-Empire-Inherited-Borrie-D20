local shopListTag = "shop_weaponsmith_ranged_tier1"

shop_weapons_ranged = {
	manifest = {
		{
			name = "Pistols",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/pistol/striker_projectile_pistol.iff", cost = 350, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/d18_pistol.iff", cost = 400, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/pistol_rk3.iff", cost = 400, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/dl44_blaster_pistol.iff", cost = 450, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/dl44_metal_blaster_pistol.iff", cost = 900, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/power_5_heavy_blaster_pistol.iff", cost = 900, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/model_q2_holdout_blaster_pistol.iff", cost = 900, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/se14_blaster_pistol.iff", cost = 900, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/fwg5_flechette_smart_pistol.iff", cost = 900, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/pistol/pistol_s5.iff", cost = 600, max = 10, chance = 100 },
			}
		},
		{
			name = "Carbines",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/carbine/ee3_carbine.iff", cost = 600, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/carbine/laser_carbine.iff", cost = 700, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/carbine/advanced_laser_carbine.iff", cost = 700, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/carbine/advanced_elite_carbine.iff", cost = 1500, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/carbine/corestrike_rancor_carbine.iff", cost = 1500, max = 10, chance = 100 },
			}
		},
		{
			name = "Scatterguns",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/pistol/scatter_pistol.iff", cost = 900, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/rifle/dp23_rifle.iff", cost = 1800, max = 10, chance = 100 },
			}
		},
		{
			name = "Rifles",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/rifle/bowcaster.iff", cost = 300, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/rifle/sg82b_stun_rifle.iff", cost = 700, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/rifle/laser_rifle.iff", cost = 1800, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/rifle/ion_rifle.iff", cost = 2000, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/rifle/tusken_rifle.iff", cost = 2000, max = 10, chance = 100 },
				--{template = "object/weapon/roleplay/ranged/rifle/t21_light_repeating_rifle.iff", cost = 2000, max = 10, chance = 100 },
			}
		},
		{
			name = "Sniper Rifles",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/rifle/tusken_elite_rifle.iff", cost = 400, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/rifle/cm_sniper_rifle.iff", cost = 2000, max = 10, chance = 100 },
				{template = "object/weapon/roleplay/ranged/rifle/valken38x_sniper_rifle.iff", max = 10, chance = 100},
				{template = "object/weapon/roleplay/ranged/rifle/dlt20a_heavy_blaster_rifle.iff", cost = 400, max = 10, chance = 100 },
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
			name = "Ammunition",
			minItems = 1,
			items = {
				{template = "object/tangible/borrp/ammo/ammo_powerpack_small.iff", cost = 15, max = 10, chance = 100, overridePrice = true},
				{template = "object/tangible/borrp/ammo/ammo_powerpack_medium.iff", cost = 25, max = 10, chance = 100, overridePrice = true},
				{template = "object/tangible/borrp/ammo/ammo_powerpack_large.iff", cost = 50, max = 5, chance = 100, overridePrice = true},
				{template = "object/tangible/borrp/ammo/ammo_kinetic.iff", cost = 20, max = 5, chance = 100, overridePrice = true,},
			}



		},


		
	}	
}

RPGVendorShopLists:addShopList(shopListTag, shop_weapons_ranged)