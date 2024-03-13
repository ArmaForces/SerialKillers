class CfgVehicles {
    class Car_F;
    class CUP_Lada_Base: Car_F {
        class AnimationSources;
        class TextureSources {
            class PolishPolice {
                DisplayName = "Polish Police";
                author = "Renchon";
                textures[] = {
                    QPATHTOF(assets\textures\pol57xD.paa),
                    QPATHTOF(assets\textures\lada_glass_ca5.paa)
                };
                factions[] = { "BLU_GEN_F" };
            };
        };

        textureList[] += { "PolishPolice", 0 };
    };

    class CUP_LADA_LM_Base : CUP_Lada_Base {
        class AnimationSources: AnimationSources {
            class hideMilitiaLogo;
        };
    };
    class CUP_LADA_LM_CIV: CUP_LADA_LM_Base {};

    class GVAR(LADA_LM): CUP_LADA_LM_CIV {
        faction = "BLU_GEN_F"; // TODO some own faction

        acceleration = 15; // 15 original
        enginePower = 82.700001; // 56.700001 original
        peakTorque = 136; // 106 original
        idleRPM = 700; // 600 original
        maxSpeed = 213; // 156 original

        // TODO: Change gears
    };

    class GVAR(LADA_PolishPolice) : GVAR(LADA_LM)
    {
        animationList[] = {
            "hideRail", 1,
            "hideLightBar", 0,
            "hideMilitiaLogo", 1
        };

        displayName = "Fiat 125p (Policja)";

        hiddenSelectionsTextures[] = {
            QPATHTOF(assets\textures\pol57xD.paa),
            QPATHTOF(assets\textures\lada_glass_ca5.paa)
        };

        textureList[] = {
            "PolishPolice",
            1
        };

        class AnimationSources: AnimationSources {
            class hideMilitiaLogo: hideMilitiaLogo {
                initPhase = 1;
            };
        };
    };
};
