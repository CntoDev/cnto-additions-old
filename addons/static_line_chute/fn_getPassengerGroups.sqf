/*
 * get all unique cargo/turret groups
 */

private _cargo = _this call Static_Line_Chute_fnc_getPassengers;

private _unique_groups = [];
{
    _unique_groups pushBackUnique (group _x);
} forEach _cargo;

_unique_groups;
