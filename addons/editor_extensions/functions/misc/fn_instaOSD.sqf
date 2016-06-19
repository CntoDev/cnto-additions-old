/*
 * show automatically guessed info about the player's location, map name,
 * mission date/time, etc.
 *
 * an optional header may be provided (such as mission name)
 *
 * examples:
 *   [] call a3ee_fnc_instaOSD;
 *   "Some Header" call a3ee_fnc_instaOSD;
 */

params ["_header"];

private _text = [];

if (!isNil "_header") then {
    _text pushBack [_header, true];
};

/* no printf in sqf :( */
private _date = date apply { if (_x < 10) then { "0" + str _x } else { _x } };
_text pushBack format (["%1-%2-%3, %4%5"] + _date);

private _loc_desc = player call a3ee_fnc_nearLocText;
if (_loc_desc != "") then {
    _text pushBack _loc_desc;
};

private _world = getText (configFile >> "CfgWorlds" >> worldName >> "description");
_text pushBack _world;

_text call a3ee_fnc_typeText;
