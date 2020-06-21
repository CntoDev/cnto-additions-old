[
    "a3aa_ee_extended_gear_useprofile",
    "CHECKBOX",
    ["Default to per-player insignia", "When mission does not define any Extended Gear insignia,\nuse a player-defined one from profileNamespace."],
    ["Arma Additions", "Editor Extensions - Extended Gear"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    0 = [] spawn a3aa_ee_extended_gear_fnc_setupExtendedGear;
}] call CBA_fnc_addEventHandler;
