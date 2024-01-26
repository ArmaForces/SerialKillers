class CfgSerialKillers
{
    class Equipment_Presets
    {
        class Vanilla
        {
            class Common
            {
                class Equipment
                {
                    class Binocular {};
                    class FirstAidKit {};
                    class ItemMap {};
                    class ItemGPS {};
                    class ItemCompass {};
                    class ItemWatch {};
                    class ItemRadio {};
                };
            };
            class Killers
            {
                class Equipment
                {
                    /* Primary */
                    // F2000
                    class arifle_Mk20_F
                    {
                        availableOnStart = 0;
                        availableInStash = 1;
                    };
                    // F2000 EGLM
                    class arifle_Mk20_GL_F: arifle_Mk20_F {};
                    // KH2002 Sama
                    class arifle_Katiba_F
                    {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    // Negev NG7
                    class LMG_Zafir_F
                    {
                        availableOnStart = 0;
                        availableInStash = 1;
                    };
                    // GM6 Lynx
                    class srifle_GM6_F: LMG_Zafir_F {};

                    /* Pistols */
                    // MP-443 Grach
                    class hgun_Rook40_F
                    {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    // Makarowa PM
                    class hgun_Pistol_01_F: hgun_Rook40_F {};

                    /* Launchers */
                    // Metis-M
                    class launch_O_Vorona_green_F
                    {
                        availableOnStart = 0;
                        availableInStash = 1;
                    };
                    // Titan Launcher
                    class launch_B_Titan_olive_F: launch_O_Vorona_green_F {};
                    // Titan MPRL Compact
                    class launch_I_Titan_short_F: launch_O_Vorona_green_F {};
                    // MAAWS Mk4 Mod 0
                    class launch_MRAWS_green_rail_F: launch_O_Vorona_green_F {};
                    // NLAW
                    class launch_NLAW_F
                    {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };

                    /* Explosives and equipment */
                    class DemoCharge_Remote_Mag
                    {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    class IEDUrbanSmall_Remote_Mag: DemoCharge_Remote_Mag {};
                    class ClaymoreDirectionalMine_Remote_Mag: DemoCharge_Remote_Mag {};
                    class SLAMDirectionalMine_Wire_Mag: DemoCharge_Remote_Mag {};
                };
            };
            class Police
            {
                class Equipment
                {
                    // Custom Covert II
                    class hgun_ACPC2_F
                    {
                        requiredScore = 0;
                    };

                    // FNX-45 Tactical
                    class hgun_Pistol_heavy_01_F{
                        requiredScore = 2;
                    };
                    class acc_flashlight_pistol: hgun_Pistol_heavy_01_F {};
                    class optic_mrd: hgun_Pistol_heavy_01_F {};
                    class optic_mrd_black: optic_mrd {};

                    // Kozlice 12G
                    class sgun_HunterShotgun_01_F
                    {
                        requiredScore = 5;
                    };

                    // P99
                    class hgun_P07_F
                    {
                        requiredScore = 10;
                    };
                    // CPW
                    class hgun_PDW2000_F: hgun_P07_F {};
                    class optic_yorris: hgun_PDW2000_F {};

                    // MP5K
                    class SMG_05_F
                    {
                        requiredScore = 15;
                    };
                    class optic_aco_smg: SMG_05_F {};
                    class optic_aco_grn_smg: optic_aco_smg {};
                    class acc_flashlight: SMG_05_F {};
                    class SmokeShell: SMG_05_F {};
                    class SmokeShellGreen: SmokeShell {};
                    class SmokeShellOrange: SmokeShell {};
                    class SmokeShellBlue: SmokeShell {};
                    class SmokeShellPurple: SmokeShell {};
                    class SmokeShellRed: SmokeShell {};
                    class SmokeShellYellow: SmokeShell {};

                    // Vector SMG
                    class SMG_01_F
                    {
                        requiredScore = 20;
                    };
                    class acc_flashlight_smg_01: SMG_01_F {};

                    // Scorpion Evo 3 A1
                    class SMG_02_F
                    {
                        requiredScore = 25;
                    };

                    // CTAR-21
                    class arifle_TRG20_F
                    {
                        requiredScore = 30;
                    };
                    class optic_aco: arifle_TRG20_F {};
                    class optic_aco_grn: optic_aco {};

                    // TAR-21
                    class arifle_TRG21_F
                    {
                        requiredScore = 35;
                    };
                    class optic_holosight: arifle_TRG21_F {};
                    class optic_holosight_blk_f: optic_holosight {};
                    class optic_holosight_khk_f: optic_holosight {};
                    class optic_holosight_smg: arifle_TRG21_F {};
                    class optic_holosight_smg_blk_f: optic_holosight_smg {};
                    class optic_holosight_smg_khk_f: optic_holosight_smg {};
                    class acc_pointer_ir: arifle_TRG21_F {};
                    class HandGrenade: arifle_TRG21_F {};

                    // P90
                    class SMG_03_TR_black
                    {
                        requiredScore = 35;
                    };

                    // Stoner 99 LMG
                    class LMG_Mk200_F
                    {
                        requiredScore = 40;
                    };
                    // GTAR-21 EGLM
                    class arifle_TRG21_GL_F: LMG_Mk200_F {};

                    // M200 Intervention
                    class srifle_LRR_F: LMG_Mk200_F {};
                    class srifle_LRR_camo_F: srifle_LRR_F {};
                    class srifle_LRR_tna_F: srifle_LRR_F {};
                    class optic_lrps: srifle_LRR_F {};
                    class optic_lrps_tna_f: optic_lrps {};
                    class optic_lrps_ghex_f: optic_lrps {};

                    /* Uniforms */
                    class U_B_GEN_Soldier_F {};
                    class U_B_GEN_Commander_F {};
                    class U_Rangemaster {};
                    class U_Marshal {};
                    class U_BG_Guerilla2_1 {};
                    /* Vests */
                    class V_Rangemaster_belt {};
                    class V_TacVest_blk_POLICE: SMG_05_F {};
                    class V_PlateCarrier2_blk: arifle_TRG21_F {};
                    class V_PlateCarrierSpec_blk: srifle_LRR_F {};
                    /* Backpacks */
                    /* Headgear */
                    class H_Cap_police {};
                    class H_MilCap_blue {};
                    class H_MilCap_gen_F {};
                    class H_Beret_gen_F {};
                    class H_Beret_blk {};
                    class H_HelmetB_light_black: V_PlateCarrier2_blk {};
                    class H_PASGT_basic_blue_F: V_PlateCarrierSpec_blk {};
                };

                class Vehicles {
                    /* Vehicles */
                    class B_GEN_Offroad_01_gen_F {};
                    class B_G_Offroad_01_armed_F
                    {
                        requiredScore = 20;
                    };
                    /* Helicopters */
                    class I_Heli_light_03_unarmed_F
                    {
                        requiredScore = 15;
                    };
                };
            };
        };

        class CUP_RHS
        {
            class Common
            {
                class Equipment
                {
                    class Binocular {};
                    class FirstAidKit {};
                    class ItemMap {};
                    class ItemGPS {};
                    class ItemCompass {};
                    class ItemWatch {};
                    class ItemRadio {};
                    class rds_car_FirstAidKit {};
                    class ACE_microDAGR {};
                    class ACE_DAGR {};
                    class ACE_CableTie {};
                    class ACE_HandFlare_White {};
                };
            };
            class Killers
            {
                class Equipment
                {
                    /* Primary */
                    class CUP_lmg_M60
                    {
                        availableOnStart = 1;
                        availableInStash = 0;
                    };
                    class rhs_weap_pm63
                    {
                        availableOnStart = 1;
                    };
                    class CUP_arifle_G3A3_ris
                    {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    class CUP_optic_SB_11_4x20_PM_od : CUP_arifle_G3A3_ris {};
                    class CUP_muzzle_snds_socom762rc : CUP_arifle_G3A3_ris {};
                    class CUP_smg_p90_black
                    {
                        availableOnStart = 3;
                        availableInStash = 1;
                    };
                    class CUP_arifle_FNFAL5060
                    {
                        availableOnStart = 4;
                        availableInStash = 1;
                    };

                    class rhs_weap_m21a
                    {
                        availableInStash = 1;
                    };
                    class rhs_acc_pkas : rhs_weap_m21a {};
                    class rhs_weap_akm
                    {
                        availableInStash = 1;
                    };
                    class CUP_arifle_M16A2_GL
                    {
                        availableInStash = 1;
                    };

                    class rhs_weap_m249_pip_L
                    {
                        availableInStash = 1;
                    };
                    class rhsusf_acc_eotech_552 : rhs_weap_m249_pip_L {};

                    class CUP_sgun_AA12
                    {
                        availableInStash = 1;
                    };

                    /* Pistols */
                    class CUP_hgun_Deagle
                    {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    class rhs_weap_pp2000_folded
                    {
                        availableOnStart = 3;
                        availableInStash = 1;
                    };
                    class CUP_hgun_BallisticShield_Armed_M9
                    {
                        availableInStash = 1;
                    };
                    class CUP_hgun_MicroUzi
                    {
                        availableInStash = 1;
                    };
                    class CUP_hgun_UZI : CUP_hgun_MicroUzi {};
                    class CUP_hgun_TEC9_FA : CUP_hgun_MicroUzi {};
                    class CUP_hgun_MP7 : CUP_hgun_MicroUzi {};

                    /* Sniper Rifles */
                    class rhs_weap_M107
                    {
                        availableInStash = 1;
                    };
                    class rhsusf_acc_leupoldmk4_2 : rhs_weap_M107 {};
                    class rhsusf_acc_eotech_552 : rhs_weap_M107 {};

                    /* Launchers */
                    class rhs_weap_panzerfaust60
                    {
                        availableOnStart = 4;
                    };
                    class rhs_weap_rpg7
                    {
                        availableOnStart = 1;
                    };
                    class CUP_glaunch_6G30
                    {
                        availableInStash = 1;
                    };
                    class rhs_weap_m32 : CUP_glaunch_6G30 {};
                    class rhs_weap_fgm148 : CUP_glaunch_6G30 {};
                    class rhs_weap_fim92 : CUP_glaunch_6G30 {};
                    class rhs_weap_maaws : CUP_glaunch_6G30 {};
                    class rhs_weap_m80 : CUP_glaunch_6G30 {};
                    class rhs_weap_rshg2 : CUP_glaunch_6G30 {};

                    /* Explosives */
                    class DemoCharge_Remote_Mag
                    {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    class IEDUrbanBig_Remote_Mag : DemoCharge_Remote_Mag {};
                    class IEDUrbanSmall_Remote_Mag: DemoCharge_Remote_Mag {};
                    class ClaymoreDirectionalMine_Remote_Mag: DemoCharge_Remote_Mag {};
                    class SLAMDirectionalMine_Wire_Mag: DemoCharge_Remote_Mag {};

                    /* Grenades */
                    class rhs_mag_m67
                    {
                        availableOnStart = 4;
                    };
                    class rhs_mag_an_m8hc
                    {
                        availableOnStart = 2;
                    };
                    class rhs_mag_an_m14_th3
                    {
                        availableOnStart = 1;
                    };
                    class rhs_mag_rgo
                    {
                        availableOnStart = 3;
                    };
                    class rhs_mag_rdg2_black
                    {
                        availableOnStart = 2;
                    };
                    class rhs_mag_rgn
                    {
                        availableOnStart = 2;
                    };

                    /* Other equipment */
                    class ACRE_SEM52SL
                    {
                        availableOnStart = 4;
                    };
                    class ACE_M26_Clacker
                    {
                        availableOnStart = 1;
                    };
                    class O_UavTerminal
                    {
                        availableOnStart = 1;
                    };
                    class O_UAV_01_backpack_F : O_UavTerminal {};
                    class optic_Holosight_smg_blk_F
                    {
                        availableInStash = 1;
                    };

                    /* Clothing */
                    class rhs_balaclava1_olive
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_tan
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_blk
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_khk
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_beast
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_aviator
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_shades
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_oli
                    {
                        availableOnStart = 1;
                    };
                    class G_Bandanna_sport
                    {
                        availableOnStart = 1;
                    };
                    class None
                    {
                        availableOnStart = 1;
                    };
                    class G_Lady_Blue
                    {
                        availableOnStart = 1;
                    };
                    class rhs_ess_black
                    {
                        availableOnStart = 1;
                    };
                    class G_Diving
                    {
                        availableOnStart = 1;
                    };
                    class G_Combat_Goggles_tna_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Combat
                    {
                        availableOnStart = 1;
                    };
                    class G_I_Diving
                    {
                        availableOnStart = 1;
                    };
                    class G_O_Diving
                    {
                        availableOnStart = 1;
                    };
                    class G_B_Diving
                    {
                        availableOnStart = 1;
                    };
                    class G_Lowprofile
                    {
                        availableOnStart = 1;
                    };
                    class G_Goggles_VR
                    {
                        availableOnStart = 1;
                    };
                    class rhs_balaclava
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_blk
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_lowprofile
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_oli
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_combat
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_TI_blk_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_TI_tna_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_TI_G_blk_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Balaclava_TI_G_tna_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Squares
                    {
                        availableOnStart = 1;
                    };
                    class G_Squares_Tinted
                    {
                        availableOnStart = 1;
                    };
                    class rds_long_hair_02
                    {
                        availableOnStart = 1;
                    };
                    class rds_long_hair_01
                    {
                        availableOnStart = 1;
                    };
                    class rds_long_hair_03
                    {
                        availableOnStart = 1;
                    };
                    class G_Respirator_white_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Respirator_yellow_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Respirator_blue_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Spectacles
                    {
                        availableOnStart = 1;
                    };
                    class rhs_googles_orange
                    {
                        availableOnStart = 1;
                    };
                    class rhs_googles_black
                    {
                        availableOnStart = 1;
                    };
                    class rhs_googles_yellow
                    {
                        availableOnStart = 1;
                    };
                    class rhs_googles_clear
                    {
                        availableOnStart = 1;
                    };
                    class G_Aviator
                    {
                        availableOnStart = 1;
                    };
                    class G_EyeProtectors_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Shades_Red
                    {
                        availableOnStart = 1;
                    };
                    class G_EyeProtectors_Earpiece_F
                    {
                        availableOnStart = 1;
                    };
                    class G_Shades_Green
                    {
                        availableOnStart = 1;
                    };
                    class G_Sport_Red
                    {
                        availableOnStart = 1;
                    };
                    class G_Sport_Blackyellow
                    {
                        availableOnStart = 1;
                    };
                    class G_Sport_Checkered
                    {
                        availableOnStart = 1;
                    };
                    class G_Sport_BlackWhite
                    {
                        availableOnStart = 1;
                    };
                    class G_Sport_Greenblack
                    {
                        availableOnStart = 1;
                    };
                    class G_Tactical_Black
                    {
                        availableOnStart = 1;
                    };
                    class G_Spectacles_Tinted
                    {
                        availableOnStart = 1;
                    };
                    class G_Tactical_Clear
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh_white
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh_tan
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_tan
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_od
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_grn
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh_grn
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_white
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_gogg_grn
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh_gogg_grn
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_gogg_od
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh_gogg_tan
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_gogg_tan
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh_gogg_white
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh_gogg_od
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_oakley_goggles_clr
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_oakley_goggles_blk
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_shemagh2_gogg_white
                    {
                        availableOnStart = 1;
                    };
                    class G_Shades_Black
                    {
                        availableOnStart = 1;
                    };
                    class G_Sport_Blackred
                    {
                        availableOnStart = 1;
                    };
                    class G_Shades_Blue
                    {
                        availableOnStart = 1;
                    };
                    class rhsusf_oakley_goggles_ylw
                    {
                        availableOnStart = 1;
                    };
                    class rhs_scarf
                    {
                        availableOnStart = 1;
                    };
                    class G_WirelessEarpiece_F
                    {
                        availableOnStart = 1;
                    };
                    class rds_worker_cap4
                    {
                        availableOnStart = 1;
                    };
                    class rds_worker_cap3
                    {
                        availableOnStart = 1;
                    };
                    class rds_worker_cap2
                    {
                        availableOnStart = 1;
                    };
                    class rds_worker_cap1
                    {
                        availableOnStart = 1;
                    };
                    class rds_Villager_cap1
                    {
                        availableOnStart = 1;
                    };
                    class rds_Villager_cap2
                    {
                        availableOnStart = 1;
                    };
                    class rds_Villager_cap3
                    {
                        availableOnStart = 1;
                    };
                    class rds_Villager_cap4
                    {
                        availableOnStart = 1;
                    };
                    class rds_Woodlander_cap4
                    {
                        availableOnStart = 1;
                    };
                    class rds_Woodlander_cap1
                    {
                        availableOnStart = 1;
                    };
                    class rds_Woodlander_cap2
                    {
                        availableOnStart = 1;
                    };
                    class rds_Woodlander_cap3
                    {
                        availableOnStart = 1;
                    };
                    class H_Shemag_olive_hs
                    {
                        availableOnStart = 1;
                    };
                    class H_Shemag_olive
                    {
                        availableOnStart = 1;
                    };
                    class H_ShemagOpen_tan
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadSet_orange_F
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadSet_red_F
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadSet_white_F
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadSet_black_F
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadSet_yellow_F
                    {
                        availableOnStart = 1;
                    };
                    class rds_Profiteer_cap1
                    {
                        availableOnStart = 1;
                    };
                    class rds_Profiteer_cap3
                    {
                        availableOnStart = 1;
                    };
                    class rds_Profiteer_cap4
                    {
                        availableOnStart = 1;
                    };
                    class rds_Profiteer_cap2
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadBandage_bloody_F
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadBandage_clean_F
                    {
                        availableOnStart = 1;
                    };
                    class H_HeadBandage_stained_F
                    {
                        availableOnStart = 1;
                    };
                    class H_EarProtectors_red_F
                    {
                        availableOnStart = 1;
                    };
                    class H_EarProtectors_orange_F
                    {
                        availableOnStart = 1;
                    };
                    class H_EarProtectors_black_F
                    {
                        availableOnStart = 1;
                    };
                    class H_EarProtectors_white_F
                    {
                        availableOnStart = 1;
                    };
                    class H_EarProtectors_yellow_F
                    {
                        availableOnStart = 1;
                    };
                    class rds_rocker_hair3
                    {
                        availableOnStart = 1;
                    };
                    class rds_rocker_hair2
                    {
                        availableOnStart = 1;
                    };
                    class rds_rocker_hair1
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_yellow_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_white_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_2_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_black_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_red_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_orange_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_blue_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_4_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_1_green_F
                    {
                        availableOnStart = 1;
                    };
                    class H_RacingHelmet_3_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Helmet_Skate
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_headset_vrana_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_earprot_vrana_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_basic_vrana_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_headset_orange_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_earprot_orange_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_headset_red_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_basic_orange_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_headset_black_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_earprot_red_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_basic_red_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_earprot_black_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_basic_black_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_headset_white_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_earprot_white_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_earprot_yellow_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_basic_white_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_headset_yellow_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Construction_basic_yellow_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Booniehat_tna_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Booniehat_mcamo
                    {
                        availableOnStart = 1;
                    };
                    class H_Booniehat_khk
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_Safari_sand_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_Safari_olive_F
                    {
                        availableOnStart = 1;
                    };
                    class H_StrawHat_dark
                    {
                        availableOnStart = 1;
                    };
                    class H_StrawHat
                    {
                        availableOnStart = 1;
                    };
                    class rhs_Booniehat_flora
                    {
                        availableOnStart = 1;
                    };
                    class rhs_Booniehat_digi
                    {
                        availableOnStart = 1;
                    };
                    class H_Booniehat_tan
                    {
                        availableOnStart = 1;
                    };
                    class H_Booniehat_oli
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_grey
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_blue
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_checker
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_tan
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_brown
                    {
                        availableOnStart = 1;
                    };
                    class H_Hat_camo
                    {
                        availableOnStart = 1;
                    };
                    class rhsgref_fieldcap_ttsko_urban
                    {
                        availableOnStart = 1;
                    };
                    class rhsgref_fieldcap_ttsko_mountain
                    {
                        availableOnStart = 1;
                    };
                    class rhsgref_fieldcap_ttsko_digi
                    {
                        availableOnStart = 1;
                    };
                    class rhsgref_fieldcap_ttsko_forest
                    {
                        availableOnStart = 1;
                    };
                    class H_MilCap_dgtl
                    {
                        availableOnStart = 1;
                    };
                    class H_MilCap_ghex_F
                    {
                        availableOnStart = 1;
                    };
                    class H_MilCap_tna_F
                    {
                        availableOnStart = 1;
                    };
                    class H_MilCap_gry
                    {
                        availableOnStart = 1;
                    };
                    class H_MilCap_blue
                    {
                        availableOnStart = 1;
                    };
                    class H_MilCap_mcamo
                    {
                        availableOnStart = 1;
                    };
                    class H_MilCap_ocamo
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_marshal
                    {
                        availableOnStart = 1;
                    };
                    class rhs_fieldcap_vsr
                    {
                        availableOnStart = 1;
                    };
                    class rhs_fieldcap_khk
                    {
                        availableOnStart = 1;
                    };
                    class rhs_fieldcap_ml
                    {
                        availableOnStart = 1;
                    };
                    class rhs_fieldcap_digi2
                    {
                        availableOnStart = 1;
                    };
                    class rhs_fieldcap_digi
                    {
                        availableOnStart = 1;
                    };
                    class H_Watchcap_khk
                    {
                        availableOnStart = 1;
                    };
                    class H_Watchcap_blk
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_headphones
                    {
                        availableOnStart = 1;
                    };
                    class H_Watchcap_camo
                    {
                        availableOnStart = 1;
                    };
                    class H_Watchcap_cbr
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_brn_SPECOPS
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_blk_Raven
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_grn
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_tan_specops_US
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_khaki_specops_UK
                    {
                        availableOnStart = 1;
                    };
                    class rhs_fieldcap
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_surfer
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_Orange_IDAP_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_oli
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_oli_hs
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_blu
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_press
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_tan
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_blk_ION
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_red
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_grn_BI
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_blk_CMMG
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_usblack
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_White_IDAP_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_blk
                    {
                        availableOnStart = 1;
                    };
                    class H_Cap_Black_IDAP_F
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_booniehat_md2camo
                    {
                        availableOnStart = 1;
                    };
                    class H_Booniehat_dgtl
                    {
                        availableOnStart = 1;
                    };
                    class rhsgref_Booniehat_alpen
                    {
                        availableOnStart = 1;
                    };
                    class rhs_Booniehat_m81
                    {
                        availableOnStart = 1;
                    };
                    class rhs_booniehat2_marpatd
                    {
                        availableOnStart = 1;
                    };
                    class rhs_Booniehat_ocp
                    {
                        availableOnStart = 1;
                    };
                    class rhs_Booniehat_ucp
                    {
                        availableOnStart = 1;
                    };
                    class rhs_booniehat2_marpatwd
                    {
                        availableOnStart = 1;
                    };
                    class H_Booniehat_khk_hs
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_booniehat_woodland
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_booniehat_digital
                    {
                        availableOnStart = 1;
                    };
                    class H_ShemagOpen_khk
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_bandana_digital
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_bandana_digital_desert
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_bandana_md2camo
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_bandana_smb
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_gry
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_bandana_oakleaf
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_khk
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_khk_hs
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_camo
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_mcamo
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_cbr
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_surfer
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_sand
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_sgg
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_blu
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_surfer_grn
                    {
                        availableOnStart = 1;
                    };
                    class rhsgref_bcap_specter
                    {
                        availableOnStart = 1;
                    };
                    class H_Bandanna_surfer_blk
                    {
                        availableOnStart = 1;
                    };
                    class rhs_beanie_green
                    {
                        availableOnStart = 1;
                    };
                    class rhs_beanie
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_beret_green
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_beret_para
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_beret_black
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_beret_red
                    {
                        availableOnStart = 1;
                    };
                    class H_Beret_gen_F
                    {
                        availableOnStart = 1;
                    };
                    class H_Beret_blk
                    {
                        availableOnStart = 1;
                    };
                    class rhssaf_beret_blue_un
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_citizen1
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_assistant
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_citizen2
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_citizen3
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_citizen4
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_doctor
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Functionary2
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Functionary1
                    {
                        availableOnStart = 1;
                    };
                    class U_C_ConstructionCoverall_Vrana_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_ConstructionCoverall_Red_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_ConstructionCoverall_Blue_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_ConstructionCoverall_Black_F
                    {
                        availableOnStart = 1;
                    };
                    class U_OrestesBody
                    {
                        availableOnStart = 1;
                    };
                    class U_I_C_Soldier_Bandit_2_F
                    {
                        availableOnStart = 1;
                    };
                    class U_I_C_Soldier_Bandit_5_F
                    {
                        availableOnStart = 1;
                    };
                    class U_I_C_Soldier_Bandit_1_F
                    {
                        availableOnStart = 1;
                    };
                    class U_I_C_Soldier_Bandit_4_F
                    {
                        availableOnStart = 1;
                    };
                    class U_I_C_Soldier_Bandit_3_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Man_casual_5_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Man_casual_1_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_man_sport_2_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_man_sport_1_F
                    {
                        availableOnStart = 1;
                    };
                    class U_BG_Guerilla1_2_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_man_sport_3_F
                    {
                        availableOnStart = 1;
                    };
                    class U_BG_Guerilla1_1
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Man_casual_6_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Man_casual_4_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Man_casual_3_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Man_casual_2_F
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Profiteer1
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_priest
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Profiteer4
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Profiteer3
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Profiteer2
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Rocker1
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Rocker2
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Rocker3
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Rocker4
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_schoolteacher
                    {
                        availableOnStart = 1;
                    };
                    class U_BG_Guerilla2_2
                    {
                        availableOnStart = 1;
                    };
                    class U_BG_Guerilla2_1
                    {
                        availableOnStart = 1;
                    };
                    class U_BG_Guerilla2_3
                    {
                        availableOnStart = 1;
                    };
                    class U_Competitor
                    {
                        availableOnStart = 1;
                    };
                    class U_C_IDAP_Man_shorts_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_IDAP_Man_casual_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_IDAP_Man_TeeShorts_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_IDAP_Man_Jeans_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_IDAP_Man_Tee_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_IDAP_Man_cargo_F
                    {
                        availableOnStart = 1;
                    };
                    class U_Marshal
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Journalist
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Mechanic_01_F
                    {
                        availableOnStart = 1;
                    };
                    class U_C_HunterBody_grn
                    {
                        availableOnStart = 1;
                    };
                    class U_BG_Guerrilla_6_1
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Scientist
                    {
                        availableOnStart = 1;
                    };
                    class U_BG_leader
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Villager1
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Villager2
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Villager3
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Villager4
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Woodlander4
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Woodlander3
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Woodlander2
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Woodlander1
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Worker4
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Worker3
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Worker2
                    {
                        availableOnStart = 1;
                    };
                    class rds_uniform_Worker1
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Poor_1
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Poloshirt_burgundy
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Poloshirt_salmon
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Poloshirt_redwhite
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Poloshirt_blue
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Poloshirt_tricolour
                    {
                        availableOnStart = 1;
                    };
                    class U_C_Poloshirt_stripped
                    {
                        availableOnStart = 1;
                    };
                };
            };
            class Police
            {
                class Equipment
                {
                    // Glock 17
                    class rhsusf_weap_glock17g4
                    {
                        requiredScore = 0;
                    };
                    class acc_flashlight_pistol : rhsusf_weap_glock17g4 {};
                    class optic_mrd : rhsusf_weap_glock17g4 {};
                    class optic_mrd_black : rhsusf_weap_glock17g4 {};

                    // M9 Beretta
                    class rhsusf_weap_m9
                    {
                        requiredScore = 0;
                    };

                    // Kozlice 12G
                    class sgun_HunterShotgun_01_F {
                        requiredScore = 5;
                    };

                    // M9 with ballistic shield
                    class CUP_hgun_M9
                    {
                        requiredScore = 10;
                    };
                    class CUP_hgun_BallisticShield_Armed_M9 : CUP_hgun_M9 {};
                    // Smoke grenades
                    class SmokeShell: CUP_hgun_M9 {};
                    class SmokeShellGreen: SmokeShell {};
                    class SmokeShellOrange: SmokeShell {};
                    class SmokeShellBlue: SmokeShell {};
                    class SmokeShellPurple: SmokeShell {};
                    class SmokeShellRed: SmokeShell {};
                    class SmokeShellYellow: SmokeShell {};

                    // M590 Shotgun
                    class rhs_weap_M590_8RD : CUP_hgun_M9 {};

                    // MP5A5
                    class CUP_smg_MP5A5
                    {
                        requiredScore = 20;
                    };
                    class optic_aco_grn_smg : CUP_smg_MP5A5 {};
                    class optic_aco_smg : CUP_smg_MP5A5 {};
                    class acc_flashlight: CUP_smg_MP5A5 {};

                    // MP5SD6
                    class CUP_smg_MP5SD6
                    {
                        requiredScore = 25;
                    };

                    // SPAS-12
                    class CUP_sgun_SPAS12 : CUP_smg_MP5SD6 {};

                    // Flashbangs
                    class rhs_mag_mk84 : CUP_smg_MP5SD6 {};
                    class rhs_mag_m4009 : rhs_mag_mk84 {};
                    class rhsusf_mag_6Rnd_m4009 : rhs_mag_mk84 {};

                    // M79
                    class rhs_weap_m79
                    {
                        requiredScore = 30;
                    };
                    // M16A4
                    class rhs_weap_m16a4_carryhandle : rhs_weap_m79 {};
                    class optic_aco_grn : rhs_weap_m16a4_carryhandle {};
                    class optic_aco : rhs_weap_m16a4_carryhandle {};
                    // MP7 with ballistic shield
                    class CUP_smg_MP7 : rhs_weap_m79 {};
                    class CUP_smg_BallisticShield_MP7 : CUP_smg_MP7 {};
                    class CUP_sgun_Saiga12K : CUP_smg_MP7 {};

                    // M249
                    class rhs_weap_m249_pip_L
                    {
                        requiredScore = 35;
                    };
                    // M4A1
                    class rhs_weap_m4a1_carryhandle_m203 : rhs_weap_m249_pip_L {};
                    // Frag
                    class rhs_mag_m67 : rhs_weap_m249_pip_L {};
                    // Holosights
                    class rhsusf_acc_eotech_552 : rhs_weap_m249_pip_L {};
                    class optic_holosight: rhs_weap_m249_pip_L {};
                    class optic_holosight_blk_f: optic_holosight {};
                    class optic_holosight_khk_f: optic_holosight {};
                    class optic_holosight_smg: rhs_weap_m249_pip_L {};
                    class optic_holosight_smg_blk_f: optic_holosight_smg {};
                    class optic_holosight_smg_khk_f: optic_holosight_smg {};

                    // M32 6Rnd GL
                    class rhs_weap_m32
                    {
                        requiredScore = 35;
                    };
                    // M136 single shot AT
                    class rhs_weap_M136_hedp : rhs_weap_m32 {};

                    // M320 pistol slot GL
                    class rhs_weap_M320
                    {
                        requiredScore = 40;
                    };

                    // M200 Intervention
                    class srifle_LRR_F: rhs_weap_M320 {};
                    class srifle_LRR_camo_F: srifle_LRR_F {};
                    class srifle_LRR_tna_F: srifle_LRR_F {};
                    class optic_lrps: srifle_LRR_F {};
                    class optic_lrps_tna_f: optic_lrps {};
                    class optic_lrps_ghex_f: optic_lrps {};

                    /* Radios */
                    class ACRE_PRC152 {};
                    class ACRE_PRC343 {};
                    class ACRE_PRC117F {};

                    /* Uniforms */
                    class U_B_GEN_Soldier_F {};
                    class U_B_GEN_Commander_F {};
                    class U_Rangemaster {};
                    class U_Marshal {};
                    class U_BG_Guerilla2_1 {};
                    class U_BG_Guerilla2_3 {};
                    class U_C_Journalist {};
                    class U_Marshal {};
                    class U_C_IDAP_Man_casual_F {};
                    class U_C_IDAP_Man_Jeans_F {};
                    class U_C_IDAP_Man_Tee_F {};
                    class CUP_U_CRYE_G3C_BLK {};
                    class rds_uniform_Policeman {};
                    // class RM_SWAT_Uniform_01 {};
                    // class RM_SWAT_Uniform_02 {};
                    /* Vests */
                    class rds_pistol_holster {};
                    class rhs_vest_commander {};
                    class V_Rangemaster_belt {};
                    class V_LegStrapBag_black_F {};
                    class V_LegStrapBag_coyote_F {};
                    class V_LegStrapBag_olive_F {};
                    class V_TacVest_blk_POLICE: SMG_05_F {};
                    class V_PlateCarrier2_blk: rhs_weap_m4a1_carryhandle_m203 {};
                    class V_PlateCarrierSpec_blk: srifle_LRR_F {};
                    // class RM_SWAT_Vest_01 {};
                    // class RM_SWAT_Vest_Blue_01 {};
                    // class RM_SWAT_Vest_Red_01 {};
                    /* Backpacks */
                    // class Rainman_Kitbag_Splinter_Urban {};
                    // class Rainman_Kitbag_Splinter {};
                    class B_Messenger_Black_F {};
                    class B_LegStrapBag_black_F {};
                    class B_Messenger_Olive_F {};
                    class B_Messenger_Gray_F {};
                    class B_Messenger_Coyote_F {};
                    class B_LegStrapBag_olive_F {};
                    class B_LegStrapBag_coyote_F {};
                    /* Headgear */
                    class rds_police_cap {};
                    class H_Cap_police {};
                    class H_MilCap_blue {};
                    class H_MilCap_gen_F {};
                    class H_Beret_gen_F {};
                    class H_Beret_blk {};
                    class H_HelmetB_light_black: V_PlateCarrier2_blk {};
                    class H_PASGT_basic_blue_F: V_PlateCarrierSpec_blk {};
                    class rhssaf_helmet_m97_black_nocamo_black_ess : H_HelmetB_light_black {};
                    // class RM_SWAT_Helmet_01 {};
                    // class RM_SWAT_MilCap_Black {};
                    // class G_RM_SWAT_Bandana {};
                    // class G_RM_SWAT_Balaclava {};
                    // class G_RM_SWAT_Glasses {};

                    // ["kka3_ace_extension_Land_BagFence_Long_F","kka3_ace_extension_Land_BagFence_Round_F","kka3_ace_extension_Campfire_burning_F","kka3_ace_extension_Land_CampingTable_F","kka3_ace_extension_Land_Camping_Light_off_F","kka3_ace_extension_Land_CampingChair_V1_F","kka3_ace_extension_Land_DrillAku_F","kka3_ace_extension_roadcone_l_f","kka3_ace_extension_roadcone_f","kka3_ace_extension_roadbarrier_small_f","kka3_ace_extension_roadbarrier_f","kka3_ace_extension_Land_PortableLight_single_F",,"kka3_ace_extension_TapeSign_F","kka3_ace_extension_Land_Wrench_F",
                    // "rhsusf_mag_15Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP"]
                };

                class Vehicles
                {
                    /* Vehicles */
                    class CUP_LADA_LM_CIV {};
                    class CUP_C_Volha_Limo_TKCIV {};
                    class B_GEN_Offroad_01_gen_F {};

                    class C_Hatchback_01_sport_F
                    {
                        requiredScore = 15;
                    };

                    class rhsusf_m1025_w
                    {
                        requiredScore = 20;
                    };

                    class rhsusf_m1025_w_m2
                    {
                        requiredScore = 30;
                    };
                    class rhsgref_cdf_reg_uaz_dshkm : rhsusf_m1025_w_m2 {};

                    class rhs_btr80a_vdv
                    {
                        requiredScore = 35;
                    };
                    class CUP_I_Hilux_M2_IND_G_F : rhs_btr80a_vdv {};

                    class rhs_tigr_sts_msv
                    {
                        requiredScore = 40;
                    };

                    /* Helicopters */
                    class rhs_uh1h_hidf_unarmed {};
                    class I_Heli_light_03_unarmed_F {};
                    class RHS_UH60M2
                    {
                        requiredScore = 10;
                    };
                    class rhs_uh1h_hidf
                    {
                        requiredScore = 20;
                    };
                    class RHS_MELB_MH6M : rhs_uh1h_hidf {};
                    class RHS_UH60M
                    {
                        requiredScore = 30;
                    };
                    class RHS_AH1Z
                    {
                        requiredScore = 40;
                    };
                };
            };
        };
    };
};
