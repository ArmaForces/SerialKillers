#include "script_component.hpp"
/*
 * Author: 3Mydlo3, veteran29
 * BFT loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call afm_friendly_tracker_fnc_loop
 *
 * Public: No
 */

// Move marker for every civilian
{
    private _civilian = _x;
    private _marker = _civilian getVariable [QGVAR(marker), ""];
    if (_marker isEqualTo "") then {
        _marker = [_civilian] call FUNC(createMarker);
        _civilian setVariable [QGVAR(marker), _marker];
    };
    _marker setMarkerPosLocal (position _civilian);
} foreach EGVAR(civilian,civilians);

// Schedule next loop
[FUNC(loop), [], GVAR(refreshRate)] call CBA_fnc_waitAndExecute;
