#include "script_component.hpp"

[{alive player}, {
    private _welcomeText = format [LLSTRING(Welcome_Message), QUOTE(VERSION_STR)];
    titletext [_welcomeText, "plain"];
}] call CBA_fnc_waitUntilAndExecute;
