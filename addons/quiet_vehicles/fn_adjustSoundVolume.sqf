private _veh = vehicle player;
if (_veh == player) exitWith {
    /* not in vehicle, restore sound levels */
    10 fadeSound 1;
};

private _coef = profileNamespace getVariable "quiet_vehicles_coef";
if (isNil "_coef") exitWith {};

if (_veh isKindOf "Car" || _veh isKindOf "Tank" || {_veh isKindOf "Helicopter" || _veh isKindOf "Plane" || {_veh isKindOf "Ship"}}) then {
    /* entered vehicle eligible for sound reduction */
    1 fadeSound _coef;
};
