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

{
    deleteMarkerLocal _x;
} forEach GVAR(markersToDelete);
GVAR(markersToDelete) = [];

// Move marker for every civilian
{
    private _civilian = _x;
    private _marker = _civilian getVariable [QGVAR(marker), ""];
    if (_marker isEqualTo "") then {
        _marker = [_civilian] call FUNC(createCivilianMarker);
    } else {
        _marker setMarkerPosLocal (position _civilian);
#ifdef DEV_DEBUG
        if (vehicle _civilian isEqualTo _civilian) then {
            _marker setMarkerColorLocal "ColorGreen";
        } else {
            _marker setMarkerColorLocal "ColorUnknown";
        };
#endif
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
    } forEach (allPlayers select {[_x] call EFUNC(police,isCop)});
};

// Move marker for every killer
{
    private _killer = _x;
    private _hidden = !([_killer] call EFUNC(common,appearsArmed));
    private _isInPrison = [_killer] call EFUNC(jail,isHandcuffed);

    if (_isInPrison) exitWith {};

    // Check if player should be able to see killer's marker
    // Player must:
    // 1. either be EAST (other killer)
    // 2a. or a killer must appear as unarmed
    // 2b. and not be in prison, or recently freed from prison
    if (playerSide isEqualTo EAST) then {
        [_killer, _hidden] call FUNC(createOrUpdateKillerMarker);
    } else {
        private _recentlyReleasedFromPrison = _killer getVariable [QEGVAR(jail,wasImprisonedRecently), false];

        if (_hidden && {!_recentlyReleasedFromPrison}) exitWith {
            [_killer, _hidden] call FUNC(createOrUpdateKillerMarker);
        };

        [_killer] call FUNC(deleteUnitMarker);
    };
} forEach (allPlayers select {[_x] call EFUNC(killers,isKiller)});

// Schedule next loop
[FUNC(loop), [], GVAR(refreshRate)] call CBA_fnc_waitAndExecute;
