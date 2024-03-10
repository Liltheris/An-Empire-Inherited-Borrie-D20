local shopListTag = "shop_junkdealer"

rpg_shop_general = {
	manifest = {
		{
			name = "Utility Items",
			minItems = 1,
			items = {		
				{template = "object/tangible/borrp/item/tripwire.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/fifty_foot_rope.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/droid_caller.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/adhesive.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/restraining_bolt.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/sensor_pack.iff", cost = 250, max = 10, chance = 100 },
			}
		},
		
		{
			name = "Droids",
			minItems = 1,
			items = {		
				{template = "object/tangible/deed/rp_pet_deed/deed_r4.iff", cost = 2500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_r5.iff", cost = 2500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_pet_deed/deed_protocol_droid.iff", cost = 3000, max = 10, chance = 100, overridePrice = true },
			}
		},
		
		{
			name = "Toolkits",
			minItems = 1,
			items = {
				{template = "object/tangible/crafting/station/weapon_tool.iff", cost = 350, max = 10, chance = 100 },
			}
		},

		{
			name = "Scrap",
			minItems = 1,
			items = {		
				{template = "object/tangible/borrp/crafting/scrap_metal.iff", cost = 50, max = 10, chance = 100, overridePrice = true },
				{customName = "Scrap Metal x10", content="scrap/scrap_metal_x10", template = "object/tangible/item/roleplay/loot_box_s01.iff", cost = 500, max = 10, chance = 100 , overridePrice = true},
				{template = "object/tangible/borrp/crafting/scrap_electronics.iff", cost = 50, max = 10, chance = 100, overridePrice = true },
				{customName = "Scrap Electronics x10", content="scrap/scrap_electronics_x10", template = "object/tangible/item/roleplay/loot_box_s01.iff", cost = 500, max = 10, chance = 100 , overridePrice = true},
		},
	}

	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)


