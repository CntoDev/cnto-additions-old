if (isClass (configFile >> "CfgPatches" >> "acex_volume")) exitWith {};

/*
 * if changed mid-mission, restore to default, but only if we modified
 * fadeSound previously, not always - in case mission maker used fadeSound
 * for custom purposes
 */
if (!quiet_vehicles_enable) exitWith {};

private _veh = vehicle player;

if (_veh == player) exitWith {
    /* not in vehicle, restore sound levels */
    10 fadeSound 1;
};

if (_veh isKindOf "Car"
    || _veh isKindOf "Tank"
    || _veh isKindOf "Helicopter"
    || {_veh isKindOf "Plane"}
    || {_veh isKindOf "Ship"}) then {
    /* entered vehicle eligible for sound reduction */
    1 fadeSound quiet_vehicles_level;
};
