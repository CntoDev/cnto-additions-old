[
    "quiet_vehicles_enable",
    "CHECKBOX",
    ["Enable", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Quiet Vehicles"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;

[
    "quiet_vehicles_level",
    "SLIDER",
    ["Sound level", "How much to reduce sound in vehicles."],
    ["Arma Additions", "Quiet Vehicles"],
    [0, 1, 1, 1],  /* default; [min,max,default,trailing_decimal_digits] */
    nil,           /* isGlobal - let each client sets its own */
    {
        /* quiet_vehicles_enable seems to be available already */
        0 = [] spawn {
            /* also this runs on mission start, for a player in a vehicle */
            waitUntil { time > 0 };
            [] call Quiet_Vehicles_fnc_adjustSoundVolume;
        };
    }
] call CBA_settings_fnc_init;
