params ["_hash", "_key", "_by"];
private _num = [_hash, _key] call a3aa_fnc_hashGet;
if (isNil "_num") then {
    [_hash, _key, _by] call a3aa_fnc_hashSet;
} else {
    [_hash, _key, _num+_by] call a3aa_fnc_hashSet;
};
