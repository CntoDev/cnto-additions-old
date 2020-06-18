[
    "map_trackers_group_status",
    "LIST",
    ["Group tracking", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    [
        ["disabled","side","allies","all"],
        ["Disabled","Same side","Allied sides","All groups"],
        1
    ],     /* default */
    true,  /* isGlobal */
    nil,   /* script */
    true   /* needRestart */
] call CBA_settings_fnc_init;
[
    "map_trackers_group_shownames",
    "CHECKBOX",
    ["Show group callsigns", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;
[
    "map_trackers_group_showai",
    "CHECKBOX",
    ["Show AI-led groups", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    false,  /* default */
    true    /* isGlobal */
] call CBA_settings_fnc_init;
[
    "map_trackers_group_showself",
    "LIST",
    ["Shown own group", "How to determine which soldier icon (Leader/AR/AT/etc.) should be shown.\n\n...ed when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    [
        ["always","never","ifnotsoldier"],
        ["Always show","Never show","Only if soldier tracking disabled"],
        2
    ],     /* default */
    nil,   /* isGlobal */
    nil,   /* script */
    true   /* needRestart - TODO: probably not needed, can set this dynamically */
] call CBA_settings_fnc_init;

[
    "map_trackers_unit_status",
    "LIST",
    ["Soldier tracking", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    [
        ["disabled","group","side","allies","all"],
        ["Disabled","Same group","Same side","Allied sides","All players"],
        1
    ],     /* default */
    true,  /* isGlobal */
    nil,   /* script */
    true   /* needRestart */
] call CBA_settings_fnc_init;
[
    "map_trackers_unit_dist",
    "EDITBOX",
    ["Max soldier distance", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    "100",  /* default */
    true,   /* isGlobal */
    { map_trackers_unit_dist = parseNumber _this }
] call CBA_settings_fnc_init;
[
    "map_trackers_unit_shownames",
    "CHECKBOX",
    ["Show soldier names", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    false,  /* default */
    nil     /* isGlobal */
] call CBA_settings_fnc_init;
[
    "map_trackers_unit_showlines",
    "CHECKBOX",
    ["Link soldiers to leader", "Enable player-configurable sound reduction in vehicles.\n\nAutomatically disabled when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    true,  /* default */
    nil    /* isGlobal */
] call CBA_settings_fnc_init;
[
    "map_trackers_unit_iconsource",
    "LIST",
    ["Soldier icon", "How to determine which soldier icon (Leader/AR/AT/etc.) should be shown.\n\n...ed when using ACEX Volume."],
    ["Arma Additions", "Map Trackers"],
    [
        ["none","class","guess","custom"],
        ["Generic","Class","Autoguess","Custom"],
        2
    ],     /* default */
    true,  /* isGlobal */
    nil,   /* script */
    true   /* needRestart */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    if (!hasInterface) exitWith {};
    Map_Trackers_unit_lines = [];
    Map_Trackers_units = [];
    Map_Trackers_groups = [];
    if (map_trackers_group_status != "disabled") then {
        [] spawn Map_Trackers_fnc_groupUpdater;
    };
    if (map_trackers_unit_status != "disabled") then {
        [] spawn Map_Trackers_fnc_unitUpdater;
    };
    if (map_trackers_unit_status != "disabled" || map_trackers_group_status != "disabled") then {
        [] spawn Map_Trackers_fnc_hookAnyMapDisplay;
    };
    nil;
}] call CBA_fnc_addEventHandler;
