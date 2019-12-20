#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * BFT loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_markers_fnc_loop
 *
 * Public: No
 */

// Move marker for every civilian
{
    private _civilian = _x;
    private _marker = _civilian getVariable [QGVAR(marker), ""];
    if (_marker isEqualTo "") then {
        _marker = [_civilian] call FUNC(createCivilianMarker);
    } else {
        _marker setMarkerPosLocal (position _civilian);
    };
} foreach EGVAR(civilian,civilians);

// Move marker for every cop
if (playerSide isEqualTo WEST) then {
    {
        private _cop = _x;
        private _marker = _cop getVariable [QGVAR(marker), ""];
        if (_marker isEqualTo "") then {
            _marker = [_cop] call FUNC(createCopMarker);
        } else {
            _marker setMarkerPosLocal (position _cop);
        };
    } forEach allPlayers select {side _x isEqualTo WEST};
};

// Move marker for every killer
if (playerSide isEqualTo EAST) then {
    {
        private _killer = _x;
        private _marker = _killer getVariable [QGVAR(marker), ""];
        if (_marker isEqualTo "") then {
            _marker = [_killer] call FUNC(createKillerMarker);
        } else {
            _marker setMarkerPosLocal (position _killer);
        };
    } forEach allPlayers select {side _x isEqualTo EAST};
};

// Schedule next loop
[FUNC(loop), [], GVAR(refreshRate)] call CBA_fnc_waitAndExecute;
