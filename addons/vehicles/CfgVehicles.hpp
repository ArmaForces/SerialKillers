#define HATCHBACK_POLICE_TEXTURE QPATHTOF(assets\textures\hatchback_01_police_co.paa)
#define HATCHBACK_SPORT_POLICE_TEXTURE QPATHTOF(assets\textures\hatchback_01_police_highway_co.paa)

class CfgVehicles
{
    class Car_F;
    class Hatchback_01_base_F;
    class Hatchback_01_sport_base_F;
    class C_Hatchback_01_F;
    class C_Hatchback_01_sport_F;

    class GVAR(Hatchback_cop) : C_Hatchback_01_F
    {
        faction = "BLU_GEN_F"; // TODO some own faction

        enginePower = 120; // 103 original
        peakTorque = 180; // 174 original
        idleRPM = 800; // 800 original
        maxSpeed = 210; // 190 original

        hiddenSelectionsTextures[] = { HATCHBACK_POLICE_TEXTURE };

        textureList[] =
        {
            "Police",
            1
        };
    };

    class GVAR(Hatchback_sport_cop) : C_Hatchback_01_sport_F
    {
        faction = "BLU_GEN_F"; // TODO some own faction

        enginePower = 320; // 285 original
        peakTorque = 480; // 450 original
        idleRPM = 1100; // 1000 original
        maxSpeed = 330; // 300 original

        hiddenSelectionsTextures[] = { HATCHBACK_SPORT_POLICE_TEXTURE };

        textureList[] =
        {
            "Police",
            1
        };
    };

    class Hatchback_01_base_F : Car_F
    {
        class TextureSources
        {
            class Police
            {
                DisplayName = "Police";
                author = "3Mydlo3";
                textures[] = { HATCHBACK_POLICE_TEXTURE };
                factions[] = { "BLU_GEN_F" };
            };
            class Police_Highway
            {
                DisplayName = "Police Highway";
                author = "3Mydlo3";
                textures[] = { HATCHBACK_SPORT_POLICE_TEXTURE };
                factions[] = { "BLU_GEN_F" };
            };
        };

        textureList[] += { "Police", 0, "Police_Highway", 0 };
    };

    class Hatchback_01_sport_base_F : Hatchback_01_base_F
    {
        class TextureSources
        {
            class Police
            {
                DisplayName = "Police";
                author = "3Mydlo3";
                textures[] = { HATCHBACK_POLICE_TEXTURE };
                factions[] = { "BLU_GEN_F" };
            };
            class Police_Highway
            {
                DisplayName = "Police Highway";
                author = "3Mydlo3";
                textures[] = { HATCHBACK_SPORT_POLICE_TEXTURE };
                factions[] = { "BLU_GEN_F" };
            };
        };

        textureList[] += { "Police", 0, "Police_Highway", 0 };
    };
};
