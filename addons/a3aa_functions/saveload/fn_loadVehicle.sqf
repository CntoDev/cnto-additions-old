0 = _this spawn {

params ["_veh", "_props"];
_props params ["_hits", "_fuel", "_turretmags", "_cargo", "_ace_cargo",
               "_ace_rearmfuel"];

{
    _veh setHitIndex [_forEachIndex, _x, false];
} forEach _hits;

_veh setFuel _fuel;

/* clear all magazines first, then add saved ones */
{
    _x params ["_class", "_path"];
    _veh removeMagazinesTurret [_class, _path];
} forEach magazinesAllTurrets _veh;
{
    _x params ["_path", "_class", "_bullets"];
    _veh addMagazineTurret [_class, _path, _bullets];
} forEach _turretmags;

_veh setVariable ["DontClearCargo", true];  //basic_vehicle_cargo
/* wait for mods to add their items */
sleep 3;
[_veh, _cargo] call a3aa_fnc_loadCargo;

/* remove existing ace cargo - if object, delete it */
//waitUntil { !isNil { _veh getVariable "ace_cargo_loaded" } };
{
    if (_x isEqualType objNull) then {
        deleteVehicle _x;
    };
} forEach (_veh getVariable ["ace_cargo_loaded", []]);
_veh setVariable ["ace_cargo_loaded", +_ace_cargo];
[_veh] call ace_cargo_fnc_validateCargoSpace;

[_veh, _ace_rearmfuel select 0] call ace_refuel_fnc_setFuel;

};
