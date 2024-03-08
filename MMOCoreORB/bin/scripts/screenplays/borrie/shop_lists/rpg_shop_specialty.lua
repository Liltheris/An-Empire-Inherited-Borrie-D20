local shopListTag = "shop_specialty"

rpg_shop_general = {
	manifest = {
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

		{
			name = "Droids",
			minItems = 1,
			items = {		
				{template = "object/tangible/deed/rp_pet_deed/deed_r2.iff", cost = 2500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_r3.iff", cost = 2500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_r4.iff", cost = 2500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_r5.iff", cost = 2500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_protocol_droid.iff", cost = 3000, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_binary_load_lifter.iff", cost = 3500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_mse.iff", cost = 1000, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_power.iff", cost = 1500, max = 10, chance = 100, overridePrice = true },
			}
		},

		{
			name = "Scrap",
			minItems = 1,
			items = {		
				{template = "object/tangible/borrp/crafting/scrap_metal.iff", cost = 50, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/borrp/crafting/scrap_electronics.iff", cost = 50, max = 10, chance = 100, overridePrice = true },
		},
	},
	{
		name = "Toolkits",
		minItems = 1,
		items = {
			{template = "object/tangible/crafting/station/weapon_tool.iff", cost = 350, max = 10, chance = 100 },
		}
	},

}
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)


