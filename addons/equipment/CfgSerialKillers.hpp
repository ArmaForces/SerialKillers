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
                        requiredScore = 15;
                    };
                    class optic_aco_grn_smg : CUP_smg_MP5A5 {};
                    class optic_aco_smg : CUP_smg_MP5A5 {};
                    class acc_flashlight: CUP_smg_MP5A5 {};

                    // MP5SD6
                    class CUP_smg_MP5SD6
                    {
                        requiredScore = 20;
                    };

                    // SPAS-12
                    class CUP_sgun_SPAS12 : CUP_smg_MP5SD6 {};

                    // M16A4
                    class rhs_weap_m16a4_carryhandle : CUP_smg_MP5SD6 {};
                    class optic_aco_grn : rhs_weap_m16a4_carryhandle {};
                    class optic_aco : rhs_weap_m16a4_carryhandle {};

                    // Flashbangs
                    class rhs_mag_mk84 : CUP_smg_MP5SD6 {};
                    class rhs_mag_m4009 : rhs_mag_mk84 {};
                    class rhsusf_mag_6Rnd_m4009 : rhs_mag_mk84 {};

                    // M79
                    class rhs_weap_m79
                    {
                        requiredScore = 25;
                    };
                    // MP7 with ballistic shield
                    class CUP_smg_MP7 : rhs_weap_m79 {};
                    class CUP_smg_BallisticShield_MP7 : CUP_smg_MP7 {};
                    class CUP_sgun_Saiga12K : CUP_smg_MP7 {};

                    // M249
                    class rhs_weap_m249_pip_L
                    {
                        requiredScore = 30;
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
                    class V_PlateCarrier2_blk: arifle_TRG21_F {};
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
                    }
                    class rhsgref_cdf_reg_uaz_dshkm : rhsusf_m1025_w {};
                    class CUP_I_Hilux_M2_IND_G_F : rhsusf_m1025_w {};

                    class rhsusf_m1025_w_m2
                    {
                        requiredScore = 30;
                    };

                    class rhs_btr80a_vdv
                    {
                        requiredScore = 35;
                    };

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
