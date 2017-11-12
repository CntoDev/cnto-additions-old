private ["_smoke", "_x"];

0 = _this spawn {
    for "_x" from 1 to 45 do {
        _smoke = createVehicle ["rhs_g_gdm40", _this, [], 0, "CAN_COLLIDE"];
        _smoke setVelocity [random 45, random 45, random 20];
        sleep random 0.6;
    };
};
