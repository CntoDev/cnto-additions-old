/*
 * eject passengers from vehicle, in reverse order
 *
 * eject only members of _group, if specified
 *
 * if _group is a list of groups, eject the listed units, keeping group order
 */

params ["_vehicle", ["_group", grpNull], ["_unlock", true]];

if (_group isEqualType []) exitWith {
    {
        [_vehicle, _x, false] call Static_Line_Chute_fnc_ejectUnits;
        sleep (_vehicle call Static_Line_Chute_fnc_calcJumpDelay);
    } forEach _group;
    _vehicle setVariable ["Static_Line_Chute_jumping", nil, true];
};

private _cargo = [_vehicle, _group] call Static_Line_Chute_fnc_getPassengers;
private _total = count _cargo;

_vehicle setVariable ["Static_Line_Chute_jumping", true, true];
{
    if (!alive _vehicle) exitWith {};

    /* relay status messages to crew */
    [
        _vehicle,
        format ["Jumping %1/%2: %3 (%4)",
                _forEachIndex+1, _total, name _x, groupId group _x]
    ] call Static_Line_Chute_fnc_vehicleChat;

    [_vehicle, _x] remoteExec ["Static_Line_Chute_fnc_ejectWithChute", _x];

    if (_forEachIndex < _total -1) then {
        sleep (_vehicle call Static_Line_Chute_fnc_calcJumpDelay);
    };
} forEach _cargo;

if (_unlock) then {
    _vehicle setVariable ["Static_Line_Chute_jumping", nil, true];
};
