[
    "prevent_negative_rating_enable",
    "CHECKBOX",
    ["Enable", "Prevent player rating from going below 0.\n\nThis prevents players from friendly-fired to be shot upon\nby friendlies and allows them to enter vehicles driven by other players.\n\nAutomatically disabled when using ACE, use:\nACE Interaction -> Disable negative rating"],
    ["Arma Additions", "Prevent Negative Rating"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;
