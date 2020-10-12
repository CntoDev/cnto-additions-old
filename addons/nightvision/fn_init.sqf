if (isClass (configFile >> "CfgPatches" >> "ace_nightvision")) exitWith {};
if (!hasInterface) exitWith {};

/*
 * don't do any fancy waiting for CBA settings to be init'd,
 * just set a non-nil default
 */
a3aa_nightvision_color_style = "";

[
    "a3aa_nightvision_color_style",
    "LIST",
    ["NVG color style"],
    ["Arma Additions", "Nightvision"],
    [
        ["vanilla","acelike","whitephosphor"],
        ["Vanilla green","ACE-like green","White Phosphor"],
        1
    ],     /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;

["visionMode", {
    params ["_unit", "_new", "_old"];
    if (_new == 1) then {
        [true] call a3aa_nightvision_fnc_enableNVGEffects;
    } else {
        /* 0 (normal) or 2 (thermal) */
        [false] call a3aa_nightvision_fnc_enableNVGEffects;
    };
}] call CBA_fnc_addPlayerEventHandler;
