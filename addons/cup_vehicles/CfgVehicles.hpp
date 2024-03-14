class CfgVehicles
{
    class Car_F;
    class CUP_Lada_Base: Car_F
    {
        class AnimationSources;
        class Sounds;
        class TextureSources
        {
            class PolishPolice
            {
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

    class CUP_LADA_LM_Base : CUP_Lada_Base
    {
        class AnimationSources: AnimationSources
        {
            class hideMilitiaLogo;
        };

        class Sounds : Sounds
        {
            class PoliceSiren_01_Ext;
            class PoliceSiren_01_Int;
        };
    };

    class CUP_LADA_LM_CIV: CUP_LADA_LM_Base {};
    class GVAR(LADA_LM): CUP_LADA_LM_CIV
    {
        faction = "BLU_GEN_F"; // TODO some own faction

        acceleration = 15; // 15 original
        enginePower = 82.700001; // 56.700001 original
        peakTorque = 142; // 106 original
        idleRPM = 700; // 600 original
        maxSpeed = 213; // 156 original

        // TODO: Change gears
        class complexGearbox
        {
            // Sport hatchback:
            // GearboxRatios[] = {"R1",-3.8,"N",0,"D1",3.6,"D2",2.15,"D3",1.55,"D4",1.15,"D5",0.9,"D6",0.67};
            // Original: GearboxRatios[] = {"R1",-3.87,"N",0,"D1",3.85,"D2",2.3,"D3",1.49,"D4",1};
            GearboxRatios[] = {
                "R1", -3.87,
                "N", 0,
                "D1", 3.85,
                "D2", 3.1,
                "D3", 2.49,
                "D4", 1.5,
                "D5", 1,
                "D6", 0.71
            };

            TransmissionRatios[] = { "High", 3.994 };

            driveString = "D";
            neutralString = "N";
            reverseString = "R";
            moveOffGear = 1;
            gearBoxMode = "auto";
        };
    };

    class GVAR(LADA_PolishPolice) : GVAR(LADA_LM)
    {
        animationList[] = {
            "hideRail", 1,
            "hideLightBar", 0,
            "hideMilitiaLogo", 1
        };

        displayName = CSTRING(Fiat125p_PolishPolice);
        displayNameShort = "Fiat 125p";

        hiddenSelectionsTextures[] = {
            QPATHTOF(assets\textures\pol57xD.paa),
            QPATHTOF(assets\textures\lada_glass_ca5.paa)
        };

        textureList[] = { "PolishPolice", 1 };

        class AnimationSources: AnimationSources
        {
            class hideMilitiaLogo: hideMilitiaLogo
            {
                initPhase = 1;
            };
        };

        class Sounds : Sounds
        {
            class PoliceSiren_01_Ext : PoliceSiren_01_Ext
            {
                sound[] = { QPATHTOF(assets\sounds\syrena.ogg), "db-8", 1 };
            };
            class PoliceSiren_01_Int : PoliceSiren_01_Int
            {
                sound[] = { QPATHTOF(assets\sounds\syrena.ogg), "db-16", 1 };
            };
        };
    };
};
