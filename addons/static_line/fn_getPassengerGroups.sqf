/*
 * get all unique cargo/turret groups
 */

private _cargo = _this call a3aa_static_line_fnc_getPassengers;

private _unique_groups = [];
{
    _unique_groups pushBackUnique (group _x);
} forEach _cargo;

_unique_groups;
