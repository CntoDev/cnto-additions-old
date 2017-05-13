/*
 * check if any of the units are "overloaded" as in - whether their uniform,
 * vest or backpack contains more items than it should be able to hold
 * - this can happen after manual setUnitLoadout or out-of-game .sqm edit,
 *   replacing originally light items with heavy ones
 */

if (!is3DEN) exitWith {};

private _ents = [];
{
    if (loadUniform _x > 1 || loadVest _x > 1 || loadBackpack _x > 1) then {
        _ents pushBack _x;
    };
} forEach allUnits;

set3DENSelected _ents;

if (count _ents > 0) then {
    ["Overloaded units found (see selected objects).", 1] call BIS_fnc_3DENNotification;
} else {
    ["No overloaded units found.", 0] call BIS_fnc_3DENNotification;
};
