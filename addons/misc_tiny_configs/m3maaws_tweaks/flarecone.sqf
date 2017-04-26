private ["_flare", "_x"];
private _radius = 50;

for "_x" from 0 to 320 step 40 do {
    _flare = createVehicle ["m3maaws_tweaks_nightsun", _this, [], 0, "CAN_COLLIDE"];
    _flare setVelocity [_radius * cos _x, _radius * sin _x, 10];
};
