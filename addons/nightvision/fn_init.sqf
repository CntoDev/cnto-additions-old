[
    "a3aa_nightvision_color_style",
    "LIST",
    "NVG color style",
    ["Arma Additions", "Nightvision"],
    [
        ["vanilla","acelike","whitephosphor"],
        ["Vanilla green","ACE-like green","White Phosphor"],
        1
    ],
    true   /* isGlobal */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    a3aa_nightvision_settings_initialized = true;
}] call CBA_fnc_addEventHandler;

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
