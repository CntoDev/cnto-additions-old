if (!([] call a3ee_onelife_fnc_checkTeleport)) exitWith { false };

private _data = [] call a3ee_onelife_fnc_getDisconnectData;
if (isNil "_data") exitWith { false };
_data params ["_alive", "_corpse", "_grp", "_time"];

private _loadout = getUnitLoadout _corpse;
player setUnitLoadout _loadout;

_corpse call a3ee_onelife_fnc_deleteCorpse;

/*
 * this needs to be done atomically as disabling simulation (local/global)
 * causes the player unit to be teleported to starting location, for some
 * weird reason
 * - so re-enable simulation first, *then* setVehiclePosition
 *   - also do it on the server, setVehiclePosition locally teleports the
 *     unit only "half-way" when used this fast after enabling simulation
 */
[[player, leader _grp], {
    params ["_unit", "_dst"];
    _unit enableSimulationGlobal true;
    _unit hideObjectGlobal false;
    _unit setVehiclePosition [_dst, [], 0, "NONE"];
}] remoteExecCall ["call", 2];

/* disable spectator if active */
private _in_spectator = player getvariable ["ace_spectator_isSet", false];
if (_in_spectator) then {
    false call a3ee_onelife_fnc_forceSpectator;
};

/* remove entry from server's list of disconnected clients */
[getPlayerUID player, {
    [a3ee_onelife_disconnects, _this] call a3aa_fnc_hashRem;
    publicVariable "a3ee_onelife_disconnects";
}] remoteExecCall ["call", 2];

true;
