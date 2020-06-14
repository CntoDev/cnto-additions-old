[
    ["Arma Additions", "GrassKeys"],
    "grasskeys_low",
    "Low (no grass)",
    { "low" call GrassKeys_fnc_setTerrain }
] call CBA_fnc_addKeybind;
[
    ["Arma Additions", "GrassKeys"],
    "grasskeys_standard",
    "Standard",
    { "standard" call GrassKeys_fnc_setTerrain }
] call CBA_fnc_addKeybind;
[
    ["Arma Additions", "GrassKeys"],
    "grasskeys_high",
    "High",
    { "high" call GrassKeys_fnc_setTerrain }
] call CBA_fnc_addKeybind;
[
    ["Arma Additions", "GrassKeys"],
    "grasskeys_veryhigh",
    "Very High",
    { "veryhigh" call GrassKeys_fnc_setTerrain }
] call CBA_fnc_addKeybind;
[
    ["Arma Additions", "GrassKeys"],
    "grasskeys_ultra",
    "Ultra",
    { "ultra" call GrassKeys_fnc_setTerrain }
] call CBA_fnc_addKeybind;

[
    "grasskeys_enable",
    "CHECKBOX",
    ["Enable", "Allow using the keybinds, otherwise a default terrainGrid from server .Arma3Profile is used."],
    ["Arma Additions", "GrassKeys"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;
[
    "grasskeys_hidegrass",
    "CHECKBOX",
    ["Hide grass on ""Low"" setting", "Hide grass on the lowest terrain grid setting."],
    ["Arma Additions", "GrassKeys"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    GrassKeys_settings_initialized = true;
}] call CBA_fnc_addEventHandler;
