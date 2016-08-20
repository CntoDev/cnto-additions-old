/*
 * create a new respawn marker, optionally deleting old ones
 *
 * create a respawn marker at _pos for _side (can be nil to create an universal
 * respawn for everyone), deleting previous markers for that side if _deleteold
 * is true
 *
 * if _pos itself is nil, don't create a new marker (but still delete old ones
 * if _deleteold is specified)
 */

params [["_pos", nil], ["_side", nil], ["_deleteold", false]];

private _prefix = "respawn";
if (!isNil "_side") then {
    _prefix = switch (_side) do {
        case west: { "respawn_west" };
        case east: { "respawn_east" };
        case resistance: { "respawn_guerrila" };
        case civilian: { "respawn_civilian" };
        default { "respawn" };
    };
};

if (_deleteold) then {
    {
        /* if name starts with prefix */
        if ((_x find _prefix) == 0) then { deleteMarker _x };
    } forEach allMapMarkers;
};

/* generate new name based on position */
if (!isNil "_pos") then {
    private _name = _prefix + "_" + ((str _pos) call BIS_fnc_filterString);
    private _mkr = createMarker [_name, _pos];
    _mkr setMarkerAlpha 0;
};
