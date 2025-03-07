#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes killers stashes.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call afsk_main_fnc_example
 *
 * Public: No
 */

private _stashes = +EGVAR(modules,killersStashes);
if (_stashes isEqualTo []) exitWith {};

private _stashesCount = count (_stashes);

if (_stashesCount isEqualTo 0) exitWith {
    WARNING("No killer stashes found.");
};

// Number of stashes to randomly select and create (so around 75% of them should appear on average)
private _createStatshesCount = ceil (random [_stashesCount/2, _stashesCount/1.33, _stashesCount]);

// Initialize random stashes up to _createStatshesCount
for "_y" from 0 to (_createStatshesCount - 1) step 1 do {
    private _stash = _stashes deleteAt (floor (random (count (_stashes))));
    private _stashPos = getPosATL _stash;
    private _box = createVehicle [GVAR(stashBoxClassName), _stashPos, [], 0, "CAN_COLLIDE"];
    _box setDir getDir _stash;
    clearItemCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    _box setVariable [QGVAR(killersStash), _stash];
    _stash setVariable [QGVAR(box), _box];
    _box call FUNC(fillKillersStash);
    GVAR(stashes) pushBack _box;
};

publicVariable QGVAR(stashes);

[QGVAR(createStashesMarkers)] call CBA_fnc_globalEventJIP;
