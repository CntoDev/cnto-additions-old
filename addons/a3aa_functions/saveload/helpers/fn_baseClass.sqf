/* base weapon without scopes, base backpack/box without stuff
 * or the original passed arg if none is found */

params ["_category", "_class"];
switch (_category) do {
    case "CfgWeapons": {
        private _baseweap = getText (
            configFile >> "CfgWeapons" >> _class >> "baseWeapon"
        );
        if (_baseweap != "") then {
            _baseweap;
        } else {
            _class;
        };
    };
    case "CfgVehicles": {
        private _veh = configFile >> "CfgVehicles" >> _class;
        private _storedcnt = [
            "TransportWeapons", "TransportMagazines",
            "TransportItems", "TransportBackpacks"
        ] apply {
            count configproperties [_veh >> _x];
        };
        if (_storedcnt isEqualTo [0,0,0,0]) then {
            _class;
        } else {
            configName inheritsFrom _veh;
        };
    };
};
