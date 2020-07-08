if (isClass (configFile >> "CfgPatches" >> "ace_nightvision")) exitWith {};
if (!hasInterface) exitWith {};

["visionMode", {
    params ["_unit", "_new", "_old"];
    if (_new == 1) then {
        [true] call a3aa_nightvision_fnc_enableNVGEffects;
    } else {
        /* 0 (normal) or 2 (thermal) */
        [false] call a3aa_nightvision_fnc_enableNVGEffects;
    };
}] call CBA_fnc_addPlayerEventHandler;
