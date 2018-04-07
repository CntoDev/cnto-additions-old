/*
 * eject passengers from vehicle, in reverse order
 *
 * eject only members of _group, if specified
 */

params ["_vehicle", ["_group", grpNull]];

private _cargo = [_vehicle, _group] call Static_Line_Chute_fnc_getPassengers;

/* jump */
0 = [_vehicle, _cargo] spawn {
    params ["_vehicle", "_cargo"];

    private _spd = speed _vehicle;
    private _delay = switch true do {
        case (_spd > 200): {0.5};
        case (_spd > 150): {1};
        case (_spd > 100): {2};
        case (_spd > 50):  {4};
        default            {6};
    };

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
            sleep _delay;
        };
    } forEach _cargo;
    _vehicle setVariable ["Static_Line_Chute_jumping", nil, true];

    [_vehicle, "Jump Done."] call Static_Line_Chute_fnc_vehicleChat;
};
