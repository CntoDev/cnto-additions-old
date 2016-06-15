if (isMultiplayer) exitWith {};

/* "forEach" or "CODE count" doesn't work with configs */
private _addons = [];
private _cfg = configfile >> "CfgPatches";
for "_i" from 0 to (count _cfg - 1) do {
    private _x = _cfg select _i;
    if (isClass _x) then { _addons pushBack configName _x };
};
//_addons call bis_fnc_activateaddons;
activateAddons _addons;
