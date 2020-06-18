_this params ["_keys", "_vals"];
private _keyvals = [];
{
    _keyvals pushBack [_x, _vals select _forEachIndex];
} forEach _keys;
_keyvals;
