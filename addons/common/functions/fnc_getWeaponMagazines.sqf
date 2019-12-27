#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns all compatible magazines for given weapon.
 *
 * Arguments:
 * 0: Weapon <STRING>
 *
 * Return Value:
 * 0: Array of magazine classnames <ARRAY>
 *
 * Example:
 * [primaryWeapon player] call afsk_common_fnc_getWeaponMagazines
 *
 * Public: No
 */

params ["_weapon"];

private _weaponMagazines = [];
private _weaponConfig = (configFile >> "CfgWeapons" >> _itemClassName);
if (isClass _weaponConfig) then {
    // Check for magazineWells and use their magazines if possible
    private _weaponMagazineWells = getArray (_weaponConfig >> "magazineWell");
    if (_weaponMagazineWells isEqualTo []) then {
        {
            _weaponMagazines pushBackUnique _x;
        } forEach (getArray (_weaponConfig >> "magazines"));
    } else {
        {
            private _magazineWellConfig = (configFile >> "CfgMagazineWells" >> _x);
            {
                private _magazines = getArray _x;
                {
                    _weaponMagazines pushBack _x;
                } forEach _magazines;
            } forEach (configProperties [_magazineWellConfig, "true"]);
        } forEach _weaponMagazineWells;
    };
};

_weaponMagazines
