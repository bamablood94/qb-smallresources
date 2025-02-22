Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- carwash
Config.RagdollChance = 0.3 -- Decimal Value (Currently 20%)
Config.DirtLevel = 50


ConsumeablesEat = {
    ["sandwich"] = math.random(20, 29),
    ["tosti"] = math.random(15, 25),
    ["twerks_candy"] = math.random(15, 24),
    ["snikkel_candy"] = math.random(10, 30),

    ["burger-bleeder"] = math.random(45, 64),
    ["burger-moneyshot"] = math.random(45, 64),
    ["burger-torpedo"] = math.random(45, 64),
    ["burger-heartstopper"] = math.random(45, 64),
    ["burger-meatfree"] = math.random(45, 64),
    ["burger-fries"] = math.random(45, 64),

    ["food_spagatti"] = math.random(45, 60),
    ["food_lasagna"] = math.random(45, 60),
    ["food_snails"] = math.random(35, 40),
    ["food_pepperoni_pizza"] = math.random(80, 100),
    ["food_meatballs"] = math.random(45, 60),
    ["food_margherita_pizza"] = math.random(80, 100),
    ["food_garlic_bread"] = math.random(10, 20),
    ["food_calzone"] = math.random(70, 80),
    ["food_carbonara"] = math.random(50, 60),

    ["chocolate"] = math.random(30, 40),
    ["friedpick"] = math.random(40, 50),
    ["maccheese"] = math.random(40, 50),
    ["bplate"] = math.random(40, 50),
    ["cplate"] = math.random(40, 50),
    ["splate"] = math.random(40, 50),
    ["rplate"] = math.random(40, 50),
    ["nplate"] = math.random(40, 50),
    ["wings"] = math.random(40, 50),
    ["pickle"] = math.random(40, 50),
    ["nachoes"] = math.random(30, 40),

    --roosters

    ["sushi_platter"] = math.random(60, 80),
    ["exotic_sushi_platter"] = math.random(95, 100),
    ["chicken_ramen"] = math.random(50, 69),
    ["vegan_ramen"] = math.random(40, 50),

    --SIMPLE FARMING
    ["apple"] = math.random(10, 20),
    ["beef"] = math.random(35, 50),
    ["slicedpie"] = math.random(10, 20),
    ["corncob"] = math.random(25, 40),
    ["canofcorn"] = math.random(35, 50),
    ["grapes"] = math.random(10, 20),
    ["greenpepper"] = math.random(10, 20),
    ["chillypepper"] = math.random(10, 20),
    ["tomato"] = math.random(10, 20),
    ["tomatopaste"] = math.random(25, 40),
    ["cooked_bacon"] = math.random(35, 50),
    ["cooked_sausage"] = math.random(35, 50),
    ["cooked_pork"] = math.random(35, 50),
    ["cooked_ham"] = math.random(35, 50),


}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(20, 34),
    ["kurkakola"] = math.random(20, 34),
    ["coffee"] = math.random(20, 30),
    ["burger-softdrink"] = math.random(40, 50),
    ["burger-mshake"] = math.random(40, 50),
    ["cranberry"] = math.random(20, 40),

    --SIMPLE FARMING
    ["apple_juice"] = math.random(25, 45),
    ["grapejuice"] = math.random(25, 45),
    ["hotsauce"] = math.random(10, 15),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),

    ["b52"] = math.random(20, 40),
    ["brussian"] = math.random(20, 40),
    ["bkamikaze"] = math.random(20, 40),
    ["cappucc"] = math.random(20, 40),
    ["ccookie"] = math.random(20, 40),
    ["iflag"] = math.random(20, 40),
    ["kamikaze"] = math.random(20, 40),
    ["sbullet"] = math.random(20, 40),
    ["voodoo"] = math.random(20, 40),
    ["woowoo"] = math.random(20, 40),
    ["schnapps"] = math.random(20, 40),
    ["gin"] = math.random(20, 40),
    ["scotch"] = math.random(20, 40),
    ["rum"] = math.random(20, 40),
    ["icream"] = math.random(20, 40),
    ["amaretto"] = math.random(20, 40),
    ["curaco"] = math.random(20, 40),
    ["beerglass"] = math.random(20, 40),
    ["akashiw"] = math.random(50, 60),
    ["roostersspecial"] = math.random(70, 100),

}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    --AIRCRAFT-
    [`SHAMAL`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`BIFF`] = true,
    [`BLIMP2`] = true,
    [`FROGGER`] = true,
    [`FROGGER2`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`SWIFT`] = true,
    [`CARGOBOB`] = true,
    [`akula`] = true,
    [`cargobob2`] = true,
    [`cargobob3`] = true,
    [`cargobob4`] = true,
    [`frogger2`] = true,
    [`hunter`] = true,
    [`swift2`] = false,
    [`valkyrie`] = true,
    [`valkyrie2`] = true,
    [`cargoplane`] = true,

    --PD/EMS--
    [`POLICE`] = true,
    [`POLICE2`] = true,
    [`POLICE3`] = true,
    [`POLICE4`] = true,
    [`POLICET`] = true,
    [`POLICEB`] = true,
    [`POLMAV`] = true,
    [`SHERIFF`] = true,
    [`SHERIFF2`] = true,
    [`firetruk`] = true,
    --MISC--
    [`RHINO`] = true,

}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
        },

    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            coords = vector3(909.49, -1589.22, 30.51),
            ["AllowVehicle"] = false,
        },
        [2] = {
            coords = vector3(1088.81, -3187.57, -38.99),
            ["AllowVehicle"] = false,
        },
    },
    --Hotel
    [3] = {
        [1] = {
            coords = vector4(380.42, -15.15, 83.0, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(414.73, -15.2, 99.65, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
    },
    --Hotel roof
    [4] = {
        [1] = {
            coords = vector4(417.44, -10.69, 99.65, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'

        },
        [2] = {
            coords = vector4(420.09, -15.66, 152.95, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'

        },
    },
        --Hotel penthouse
    [5] = {
        [1] = {
            coords = vector4(-305.08, -721.09, 28.03, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(-288.3, -722.54, 125.47, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
         --merry weather left
    [6] = {
        [1] = {
            coords = vector4(2504.29, -433.08, 99.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(2504.44, -433.05, 106.91, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    ---------- MERRY RIGHT
    [7] = {
        [1] = {
            coords = vector4(2504.45, -342.11, 94.09, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'

        },
        [2] = {
            coords = vector4(2504.47, -342.06, 101.89, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    [8] = {
        [1] = {
            coords = vector4(2502.02, -340.0, 101.89, 41.73),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'

        },
        [2] = {
            coords = vector4(2502.0, -339.88, 105.69, 142.31),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    [9] = { --roof
        [1] = {
            coords = vector4(2494.93, -347.06, 105.69, 19.45),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'

        },
        [2] = {
            coords = vector4(2511.09, -346.8, 111.69, 78.75),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    [10] = { --armory
        [1] = {
            coords = vector4(2497.47, -349.09, 94.09, 133.63),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'

        },
        [2] = {
            coords = vector4(2504.13, -357.09, 82.29, 221.28),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    [11] = { --prestige elevetor
        [1] = {
            coords = vector4(134.81, -133.81, 54.91, 337.67),
            ["AllowVehicle"] = true,
            drawText = '[E] Take Elevator Up'

        },
        [2] = {
            coords = vector4(134.58, -130.76, 60.57, 154.03),
            ["AllowVehicle"] = true,
            drawText = '[E] Take Elevator Down'
        },
    },
    [12] = { --casino pent
        [1] = {
            coords = vector4(967.35, 7.46, 81.16, 240.68),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'

        },
        [2] = {
            coords = vector4(964.98, 58.57, 112.55, 35.13),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    [13] = {    -- TUNER CAR MEET ENTRANCE/EXIT
        [1] = {
            coords = vector4(774.52, -1867.38, 29.29, 265.35),
            ['AllowVehicle'] = true,
            drawText = '[E] Enter Car Meet'
        },
        [2] = {
            coords = vector4(-2208.67, 1146.0, -23.26, 229.12),
            ['AllowVehicle'] = true,
            drawText = '[E] Leave Car Meet'
        }
    },
    [14] = {    -- TUNER CAR MEET GATED ROOM
        [1] = {
            coords = vector4(-2142.24, 1160.58, -24.37, 188.09),
            ['AllowVehicle'] = false,
            drawText = '[E] Enter Gated Room',
        },
        [2] = {
            coords = vector4(-1984.27, 1245.89, -24.36, 279.68),
            ['AllowVehicle'] = false,
            drawText = '[E] Leave Gated Room'
        }
    },
    [15] = {    -- Plastic Surgery
        [1] = {
            coords = vector4(259.35, -1357.19, 30.55, 318.49),
            ['AllowVehicle'] = false,
            drawText = '[E] Go to Plastic Surgery Room'
        },
        [2] = {
            coords = vector4(251.57, -1366.51, 39.53, 136.46),
            ['AllowVehicle'] = false,
            drawText = '[E] Leave Surgery Room',
        },
    },
    [16] = {    -- Main Floor to Parking Garage EMS Pillbox
        [1] = {
            coords = vector3(330.39, -601.24, 43.28),
            ['AllowVehicle'] = false,
            drawText = '[E] Elevator to Garage',
        },
        [2] = {
            coords = vector3(340.22, -584.62, 28.8),
            ['AllowVehicle'] = false,
            drawText = '[E] Elevator to Main Floor'
        },
    }
}

ConfigSling = {
    Positions = {
        ["Back"] = {
            bone = 24816,
            x = 0.275,
            y = -0.15,
            z = -0.02,
            x_rotation = 0.0,
            y_rotation = 165.0,
            z_rotation = 0.0
        },
        ["Front"] = {
            bone = 10706,
            x = 0.0,
            y = 0.19,
            z = -0.25,
            x_rotation = 0.0,
            y_rotation = 75.0,
            z_rotation = 180.0
        }
    },
    compatable_weapon_hashes = {
        --SMG--
        ["weapon_mac10"] = { model = "w_sb_mac10", hash = GetHashKey("weapon_mac10")},
        ["weapon_uzi"] = { model = "w_sb_uzi", hash = GetHashKey("weapon_uzi")},
        ["weapon_mpx"] = { model = "mpx", hash = GetHashKey("weapon_mpx")},
        ["weapon_pp19"] = { model = "pp19", hash = GetHashKey("weapon_pp19")},
        ["weapon_mp5"] = { model = "w_sb_MP5", hash = GetHashKey("weapon_mp5")},
        ["weapon_mp7"] = { model = "w_sb_mp7", hash = GetHashKey("weapon_mp7")},
        ["weapon_mp9a"] = { model = "w_sb_MP9a", hash = GetHashKey("weapon_mp9a")},
        -- --SHOTGUNS--
        ["weapon_m870"] = { model = "m870", hash = GetHashKey("weapon_m870")},
        -- --RIFLES--
        ["weapon_akm"] = { model = "w_ar_akm", hash = GetHashKey("weapon_akm")},
        ["weapon_rpk16"] = { model = "markomods-rpk16", hash = GetHashKey("weapon_rpk16")},
        --["weapon_mk18"] = { model = "mk18", hash = GetHashKey("weapon_mk18")},
        ["weapon_fbiarb"] = { model = "w_ar_fbiarb", hash = GetHashKey("weapon_fbiarb")},
        ["weapon_hk416b"] = { model = "w_ar_HK416B", hash = GetHashKey("weapon_hk416b")},
        ["weapon_mcxa"] = { model = "w_ar_mcxa", hash = GetHashKey("weapon_mcxa")},
        ["weapon_specialcarbine"] = { model = "w_ar_specialcarbine", hash = GetHashKey('weapon_specialcarbine')},
        ["weapon_marksmanrifle"] = {model = "w_sr_marksmanrifle", hash = GetHashKey('weapon_marksmanrifle')},
        ['weapon_beanbag'] = {model = 'w_sg_beanbag', hash = GetHashKey('weapon_beanbag')},
        ["weapon_huntingrifle"] = { model = "w_sr_HUNTINGRIFLE", hash = GetHashKey("weapon_huntingrifle")},
    }
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}

-- chair sitting --
Config.MaxDistance = 1.5

Config.Interactables = {
	'prop_bench_01a',
	'prop_bench_01b',
	'prop_bench_01c',
	'prop_bench_02',
	'prop_bench_03',
	'prop_bench_04',
	'prop_bench_05',
	'prop_bench_06',
	'prop_bench_05',
	'prop_bench_08',
	'prop_bench_09',
	'prop_bench_10',
	'prop_bench_11',
	'prop_fib_3b_bench',
	'prop_ld_bench01',
	'prop_wait_bench_01',
	'hei_prop_heist_off_chair',
	'hei_prop_hei_skid_chair',
	'prop_chair_01a',
	'prop_chair_01b',
	'prop_chair_02',
	'prop_chair_03',
	'prop_chair_04a',
	'prop_chair_04b',
	'prop_chair_05',
	'prop_chair_06',
	'prop_chair_05',
	'prop_chair_08',
	'prop_chair_09',
	'prop_chair_10',
	'v_club_stagechair',
	'prop_chateau_chair_01',
	'prop_clown_chair',
	'prop_cs_office_chair',
	'prop_direct_chair_01',
	'prop_direct_chair_02',
	'prop_gc_chair02',
	'prop_off_chair_01',
	'prop_off_chair_03',
	'prop_off_chair_04',
	'prop_off_chair_04b',
	'prop_off_chair_04_s',
	'prop_off_chair_05',
	'prop_old_deck_chair',
	'prop_old_wood_chair',
	'prop_rock_chair_01',
	'prop_skid_chair_01',
	'prop_skid_chair_02',
	'prop_skid_chair_03',
	'prop_sol_chair',
	'prop_wheelchair_01',
	'prop_wheelchair_01_s',
	'p_armchair_01_s',
	'p_clb_officechair_s',
	'p_dinechair_01_s',
	'p_ilev_p_easychair_s',
	'p_soloffchair_s',
	'p_yacht_chair_01_s',
	'v_club_officechair',
	'v_corp_bk_chair3',
	'v_corp_cd_chair',
	'v_corp_offchair',
	'v_ilev_chair02_ped',
	'v_ilev_hd_chair',
	'v_ilev_p_easychair',
	'v_ret_gc_chair03',
	'prop_ld_farm_chair01',
	'prop_table_04_chr',
	'prop_table_05_chr',
	'prop_table_06_chr',
	'v_ilev_leath_chr',
	'prop_table_01_chr_a',
	'prop_table_01_chr_b',
	'prop_table_02_chr',
	'prop_table_03b_chr',
	'prop_table_03_chr',
	'prop_torture_ch_01',
	'v_ilev_fh_dineeamesa',
	'v_ilev_fh_kitchenstool',
	'v_ilev_tort_stool',
	'v_ilev_fh_kitchenstool',
	'v_ilev_fh_kitchenstool',
	'v_ilev_fh_kitchenstool',
	'v_ilev_fh_kitchenstool',
	'hei_prop_yah_seat_01',
	'hei_prop_yah_seat_02',
	'hei_prop_yah_seat_03',
	'prop_waiting_seat_01',
	'prop_yacht_seat_01',
	'prop_yacht_seat_02',
	'prop_yacht_seat_03',
	'prop_hobo_seat_01',
	'prop_rub_couch01',
	'miss_rub_couch_01',
	'prop_ld_farm_couch01',
	'prop_ld_farm_couch02',
	'prop_rub_couch02',
	'prop_rub_couch03',
	'prop_rub_couch04',
	'p_lev_sofa_s',
	'p_res_sofa_l_s',
	'p_v_med_p_sofa_s',
	'p_yacht_sofa_01_s',
	'v_ilev_m_sofa',
	'v_res_tre_sofa_s',
	'v_tre_sofa_mess_a_s',
	'v_tre_sofa_mess_b_s',
	'v_tre_sofa_mess_c_s',
	'prop_roller_car_01',
	'prop_roller_car_02',
}

--speed limiter
MPH = true -- Set To False To Enable KM/h

Zones =
{
    {
        x = 303.34,
        y = -585.75,
        z = 43.28,
        UseZ = true,
        distance = 35.0,
        LimitSpeed = 20.0
    },
}

Config.itemDrink = {
    [1] = {
        name = "kurkakola",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
}

Config.itemSnack = {
    [1] = {
        name = "tosti",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    }, -- add the rest of your food here
}

Config.itemCoffee = {
    [1] = {
        name = "coffee",
        price = 7,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
}

Config.itemConstruction = {
    [1] = {
        name = "hd_mixtool",
        price = 3000,
        amount = 50,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = "hd_bt",
        price = 2000,
        amount = 50,
        info = {},
        type = 'item',
        slot = 2,
    },
    [3] = {
        name = 'hd_blowgas',
        price = 50,
        amount = 50,
        info = {},
        type = 'item',
        slot = 3,
    }
}

Config.itemHunting = {
    [1] = {
        name = 'weapon_knife',
        price = 10,
        amount = 50,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = 'weapon_marksmanrifle',
        price = 1000,
        amount = 5,
        info = {},
        type = 'item',
        slot = 2,
    },
    [3] = {
        name = 'huntingbait',
        price = 15,
        amount = 100,
        info = {},
        type = 'item',
        slot = 3,
    }
}
Config.itemMaterials = {
    [1] = {
        name = 'hydrofloricacid',
        price = 1000,
        amount = 100,
        info = {},
        type = 'item',
        slot = 1,
    },
}

--/////////////////////////////////
--OXYRUN
--/////////////////////////////////

Config.StartOxyPayment = 100 -- How much you pay at the start to start the run
Config.RunAmount = math.random(7,15) -- How many drop offs the player does before it automatixally stops.
Config.Payment = math.random(530, 710) -- How much you get paid when RN Jesus doesnt give you oxy, divided by 2 for when it does.
Config.Item = "oxy" -- The item you receive from the oxy run. Should be oxy right??
Config.OxyChance = 300 -- Percentage chance of getting oxy on the run. Multiplied by 100. 10% = 100, 20% = 200, 50% = 500, etc. Default 55%.
Config.OxyAmount = 2 -- How much oxy you get when RN Jesus gives you oxy. Default: 4.
Config.BigRewarditemChance = 10 -- Percentage of getting rare item on oxy run. Multiplied by 100. 0.1% = 1, 1% = 10, 20% = 200, 50% = 500, etc. Default 50%.
Config.BigRewarditem = "usb_red" -- Put a rare item here which will have 50% chance of being given on the run.
Config.OxyCars = "CHECK THE CODE" -- Cars
Config.DropOffs = "CHECK THE CODE" -- Drop off spots

--/////////////////////////////////
--COMPANIONS
--/////////////////////////////////

Config.TrunkClasses = {
    [0]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes
    [1]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sedans
    [2]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --SUVs
    [3]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes
    [4]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Muscle
    [5]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports Classics
    [6]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports
    [7]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Super
    [8]  = { allowed = false, x = 0.0, y = -1.0, z = 0.25 }, --Motorcycles
    [9]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Off-road
    [10] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Industrial
    [11] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Utility
    [12] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Vans
    [13] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Cycles
    [14] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Boats
    [15] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Helicopters
    [16] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Planes
    [17] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Service
    [18] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Emergency
    [19] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Military
    [20] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Commercial
    [21] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Trains
}

Config.Animations = {
    ["a_c_shepherd"] = {
        ["lay"] = {
            animationDict = "creatures@rottweiler@amb@sleep_in_kennel@",
            task = "sleep_in_kennel",
        },
        ["trick"] = {
            animationDict = "creatures@rottweiler@tricks@",
            task = "paw_right_enter",
            taskWait = "2000",
            taskExit = "paw_right_exit",
        },
        ["sit"] = {
            animationDict = "creatures@rottweiler@amb@world_dog_sitting@base",
            task = "base",
        },
        ["intimidate"] = {
            animationDict = "creatures@rottweiler@melee@streamed_taunts@",
            task = "taunt_01",
        }
    },
    ["a_c_cat_01"] = {
        ["lay"] = {
            animationDict = "creatures@cat@amb@world_cat_sleeping_ground@base",
            task = "base",
        },
        ["trick"] = {
            animationDict = "creatures@cat@amb@peyote@enter",
            task = "enter",
        },
        ["sit"] = {
            animationDict = "creatures@cat@player_action@",
            task = "action_a",
        },
        ["intimidate"] = {
            animationDict = "",
            task = "",
        }
    },
    ["a_c_pug"] = {
        ["lay"] = {
            animationDict = "",
            task = "",
        },
        ["trick"] = {
            animationDict = "",
            task = "",
        },
        ["sit"] = {
            animationDict = "creatures@pug@amb@world_dog_sitting@base",
            task = "base",
        },
        ["intimidate"] = {
            animationDict = "creatures@pug@amb@world_dog_barking@base",
            task = "base",
        }
    },
    ["a_c_retriever"] = {
        ["lay"] = {
            animationDict = "creatures@retriever@amb@world_dog_sitting@idle_a",
            task = "idle_c",
        },
        ["trick"] = {
            animationDict = "",
            task = "",
        },
        ["sit"] = {
            animationDict = "creatures@retriever@amb@world_dog_sitting@idle_a",
            task = "idle_a",
        },
        ["intimidate"] = {
            animationDict = "creatures@retriever@amb@world_dog_barking@base",
            task = "base",
        }
    },
    ["a_c_rat"] = {
        ["lay"] = {
            animationDict = "",
            task = "",
        },
        ["trick"] = {
            animationDict = "creatures@rat@amb@world_rats_eating@idle_a",
            task = "idle_a",
        },
        ["sit"] = {
            animationDict = "",
            task = "",
        },
        ["intimidate"] = {
            animationDict = "",
            task = "",
        }
    },
    ["a_c_mtlion"] = {
        ["lay"] = {
            animationDict = "",
            task = "",
        },
        ["trick"] = {
            animationDict = "",
            task = "",
        },
        ["sit"] = {
            animationDict = "",
            task = "",
        },
        ["intimidate"] = {
            animationDict = "",
            task = "",
        }
    },
    ["a_c_rottweiler"] = {
        ["lay"] = {
            animationDict = "creatures@rottweiler@amb@sleep_in_kennel@",
            task = "sleep_in_kennel",
        },
        ["trick"] = {
            animationDict = "creatures@rottweiler@tricks@",
            task = "beg_enter",
            taskWait = "600",
            taskExit = "beg_exit",
        },
        ["sit"] = {
            animationDict = "creatures@rottweiler@amb@world_dog_sitting@base",
            task = "base",
        },
        ["intimidate"] = {
            animationDict = "creatures@rottweiler@melee@streamed_taunts@",
            task = "taunt_01",
        }
    },
    ["a_c_westy"] = {
        ["lay"] = {
            animationDict = "",
            task = "",
        },
        ["trick"] = {
            animationDict = "",
            task = "",
        },
        ["sit"] = {
            animationDict = "",
            task = "",
        },
        ["intimidate"] = {
            animationDict = "",
            task = "",
        }
    },
    ["a_c_poodle"] = {
        ["lay"] = {
            animationDict = "",
            task = "",
        },
        ["trick"] = {
            animationDict = "",
            task = "",
        },
        ["sit"] = {
            animationDict = "",
            task = "",
        },
        ["intimidate"] = {
            animationDict = "",
            task = "",
        }
    },
    ["a_c_rabbit_01"] = {
        ["lay"] = {
            animationDict = "creatures@rabbit@player_action@",
            task = "action_a",
        },
        ["trick"] = {
            animationDict = "creatures@rabbit@amb@world_rabbit_eating@idle_a",
            task = "idle_c",
        },
        ["sit"] = {
            animationDict = "creatures@rabbit@amb@world_rabbit_eating@idle_a",
            task = "idle_b",
        },
        ["intimidate"] = {
            animationDict = "creatures@rabbit@amb@world_rabbit_eating@idle_a",
            task = "idle_a",
        }
    },
    ["a_c_hen"] = {
        ["lay"] = {
            animationDict = "creatures@hen@amb@world_hen_standing@idle_a",
            task = "idle_a",
        },
        ["trick"] = {
            animationDict = "creatures@hen@amb@world_hen_pecking@base",
            task = "base",
        },
        ["sit"] = {
            animationDict = "creatures@hen@amb@world_hen_pecking@idle_a",
            task = "idle_c",
        },
        ["intimidate"] = {
            animationDict = "creatures@hen@player_action@",
            task = "action_a",
        }
    },
    ["a_c_husky"] = {
        ["lay"] = {
            animationDict = "",
            task = "",
        },
        ["trick"] = {
            animationDict = "",
            task = "",
        },
        ["sit"] = {
            animationDict = "",
            task = "",
        },
        ["intimidate"] = {
            animationDict = "",
            task = "",
        }
    },
}

--/////////////////////////////////
--ROBPARKING
--/////////////////////////////////

Config.MoneyMin = 100
Config.MoneyMax = 550

--/////////////////////////////////
--ROLLERBLADING
--/////////////////////////////////

Config.SkateMaxSpeedKmh = 190
Config.SkateMaxJumpHeight = 8.0
Config.SkateLoseConnectionDistance = 100.0

--/////////////////////////////////
--ROLLERBLADING
--/////////////////////////////////
RollerConfig = {
    MaxSpeedKmh = 20,
	MaxSpeedSprintKmh = 25,
    maxJumpHeigh = 5.0,
    LoseConnectionDistance = 50.0,
	RollerSlotHomme = 7,
	RollerSlotFemme = 3,
	RollerColorHomme = 2,
	RollerColorFemme = 2,
}