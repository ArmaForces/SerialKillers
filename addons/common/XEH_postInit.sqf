#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {
    WARNING("Mission is missing 'SK' gameType Header. SerialKillers framework will be disabled.");
};

[QGVAR(playMusic), {
    playMusic (_this select 0);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(playMusicServer), {
        _this call FUNC(playMusicServer);
    }] call CBA_fnc_addEventHandler;

    // Log side chat messages to RPT for easier troubleshooting
    [QGVAR(showSideChatMsg), {
        params [["_side", sideEmpty], ["_msg", ""]];
        if (_msg isEqualTo "") exitWith {};
        private _sideText = if (_side isEqualTo sideEmpty) then { "ALL" } else { _side };
        INFO_2("(Side Chat) %1: %2",_sideText,_msg);
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(showMessage), FUNC(showMessage)] call CBA_fnc_addEventHandler;

[QGVAR(teleport), {
    params ["_caller", "_destination"];
    if (_destination isEqualType objNull) then {
        _destination = position _destination;
    };
    _caller setPos _destination;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    /* Initial player loadout */
    GVAR(playerLoadout) = getUnitLoadout player;
    player setVariable [QGVAR(side), playerSide, true];

    /* Spectator events */
    [QGVAR(initializeSideSpectator), {
        INFO("Starting side spectator");
        ["Initialize", [player, [playerSide], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(initializeSpectator), {
        INFO("Starting spectator");
        ["Initialize", [player, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(terminateSpectator), {
        ["Terminate"] call BIS_fnc_EGSpectator;
        INFO("Terminated spectator");
    }] call CBA_fnc_addEventHandler;

    /* Sidechat msg event */
    [QGVAR(showSideChatMsg), {
        params [["_side", sideEmpty], ["_msg", ""]];
        if (_msg isEqualTo "") exitWith {};
        // If side is empty we want to show message to everyone
        if (_side isEqualTo sideEmpty || {playerSide isEqualTo _side}) then {
            [playerSide, "HQ"] sideChat _msg;
        };
    }] call CBA_fnc_addEventHandler;
};
