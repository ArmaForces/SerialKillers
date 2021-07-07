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
// Number of stashes to randomly select and create (so around 75% of them should appear on average)
private _createStatshesCount = ceil (random [_stashesCount/2, _stashesCount/1.33, _stashesCount]);

// Initialize random stashes up to _createStatshesCount
for "_y" from 0 to _createStatshesCount step 1 do {
    private _stash = _stashes deleteAt (floor (random (count (_stashes))));
    private _stashPos = getPos _stash;
    private _box = createVehicle ["O_CargoNet_01_ammo_F", _stashPos, [], 0, "NONE"];
    _box setVariable [QGVAR(killersStash), _stash];
    _stash setVariable [QGVAR(box), _box];
    _box call FUNC(fillKillersStash);
    GVAR(stashes) pushback _box;
    publicVariable QGVAR(stashes);
};

[QGVAR(createStashesMarkers)] call CBA_fnc_globalEventJIP;
