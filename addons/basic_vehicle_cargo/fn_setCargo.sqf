/*
 * wait for various stupid modded init EHs to insert their ...
 * items into misc vehicles, then remove them
 */
sleep 3;
if (!local _this) exitWith {};

if (_this getVariable ["DontClearCargo", false]) exitWith {};

clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;
clearBackpackCargoGlobal _this;
clearItemCargoGlobal _this;

if (_this isKindOf "Car") then {
    _this addItemCargoGlobal ["ACE_fieldDressing", floor random [0, 2, 8]];
    _this addItemCargoGlobal ["ACE_morphine", floor random [0, 1, 2]];

    if (random 100 < 1) then { _this addItemCargoGlobal ["ItemGPS", 1] };
    if (random 20 < 1) then { _this addItemCargoGlobal ["SmokeShell", floor random 4] };
    if (random 10 < 1) then { _this addItemCargoGlobal ["ACE_CableTie", floor random 5] };
    if (random 10 < 1) then {
        _this addItemCargoGlobal ["ACE_MapTools", 1];
        _this addItemCargoGlobal ["ItemMap", 1];
        _this addItemCargoGlobal ["ItemCompass", floor random 2];
    };
};

if (_this isKindOf "Tank" || _this isKindOf "Helicopter" || _this isKindOf "Plane" || _this isKindOf "Ship") then {
    _this addItemCargoGlobal ["ACE_fieldDressing", floor random [4, 8, 12]];
    _this addItemCargoGlobal ["ACE_morphine", floor random [1, 2, 4]];
};

/* transportRepair is vanilla, but ACE resets it to 0, so it can enforce
 * its own repair system - we could check for both, but given the complexity
 * of it, let's just check ACE */
private _cfg = configFile >> "CfgVehicles" >> typeOf _this;
if (isNumber (_cfg >> "ace_repair_canRepair") && { getNumber (_cfg >> "ace_repair_canRepair") > 0 }) then {
    /* add repair toolkits / backpacks to repair trucks */
    _this addItemCargoGlobal ["ToolKit", 3];
    _this addBackpackCargoGlobal ["B_AssaultPack_rgr", 3];
    /* add extra spare tracks/wheels as well */
    private _added = true;
    while {_added} do {
        ["ACE_Track", _this] call ace_cargo_fnc_loadItem;
        _added = ["ACE_Wheel", _this] call ace_cargo_fnc_loadItem;
    };
};
