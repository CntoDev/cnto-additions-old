if (canSuspend) then {
    waitUntil { !isNil "a3ee_onelife_disconnects" };
};
if (isNil "a3ee_onelife_disconnects") exitWith {};

private _uid = getPlayerUID player;

/* local */
[a3ee_onelife_disconnects, _uid, _this] call a3aa_fnc_hashSet;

/* global */
[[_uid, _this], {
    params ["_uid", "_data"];
    [
        a3ee_onelife_disconnects,
        _uid,
        _data
    ] call a3aa_fnc_hashSet;
    publicVariable "a3ee_onelife_disconnects";
}] remoteExecCall ["call", 2];
