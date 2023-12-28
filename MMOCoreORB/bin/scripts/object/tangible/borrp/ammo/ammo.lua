--Bullets
object_tangible_borrp_ammo_ammo_kinetic = object_tangible_borrp_ammo_shared_ammo_kinetic:new {
	useCount = 10,
	
}

--Missiles
object_tangible_borrp_ammo_ammo_missile = object_tangible_borrp_ammo_shared_ammo_missile:new {
	useCount = 10,
	
}

--Small power packs
object_tangible_borrp_ammo_ammo_powerpack_small = object_tangible_borrp_ammo_shared_ammo_powerpack_small:new {
	useCount = 10,
	
}

--Medium power packs
object_tangible_borrp_ammo_ammo_powerpack_medium = object_tangible_borrp_ammo_shared_ammo_powerpack_medium:new {
	useCount = 10,
	
}

-- Large power packs
object_tangible_borrp_ammo_ammo_powerpack_large = object_tangible_borrp_ammo_shared_ammo_powerpack_large:new {
	useCount = 10,
	
}


ObjectTemplates:addTemplate(object_tangible_borrp_ammo_ammo_kinetic, "object/tangible/borrp/ammo/ammo_kinetic.iff")
ObjectTemplates:addTemplate(object_tangible_borrp_ammo_ammo_missile, "object/tangible/borrp/ammo/ammo_missile.iff")
ObjectTemplates:addTemplate(object_tangible_borrp_ammo_ammo_powerpack_small, "object/tangible/borrp/ammo/ammo_powerpack_small.iff")
ObjectTemplates:addTemplate(object_tangible_borrp_ammo_ammo_powerpack_medium, "object/tangible/borrp/ammo/ammo_powerpack_medium.iff")
ObjectTemplates:addTemplate(object_tangible_borrp_ammo_ammo_powerpack_large, "object/tangible/borrp/ammo/ammo_powerpack_large.iff")