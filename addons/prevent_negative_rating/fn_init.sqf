[
    "prevent_negative_rating_enable",
    "CHECKBOX",
    ["Enable", "Prevent player rating from going below 0.\n\nThis prevents players who friendly-fired to be shot upon\nby friendlies and allows them to enter vehicles driven by other players.\n\nAutomatically disabled when using ACE, use:\nACE Interaction -> Disable negative rating"],
    ["Arma Additions", "Prevent Negative Rating"],
    true,  /* default */
    true,  /* isGlobal */
    nil,   /* script */
    true   /* needRestart */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    [] call Prevent_Negative_Rating_fnc_setupEH;
}] call CBA_fnc_addEventHandler;
