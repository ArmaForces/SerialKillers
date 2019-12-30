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
            class Police {
                class Equipment {
                    class hgun_P07_F {
                        requiredScore = 0;
                    };
                    class hgun_ACPC2_F: hgun_P07_F {};

                    class hgun_Pistol_heavy_01_F {
                        requiredScore = 2;
                    };
                    class acc_flashlight_pistol: hgun_Pistol_heavy_01_F {};
                    class optic_mrd: hgun_Pistol_heavy_01_F {};
                    class optic_mrd_black: optic_mrd {};

                    class hgun_PDW2000_F {
                        requiredScore = 5;
                    };
                    class optic_yorris: hgun_PDW2000_F {};
                    class sgun_HunterShotgun_01_F: hgun_PDW2000_F {};

                    class SMG_05_F {
                        requiredScore = 10;
                    };
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

                    class SMG_01_F {
                        requiredScore = 15;
                    };
                    class acc_flashlight_smg_01: SMG_01_F {};

                    class arifle_TRG20_F {
                        requiredScore = 20;
                    };
                    class optic_aco: arifle_TRG20_F {};
                    class optic_aco_grn: optic_aco {};

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

                    class SMG_03_TR_black {
                        requiredScore = 30;
                    };

                    class LMG_Mk200_F {
                        requiredScore = 35;
                    };
                    class arifle_TRG21_GL_F: LMG_Mk200_F {};

                    class srifle_LRR_F {
                        requiredScore = 40;
                    };
                    class srifle_LRR_camo_F: srifle_LRR_F {};
                    class srifle_LRR_tna_F: srifle_LRR_F {};
                    class optic_lrps: srifle_LRR_F {};
                    class optic_lrps_tna_f: optic_lrps {};
                    class optic_lrps_ghex_f: optic_lrps {};
                };
            };
        };
    };
};
