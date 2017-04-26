private ["_smoke", "_x"];

0 = _this spawn {
    for "_x" from 1 to 60 do {
        _smoke = createVehicle ["rhs_g_gdm40", _this, [], 0, "CAN_COLLIDE"];
        _smoke setVelocity [random 60, random 60, random 20];
        sleep random 0.6;
    };
};
