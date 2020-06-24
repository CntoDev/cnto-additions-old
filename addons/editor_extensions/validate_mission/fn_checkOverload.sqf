/*
 * check if any of the units are "overloaded" as in - whether their uniform,
 * vest or backpack contains more items than it should be able to hold
 * - this can happen after manual setUnitLoadout or out-of-game .sqm edit,
 *   replacing originally light items with heavy ones
 */

private _ents = [];
{
    if (loadUniform _x > 1 || loadVest _x > 1 || loadBackpack _x > 1) then {
        _ents pushBack _x;
    };
} forEach allUnits;

if (count _ents > 0) then {
    [false, _ents];
} else {
    true;
};
