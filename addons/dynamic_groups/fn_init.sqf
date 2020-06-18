[
    "a3aa_dynamic_groups_enable",
    "CHECKBOX",
    ["Enable", "Set up the Dynamic Groups system.\n\nThis is a vanilla group management system for MP games,\naccess it via the Team Switch keybind ('u').\n\nAutomatically disabled in singleplayer."],
    ["Arma Additions", "Dynamic Groups"],
    true,  /* default */
    true,  /* isGlobal */
    nil,   /* script */
    true   /* needRestart */
] call CBA_settings_fnc_init;
[
    "a3aa_dynamic_groups_addgroups",
    "CHECKBOX",
    ["Add default player groups", "Instead of starting all players ungrouped (good for public MP games),\nregister editor-defined player groups into the Dynamic Groups system."],
    ["Arma Additions", "Dynamic Groups"],
    true,  /* default */
    true,  /* isGlobal */
    nil,   /* script */
    true   /* needRestart */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    [] call a3aa_dynamic_groups_fnc_missionSetup;
}] call CBA_fnc_addEventHandler;
