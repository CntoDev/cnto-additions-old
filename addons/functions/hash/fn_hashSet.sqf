params ["_hash", "_key", "_val"];
_hash params ["_keys", "_vals"];
private _idx = _keys pushBackUnique _key;
if (_idx == -1) then {
    _idx = _keys find _key;
};
_vals set [_idx, _val];
