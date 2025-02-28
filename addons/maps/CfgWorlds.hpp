class CfgWorlds
{
    class CAWorld;

    class Tanoa : CAWorld
    {
        class Names
        {
            class Sosovu01
            {
                // This avoids crashes due to no road access for civilians
                // https://github.com/ArmaForces/SerialKillers/issues/75#issuecomment-2070909598
                // Remove this once issue is fixed: https://github.com/ArmaForces/SerialKillers/issues/75
                type = "NameLocal";
            };
        };
    };
};
