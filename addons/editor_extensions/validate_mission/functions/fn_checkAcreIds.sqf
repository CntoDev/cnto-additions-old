/*
 * check for any unique ACRE radio classnames (ie. "ACRE_PRC343_ID_1")
 * - the units should have only generic ones, ie. "ACRE_PRC343"
 */

private _ents = [];
{
    private _unit = _x;
    {
        if (_x find "ACRE" == 0 && _x find "_ID_" != -1) exitWith {
            _ents pushBack _unit;
        };
    } forEach items _unit;
} forEach allUnits;

if (count _ents > 0) then {
    [false, _ents];
} else {
    true;
};
