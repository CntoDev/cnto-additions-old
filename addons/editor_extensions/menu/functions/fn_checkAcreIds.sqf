/*
 * check for any unique ACRE radio classnames (ie. "ACRE_PRC343_ID_1")
 * - the units should have only generic ones, ie. "ACRE_PRC343"
 */

if (!is3DEN) exitWith {};

private _ents = [];
{
    private _unit = _x;
    {
        if (_x find "ACRE" == 0 && _x find "_ID_" != -1) exitWith {
            _ents pushBack _unit;
        };
    } forEach items _unit;
} forEach allUnits;

set3DENSelected _ents;

if (count _ents > 0) then {
    ["Units with unique ""_ID_"" ACRE radios found (see selected objects).", 1] call BIS_fnc_3DENNotification;
} else {
    ["No units with unique ACRE radios found.", 0] call BIS_fnc_3DENNotification;
};
