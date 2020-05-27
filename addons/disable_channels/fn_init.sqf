[
    "disable_channels_list",
    "EDITBOX",
    ["Channel IDs", "List of channel IDs to disable:\n\n0: Global\n1: Side\n2: Command\n3: Group\n4: Vehicle\n5: Direct\n\nGroup channel cannot be disabled."],
    ["Arma Additions", "Disable Channels"],
    "[1,2,4,5]",  /* default */
    true          /* isGlobal */
] call CBA_settings_fnc_init;
