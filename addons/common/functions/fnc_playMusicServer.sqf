#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function plays synchronized music for all clients and prevents interruption. Supports serverside music queue.
 *
 * Arguments:
 * 0: Music classname to play <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["LeadTrack01_F"] call afsk_common_fnc_playMusic
 *
 * Public: No
 */

params ["_musicClassname"];

// Add to queue
if GVAR(musicPlaying) exitWith {
    GVAR(musicQueue) pushBack _musicClassname;
};

if (GVAR(musicEH) == -1) then {
    // Add EH which will schedule next track after 15 seconds after previous ended
    GVAR(musicEH) = addMusicEventHandler ["MusicStop", {
        GVAR(musicPlaying) = false;
        if !(GVAR(musicQueue) isEqualTo []) exitWith {
            GVAR(musicPlaying) = true;
            [{
                [QGVAR(playMusic), [GVAR(musicQueue) deleteAt 0]] call CBA_fnc_globalEvent;
            }, [], 15] call CBA_fnc_waitAndExecute;
        };
    }];
};
