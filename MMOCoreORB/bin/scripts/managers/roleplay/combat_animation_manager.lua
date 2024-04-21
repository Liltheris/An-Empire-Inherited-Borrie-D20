-----------------------------------------------------
-- Animation settings
-----------------------------------------------------

midAnimThreshold = 8
strongAnimThreshold = 16

-----------------------------------------------------
-- Animation sets
-----------------------------------------------------

rp_pistol_anims = {
    basic = {"fire_1_single", "fire_3_single", "fire_5_single"},
    power = {"fire_1_single"},
    flurry = {"fire_7_single"}
}

rp_carbine_anims = {
    basic = {"fire_3_single", "fire_5_single"},
    power = {"fire_1_single"},
    flurry = {"fire_7_single"}
}

rp_rifle_anims = {
    basic = {"fire_1_single", "fire_3_single"},
    power = {"fire_1_single"},
    flurry = {"fire_7_single"}
}

rp_sniper_anims = {
    basic = {"fire_1_single"},
    power = {"fire_1_single"},
    flurry = {"fire_3_single"}
}

rp_shotgun_anims = {
    basic = {"fire_1_single"},
    power = {"fire_1_single"},
    flurry = {"fire_3_single"}
}

rp_repeater_anims = {
    basic = {"fire_7_single"},
    power = {"fire_1_single"},
    flurry = {"fire_7_single"}
}

rp_1h_anims = {
    basic = {
        weak = {"attack_high_left", "attack_high_center", "attack_high_right", "attack_mid_left", "attack_mid_center", "attack_mid_right", "attack_low_left", "attack_low_center", "attack_low_right"},
        mid = {"combo_2a", "combo_2b", "combo_2c", "combo_2d"},
        strong = {"combo_3a" ,"combo_3b", "combo_3c",},
    },
    power = {"combo_3c",},
    flurry = {"combo_3a", "combo_3b", "combo_3c"},
}

rp_2h_anims = {
    basic = {
        weak = {"attack_high_left", "attack_high_center", "attack_high_right", "attack_mid_left", "attack_mid_center", "attack_mid_right", "attack_low_left", "attack_low_center", "attack_low_right"},
        mid = {"combo_2a", "combo_2c", "combo_2d"},
        strong = {"combo_3a", "combo_3b",},
    },
    power = {"combo_4b",},
    flurry = {"combo_3a", "combo_3b"},
}

rp_pole_anims = {
    basic = {
        weak = {"attack_high_left", "attack_high_center", "attack_high_right", "attack_mid_left", "attack_mid_center", "attack_mid_right", "attack_low_left", "attack_low_center", "attack_low_right"},
        mid = {"combo_2a", "combo_2b", "combo_2c", "combo_2d"},
        strong = {"combo_3a", "combo_3c", "combo_3d",},
    },
    power = {"combo_5a",},
    flurry = {"combo_4a", "combo_4b", "combo_5a"},
}

rp_unarmed_anims = {
    basic = {
        weak = {"attack_high_left", "attack_high_center", "attack_high_right", "attack_mid_left", "attack_mid_center", "attack_mid_right", "attack_low_left", "attack_low_center", "attack_low_right"},
        mid = {"combo_2a", "combo_2b", "combo_2d"},
        strong = {"combo_3a", "combo_3b", "combo_3c",},
    },
    power = {"combo_3c",},
    flurry = {"combo_3a", "combo_3b", "combo_3c"},
}