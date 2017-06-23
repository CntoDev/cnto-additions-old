/*
 * transform from_range to to_range, centering it around from_center and
 * to_center,
 * ie. from [0,100] center 50, to [0,1] center 0.8 will return value
 *     0.4 for 25 (half between min and center), 0.9 for 75 (half between
 *     center and max), etc.
 */

params ["_from_range", "_from_center", "_val", "_to_range", "_to_center"];
_from_range params ["_from_min", "_from_max"];
_to_range params ["_to_min", "_to_max"];

if (_val < _from_center) then {
    linearConversion [_from_min, _from_center, _val, _to_min, _to_center, true];
} else {
    linearConversion [_from_center, _from_max, _val, _to_center, _to_max, true];
};
