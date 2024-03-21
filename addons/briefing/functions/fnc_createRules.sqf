#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 *
 * Creates rules briefing.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#define DIARY_NAME "skDiary"

params [["_unit", player]];

_unit createDiarySubject [DIARY_NAME, LELSTRING(main,Category)];

private _listSeparator = "<br/>- ";
private _generalRulesList = [
    LLSTRING(Rules_1),
    LLSTRING(Rules_2),
    LLSTRING(Rules_3),
    LLSTRING(Rules_4),
    LLSTRING(Rules_5),
    LLSTRING(Rules_6),
    LLSTRING(Rules_7),
    LLSTRING(Rules_8)
] joinString _listSeparator;

private _generalRulesText = format ["%1%2%3", LLSTRING(Rules), _listSeparator, _generalRulesList];

_unit createDiaryRecord [DIARY_NAME, [LLSTRING(Rules), _generalRulesText]];
