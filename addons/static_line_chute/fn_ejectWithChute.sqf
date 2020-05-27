/*
 * eject the unit and immediately open a parachute (if any)
 */

0 = _this spawn {
    params ["_src_vehicle", "_unit"];
    if (vehicle _unit != _src_vehicle) exitWith {};

    private _veh = vehicle _unit;
    /* Eject would spawn parachute for AI, GetOut works for both */
    _unit action ["GetOut", _veh];
    /* account for possible lag between action and effect */
    waitUntil { vehicle _unit != _veh };
    sleep 1;
    _unit action ["OpenParachute", _unit];
};
