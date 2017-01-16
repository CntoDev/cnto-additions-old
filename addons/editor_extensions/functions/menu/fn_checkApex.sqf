/*
 * check for any Apex ("Expansion") assets within the mission
 * and report / select objects found
 * - this exists because players without the Apex DLC cannot load a mission
 *   which has these (mostly terrain) objects in
 */

if (!is3DEN) exitWith {};

private _ents = [];
{
    /* even if a mod alters Apex content, configSourceModList will still show
     * "expansion" somewhere in the list even when configSourceMod doesn't */
    private _mods = configSourceModList (configFile >> "CfgVehicles" >> typeOf _x);
    if (count (_mods select { _x == "expansion" }) > 0) then {
        _ents pushBack _x;
    };
} forEach (all3DENEntities select 0);

set3DENSelected _ents;

if (count _ents > 0) then {
    ["Apex assets found (see selected objects).", 1] call BIS_fnc_3DENNotification;
} else {
    ["No Apex assets found.", 0] call BIS_fnc_3DENNotification;
};
