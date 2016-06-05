/*
 * move '_object' to specified '_pos' (PositionAGL or Object), "snapping" it
 * to nearest surface below the Z coordinate or the terrain itself if below
 * terrain level
 * if '_pos' is unspecified, use the '_object' as destination position
 *
 * optionally, apply '_offset' (meters) to Z specified in '_pos', altering the
 * surface calculation, ie. specifying a floor in a building by height
 * - defaults to +0.1m, to correct for surface bugs / anomalities
 *
 * to align an object to the nearest surface below it, pass ie. [_obj, _obj]
 *
 * idea taken from https://community.bistudio.com/wiki/Position#setPosAGLS
 */

params ["_object", "_pos", ["_offset", 0.1]];

if (isNil "_pos") then {
    _pos = ASLToAGL getPosASL _object;
} else {
    if (typeName _pos == "OBJECT") then {
        _pos = ASLToAGL getPosASL _pos;
    };
};

_pos params ["_x", "_y", "_z"];
_z = _z + _offset;
_object setVehiclePosition [[_x, _y, _z], [], 0, "CAN_COLLIDE"];
