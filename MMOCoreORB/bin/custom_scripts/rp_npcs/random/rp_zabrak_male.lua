rp_zabrak_male_random = {
	paired_variables = {
		{"/shared_owner/blend_skinny", "/shared_owner/blend_fat", -255, 255},
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
		"object/tangible/hair/zabrak/shared_hair_zabrak_male",
		"/private/index_color_1", 0, 19,
		{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},
	},

	random_variables = {
		--Sliders
		{"/shared_owner/blend_muscle", 0, 255},
		{"/private/index_age", 0, 20},
		--Colours
		{"/shared_owner/index_color_skin", 0, 47},
		{"/private/index_color_2", 0, 31},
		{"/private/index_color_facial_hair", 0, 19},
		{"/private/index_color_tattoo", 0, 44},
		--Styles
		{"/private/index_style_freckles", 0, 10},
		{"/private/index_style_beard", 0, 17},
		{"/private/index_style_tattoo", 0, 20},

	},

	height = {0.94, 1.11},

	match_brows = true,
}

rp_zabrak_male_random_military = {
	paired_variables = {
		{"/shared_owner/blend_skinny", "/shared_owner/blend_fat", -120, 0},
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
		"object/tangible/hair/zabrak/shared_hair_zabrak_male",
		"/private/index_color_1", 0, 19,
		{1,2,3,4,5,6,7,8,9,10,12,13,15,16,20},
	},

	random_variables = {
		--Sliders
		{"/shared_owner/blend_muscle", 180, 255},
		{"/private/index_age", 0, 0},
		--Colours
		{"/shared_owner/index_color_skin", 0, 47},
		{"/private/index_color_2", 0, 31},
		{"/private/index_color_facial_hair", 0, 19},
		{"/private/index_color_tattoo", 0, 44},
		--Styles
		{"/private/index_style_freckles", 0, 10},
		{"/private/index_style_beard", 0, 17},
		{"/private/index_style_tattoo", 0, 20},

	},

	height = {1.0, 1.11},

	match_brows = true,
}