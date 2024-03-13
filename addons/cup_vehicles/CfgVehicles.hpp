class CfgVehicles
{
    class Car_F;
    class CUP_Lada_Base;
    class CUP_LADA_LM_Base;

    class CUP_Lada_Base : Car_F
    {
        class TextureSources
        {
            class PolishPolice
            {
                DisplayName = "Polish Police";
                author = "Renchon";
                textures[] =
                {
                    QPATHTOF(assets\textures\pol57xD.paa),
                    QPATHTOF(assets\textures\lada_glass_ca5.paa)
                };
                factions[] = { "BLU_GEN_F" };
            };
        };


        textureList[] += { "PolishPolice", 0 };
    };

    class GVAR(LADA_LM) : CUP_LADA_LM_Base
    {
        acceleration = 16; // 15 original
        enginePower = 82.700001; // 56.700001 original
        peakTorque = 136; // 106 original
        idleRPM = 700; // 600 original
        maxSpeed = 213; // 156 original
    };

    class GVAR(LADA_PolishPolice) : GVAR(LADA_LM)
    {
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(assets\textures\pol57xD.paa),
            QPATHTOF(assets\textures\lada_glass_ca5.paa)
        };

        textureList[] =
        {
            "PolishPolice",
            1
        };
    };
};
