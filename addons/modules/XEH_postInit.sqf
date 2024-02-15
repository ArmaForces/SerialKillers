#include "script_component.hpp"

if (isServer) then {
    GVAR(jail) = call FUNC(initJail);
    GVAR(policeStations) = call FUNC(initPoliceStations);
    GVAR(killersBase) = call FUNC(initKillersBase);
    GVAR(killersStartPositions) = call FUNC(initKillersStarts);
    GVAR(killersStashes) = call FUNC(initKillersStashes);

    publicVariable QGVAR(jail);
    publicVariable QGVAR(killersBase);
    publicVariable QGVAR(killersStashes);
    publicVariable QGVAR(policeStations);
};
