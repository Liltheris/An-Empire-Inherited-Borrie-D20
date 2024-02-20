rp_twilek_female_random = {
	paired_variables = {
		{"/shared_owner/blend_skinny", "/shared_owner/blend_fat", -255, 30},
		{"/shared_owner/blend_nosedepth_0", "/shared_owner/blend_nosedepth_1", -255, 255},
		{"/shared_owner/blend_noselength_0", "/shared_owner/blend_noselength_1", -255, 255},
		{"/shared_owner/blend_nosewidth_0", "/shared_owner/blend_nosewidth_1", -255, 255},
		{"/shared_owner/blend_eyesize_0", "/shared_owner/blend_eyesize_1", -255, 255},
		{"/shared_owner/blend_eyedirection_0", "/shared_owner/blend_eyedirection_1", -255, 255},
		{"/shared_owner/blend_eyeshape_0", "/shared_owner/blend_eyeshape_1", -255, 255},
		{"/shared_owner/blend_cheeks_0", "/shared_owner/blend_cheeks_1", -255, 255},
		{"/shared_owner/blend_jaw_0", "/shared_owner/blend_jaw_1", -255, 255},
		{"/shared_owner/blend_chinsize_0", "/shared_owner/blend_chinsize_1", -255, 255},
		{"/shared_owner/blend_lipwidth_0", "/shared_owner/blend_lipwidth_1", -255, 255},
		{"/shared_owner/blend_lipfullness_0", "/shared_owner/blend_lipfullness_1", -255, 255},
		{"/shared_owner/blend_ears_0", "/shared_owner/blend_ears_1", -255, 255},
	},

	hair = {
		"object/tangible/hair/twilek/shared_hair_twilek_female",
		"/private/index_color_1", 0, 39,
		{1,2,3,4,5,6,7,8},
	},

	random_variables = {
		--Sliders
		{"/shared_owner/blend_muscle", 0, 255},
		{"/shared_owner/blend_flat_chest", 0, 255},
		{"/private/index_age", 0, 20},
		--Colours
		{"/shared_owner/index_color_skin", 0, 47},
		{"/private/index_color_2", 0, 32},
		{"/private/index_color_facial_hair", 0, 19},
		{"/private/index_color_eyeshadow", 0, 255},
		{"/private/index_color_lips", 0, 255},
		{"/shared_owner/index_color_pattern", 0,47},
		--Styles
		{"/private/index_style_eyebrow", 0, 8},
		{"/private/index_style_freckles", 0, 10},
		{"/private/index_style_eyeshadow", 0, 3},
		{"/shared_owner/index_texture_1", 0,20},

	},

	height = {0.88, 1.06},

	random_lips = true,
	match_brows = true,
}
