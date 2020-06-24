params ["_hash", "_key"];
_hash params ["_keys", "_vals"];
private _idx = _keys find _key;
if (_idx == -1) exitWith {};
_vals select _idx;
