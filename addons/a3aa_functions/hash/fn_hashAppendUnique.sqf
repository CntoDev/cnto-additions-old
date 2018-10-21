params ["_hash", "_key", "_val"];
private _arr = [_hash, _key] call a3aa_fnc_hashGet;
if (isNil "_arr") then {
    [_hash, _key, [_val]] call a3aa_fnc_hashSet;
} else {
    _arr pushBackUnique _val;
};
