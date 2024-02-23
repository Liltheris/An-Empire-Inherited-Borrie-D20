rp_miraluka_male_random = {
	paired_variables = {
		{"/shared_owner/blend_skinny", "/shared_owner/blend_fat", -255, 255},
		{"/shared_owner/blend_nosedepth_0", "/shared_owner/blend_nosedepth_1", -255, 255},
		{"/shared_owner/blend_noselength_0", "/shared_owner/blend_noselength_1", -255, 255},
		{"/shared_owner/blend_nosewidth_0", "/shared_owner/blend_nosewidth_1", -255, 255},
		{"/shared_owner/blend_cheeks_0", "/shared_owner/blend_cheeks_1", -255, 255},
		{"/shared_owner/blend_jaw_0", "/shared_owner/blend_jaw_1", -255, 255},
		{"/shared_owner/blend_chinsize_0", "/shared_owner/blend_chinsize_1", -255, 255},
		{"/shared_owner/blend_lipwidth_0", "/shared_owner/blend_lipwidth_1", -255, 255},
		{"/shared_owner/blend_lipfullness_0", "/shared_owner/blend_lipfullness_1", -255, 255},
		{"/shared_owner/blend_ears_0", "/shared_owner/blend_ears_1", -255, 255},
	},

	hair = {
		"object/tangible/hair/human/shared_hair_human_male",
		"/private/index_color_1", 0, 19,
		{0,0,0,1,2,3,4,5,6,7,8,10,15,16,17,18,19,22,23,24,25,26,27,28,29,30,31,32,33,34,35,37,38,39,40,41},
	},

	random_variables = {
		--Sliders
		{"/shared_owner/blend_muscle", 0, 255},
		{"/private/index_age", 0, 20},
		--Colours
		{"/shared_owner/index_color_skin", 0, 47},
		{"/private/index_color_2", 0, 31},
		{"/private/index_color_facial_hair", 0, 19},
		--Styles
		{"/private/index_style_eyebrow", 0, 6},
		{"/private/index_style_freckles", 0, 10},
		{"/private/index_style_beard", 0, 17},
	},

	height = {0.94, 1.11},

	match_brows = true,
}