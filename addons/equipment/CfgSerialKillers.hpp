class CfgSerialKillers {
    class Equipment_Presets {
        class Vanilla {
            class Common {
                class Equipment {
                    class Binocular {};
                    class ItemMap {};
                    class ItemGPS {};
                    class ItemCompass {};
                    class ItemWatch {};
                    class ItemRadio {};
                };
            };
            class Killers {
                class Equipment {
                    /* Primary */
                    // F2000
                    class arifle_Mk20_F {
                        availableOnStart = 0;
                        availableInStash = 1;
                    };
                    // F2000 EGLM
                    class arifle_Mk20_GL_F: arifle_Mk20_F {};
                    // KH2002 Sama
                    class arifle_Katiba_F {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    // Negev NG7
                    class LMG_Zafir_F {
                        availableOnStart = 0;
                        availableInStash = 1;
                    };
                    // GM6 Lynx
                    class srifle_GM6_F: LMG_Zafir_F {};

                    /* Pistols */
                    // MP-443 Grach
                    class hgun_Rook40_F {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    // Makarowa PM
                    class hgun_Pistol_01_F: hgun_Rook40_F {};

                    /* Launchers */
                    // Metis-M
                    class launch_O_Vorona_green_F {
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
                    class launch_NLAW_F {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };

                    /* Explosives and equipment */
                    class DemoCharge_Remote_Mag {
                        availableOnStart = 1;
                        availableInStash = 1;
                    };
                    class IEDUrbanSmall_Remote_Mag: DemoCharge_Remote_Mag {};
                    class ClaymoreDirectionalMine_Remote_Mag: DemoCharge_Remote_Mag {};
                    class SLAMDirectionalMine_Wire_Mag: DemoCharge_Remote_Mag {};
                };
            };
            class Police {
                class Equipment {
                    // P99
                    class hgun_P07_F {
                        requiredScore = 0;
                    };
                    // Custom Covert II
                    class hgun_ACPC2_F: hgun_P07_F {};

                    // FNX-45 Tactical
                    class hgun_Pistol_heavy_01_F {
                        requiredScore = 2;
                    };
                    class acc_flashlight_pistol: hgun_Pistol_heavy_01_F {};
                    class optic_mrd: hgun_Pistol_heavy_01_F {};
                    class optic_mrd_black: optic_mrd {};

                    // CPW
                    class hgun_PDW2000_F {
                        requiredScore = 5;
                    };
                    class optic_yorris: hgun_PDW2000_F {};
                    class sgun_HunterShotgun_01_F: hgun_PDW2000_F {};

                    // MP5K
                    class SMG_05_F {
                        requiredScore = 10;
                    };
                    // Scorpion Evo 3 A1
                    class SMG_02_F: SMG_05_F {};
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
                    class SMG_01_F {
                        requiredScore = 15;
                    };
                    class acc_flashlight_smg_01: SMG_01_F {};

                    // CTAR-21
                    class arifle_TRG20_F {
                        requiredScore = 20;
                    };
                    class optic_aco: arifle_TRG20_F {};
                    class optic_aco_grn: optic_aco {};

                    // TAR-21
                    class arifle_TRG21_F {
                        requiredScore = 25;
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
                    class SMG_03_TR_black {
                        requiredScore = 30;
                    };

                    // Stoner 99 LMG
                    class LMG_Mk200_F {
                        requiredScore = 35;
                    };
                    // GTAR-21 EGLM
                    class arifle_TRG21_GL_F: LMG_Mk200_F {};

                    // M200 Intervention
                    class srifle_LRR_F {
                        requiredScore = 40;
                    };
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
            };
        };
    };
};
