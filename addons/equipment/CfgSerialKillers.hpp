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
                    class ACE_Flashlight_XL50 {};
                    class ACE_Flashlight_KSF1 {};
                    class ACE_Flashlight_MX991 {};
                    class ACE_MapTools {};
                    class ACE_PlottingBoard {};
                    class ACE_wirecutter {};
                    class ToolKit {};

                    class ace_marker_flags_yellow {};
                    class ace_marker_flags_white {};
                    class ace_marker_flags_black {};
                    class ace_marker_flags_red {};
                    class ace_marker_flags_purple {};
                    class ace_marker_flags_blue {};
                    class ace_marker_flags_orange {};
                    class ace_marker_flags_green {};

                    class ACE_SpraypaintYellow {};
                    class ACE_SpraypaintWhite {};
                    class ACE_SpraypaintBlack {};
                    class ACE_SpraypaintRed {};
                    class ACE_SpraypaintBlue {};
                    class ACE_SpraypaintGreen {};

                    class ACE_rope3 {};
                    class ACE_rope6 {};
                    class ACE_rope12 {};
                    class ACE_rope15 {};
                    class ACE_rope18 {};
                    class ACE_rope27 {};
                    class ACE_rope36 {};

                    class Chemlight_blue {};
                    class Chemlight_green {};
                    class Chemlight_red {};
                    class Chemlight_yellow {};
                    class ACE_Chemlight_HiYellow {};
                    class ACE_Chemlight_HiWhite {};
                    class ACE_Chemlight_HiRed {};
                    class ACE_Chemlight_HiBlue {};
                    class ACE_Chemlight_HiGreen {};
                    class ACE_Chemlight_IR {};
                    class ACE_Chemlight_Orange {};
                    class ACE_Chemlight_White {};
                    class ACE_Chemlight_UltraHiOrange {};

                    class ACE_HandFlare_Green {};
                    class ACE_HandFlare_Red {};
                    class ACE_HandFlare_White {};
                    class ACE_HandFlare_Yellow {};
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
                    class IEDLandBig_Remote_Mag : DemoCharge_Remote_Mag {};
                    class IEDLandSmall_Remote_Mag : DemoCharge_Remote_Mag {};
                    class IEDUrbanBig_Remote_Mag : DemoCharge_Remote_Mag {};
                    class IEDUrbanSmall_Remote_Mag: DemoCharge_Remote_Mag {};
                    class APERSBoundingMine_Range_Mag : DemoCharge_Remote_Mag {};
                    class APERSMine_Range_Mag : DemoCharge_Remote_Mag {};
                    class APERSTripMine_Wire_Mag : DemoCharge_Remote_Mag {};
                    class ATMine_Range_Mag : DemoCharge_Remote_Mag {};
                    class ClaymoreDirectionalMine_Remote_Mag: DemoCharge_Remote_Mag {};
                    class SatchelCharge_Remote_Mag : DemoCharge_Remote_Mag {};
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
                    class rhs_mag_mk3a2 : rhs_mag_m67 {};
                    class ACE_M84 : rhs_mag_an_m14_th3 {};
                    class SmokeShell {};
                    class SmokeShellBlue : SmokeShell {};
                    class SmokeShellGreen : SmokeShell {};
                    class SmokeShellOrange : SmokeShell {};
                    class SmokeShellPurple : SmokeShell {};
                    class SmokeShellRed : SmokeShell {};
                    class SmokeShellYellow : SmokeShell {};
                    class ACE_HuntIR_M203 {};

                    /* Optics */
                    class optic_Holosight_smg_blk_F {};

                    /* Other equipment */
                    class ACRE_SEM52SL {};
                    class ACE_Clacker {};
                    class ACE_M26_Clacker {};
                    class ACE_DeadManSwitch {};
                    class ACE_Cellphone {};
                    class O_UavTerminal {};
                    class O_UAV_01_backpack_F : O_UavTerminal {};
                    class ACE_EntrenchingTool {};

                    class ACE_VectorDay {};
                    class ACE_Vector {};
                    class ACE_ATragMX {};
                    class ACE_Kestrel4500 {};
                    class ACE_RangeCard {};
                    class ACE_Tripod {};
                    class ACE_SpottingScope {};

                    class ACE_HuntIR_monitor : ACE_HuntIR_M203 {};

                    class NVGoggles {};
                    class NVGoggles_OPFOR {};
                    class NVGoggles_INDEP {};

                    class Rangefinder {};
                    class Laserdesignator {};
                    class Laserbatteries : Laserdesignator {};
                    class Laserdesignator_01_khk_F : Laserdesignator {};
                    class Laserdesignator_02 : Laserdesignator {};
                    class Laserdesignator_02_ghex_F: Laserdesignator {};
                    class Laserdesignator_03 : Laserdesignator {};

                    class armaforces_inflatable_boat_bag {};
                    class armaforces_inflatable_boat_engine_bag {};

                    class rhs_Tow_Gun_Bag {};
                    class rhs_TOW_Tripod_Bag {};
                    class RHS_Mk19_Gun_Bag {};
                    class RHS_Mk19_Tripod_Bag {};

                    class RHS_DShkM_Gun_Bag {};
                    class RHS_DShkM_TripodHigh_Bag {};
                    class RHS_DShkM_TripodLow_Bag {};
                    class RHS_AGS30_Gun_Bag {};
                    class RHS_AGS30_Tripod_Bag {};
                    class RHS_Kornet_Tripod_Bag {};
                    class RHS_Kornet_Gun_Bag {};
                    class RHS_Metis_Tripod_Bag {};
                    class RHS_Metis_Gun_Bag {};

                    /* Clothing */
                    #include "presets/cup-rhs/killers-civilian-clothing.hpp"
                    class rhssaf_uniform_m93_oakleaf {};
                    class rhssaf_uniform_m10_digital_summer {};

                    /* Vests */
                    // class rds_pistol_holster {};
                    class rhs_vest_pistol_holster {};
                    class rhs_vest_commander {};
                    class rhs_6sh46 {};
                    class V_BandollierB_blk {};
                    class V_BandollierB_khk {};
                    class V_BandollierB_oli {};
                    class V_BandollierB_rgr {};
                    class rhssaf_vest_md99_woodland_rifleman_radio {};
                    class rhssaf_vest_md99_woodland_rifleman {};
                    class rhssaf_vest_md99_digital_rifleman {};
                    class rhsgref_alice_webbing {};

                    /* Backpacks */
                    class B_FieldPack_cbr {};
                    class B_FieldPack_khk {};
                    class B_FieldPack_oli {};
                    class B_Carryall_cbr {};
                    class B_Carryall_oli {};
                    class B_Kitbag_cbr {};
                    class B_Kitbag_rgr {};
                    class B_Kitbag_tan {};
                    class rhssaf_alice_md2camo {};
                    class rhssaf_kitbag_md2camo {};

                    /* Headgear (Helmets) */
                    class rhssaf_helmet_m97_oakleaf {};
                    class rhssaf_helmet_m97_digital {};
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
                        loadMagazines = "false";
                    };
                    class 2Rnd_12Gauge_Pellets : sgun_HunterShotgun_01_F {};
                    class 2Rnd_12Gauge_Slug : sgun_HunterShotgun_01_F {};

                    // M9 with ballistic shield
                    class CUP_hgun_M9
                    {
                        requiredScore = 10;
                    };
                    class CUP_hgun_BallisticShield_Armed_M9 : CUP_hgun_M9 {};
                    class CUP_decal_BallisticShield_Bullseye {};
                    class CUP_decal_BallisticShield_Police {};
                    class CUP_decal_BallisticShield_Police_worn {};
                    class CUP_decal_BallisticShield_Police_Yellow {};
                    class CUP_decal_BallisticShield_Militia {};
                    class CUP_decal_BallisticShield_Militia_worn {};
                    class CUP_decal_BallisticShield_Militia_Yellow {};
                    class CUP_decal_BallisticShield_Militia_Yellow_wron {};

                    // Smoke grenades
                    class SmokeShell: CUP_hgun_M9 {};
                    class SmokeShellGreen: SmokeShell {};
                    class SmokeShellOrange: SmokeShell {};
                    class SmokeShellBlue: SmokeShell {};
                    class SmokeShellPurple: SmokeShell {};
                    class SmokeShellRed: SmokeShell {};
                    class SmokeShellYellow: SmokeShell {};

                    // M590 Shotgun
                    class rhs_weap_M590_8RD : CUP_hgun_M9
                    {
                        loadMagazines = "false";
                    };
                    class rhsusf_8Rnd_00Buck : rhs_weap_M590_8RD {};
                    class rhsusf_8Rnd_Slug : rhs_weap_M590_8RD {};

                    // Remington 700 + 1 rnd mags
                    class CUP_srifle_Remington700 : rhs_weap_M590_8RD {};
                    class CUP_optic_Remington : CUP_srifle_Remington700 {};
                    class CUP_1Rnd_762x51_CZ584 : CUP_srifle_Remington700 {};

                    // SPAS-12
                    class CUP_sgun_SPAS12
                    {
                        requiredScore = 15;
                        loadMagazines = "false";
                    };

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

                    // Flashbangs
                    class rhs_mag_mk84 : CUP_smg_MP5SD6 {};
                    class rhs_mag_m4009 : rhs_mag_mk84 {};
                    class rhsusf_mag_6Rnd_m4009 : rhs_mag_mk84 {};

                    // M79
                    class rhs_weap_m79
                    {
                        requiredScore = 30;
                    };
                    class ACE_HuntIR_M203 : rhs_weap_m79 {};
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
                    class ACE_VectorDay : srifle_LRR_F {};
                    class ACE_Vector : srifle_LRR_F {};
                    class ACE_ATragMX : srifle_LRR_F {};
                    class ACE_Kestrel4500 : srifle_LRR_F {};
                    class ACE_RangeCard : srifle_LRR_F {};
                    class ACE_Tripod : srifle_LRR_F {};
                    class ACE_SpottingScope : srifle_LRR_F {};

                    /* Radios */
                    class ACRE_PRC152 {};
                    class ACRE_PRC343 {};
                    class ACRE_PRC117F {};

                    /* Other */
                    class B_UavTerminal { requiredScore = 30; };
                    class Laserdesignator : B_UavTerminal {};
                    class ACE_DefusalKit {};
                    // class MineDetector : ACE_DefusalKit {}; TODO: Decide if/when it should be available as it's kinda OP
                    class ACE_HuntIR_monitor : ACE_HuntIR_M203 {};

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
                    class B_GEN_Offroad_01_gen_F
                    {
                        requiredScore = 10;
                    };

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
