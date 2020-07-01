[
    "a3aa_map_trackers_group_status",
    "LIST",
    ["Group tracking", "Enable group NATO markers on the map.\n\nSame side - show only groups of the same side as us\nAllied sides - show only groups of sides allied with us (incl. own)\nAll groups - show all groups"],
    ["Arma Additions", "Map Trackers"],
    [
        ["disabled","side","allies","all"],
        ["Disabled","Same side","Allied sides","All groups"],
        2
    ],     /* default */
    true,  /* isGlobal */
    nil,   /* script */
    true   /* needRestart */
] call CBA_settings_fnc_init;
[
    "a3aa_map_trackers_group_shownames",
    "CHECKBOX",
    ["Show group callsigns", "Show group names (callsigns) next to the NATO markers."],
    ["Arma Additions", "Map Trackers"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;
[
    "a3aa_map_trackers_group_showai",
    "CHECKBOX",
    ["Show AI-led groups", "Track all groups, not just ones led by players."],
    ["Arma Additions", "Map Trackers"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;
[
    "a3aa_map_trackers_group_showself",
    "LIST",
    ["Shown own group", "Shown NATO group marker of own group."],
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
    "a3aa_map_trackers_unit_status",
    "LIST",
    ["Soldier tracking", "Enable single-unit (soldier) tracking on the map.\n\nSame group - show only soldiers (AI/players) of own group\nSame side - show any (group or not) players of our side\nAllied sides - show any (group or not) players of sides allied with us (incl. own)\nAll players - show all players"],
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
    "a3aa_map_trackers_unit_dist",
    "EDITBOX",
    ["Max soldier distance", "Limit shown soldier icons to a radius (in meters) around us.\n\nSet to ie. 1000000 to show all.\nGroup NATO markers are not affected by this."],
    ["Arma Additions", "Map Trackers"],
    "100",  /* default */
    true,   /* isGlobal */
    { a3aa_map_trackers_unit_dist = parseNumber _this }
] call CBA_settings_fnc_init;
[
    "a3aa_map_trackers_unit_shownames",
    "CHECKBOX",
    ["Show soldier names", "Show names of the tracked soldiers next to the icons."],
    ["Arma Additions", "Map Trackers"],
    false,  /* default */
    nil     /* isGlobal */
] call CBA_settings_fnc_init;
[
    "a3aa_map_trackers_unit_showlines",
    "CHECKBOX",
    ["Link soldiers to leader", "For soldier tracking, draw a faint blue line from group leader to others in the group.\n\nWorks with all soldier tracking types (incl. non-group), but shows blue lines\nonly for soldiers in our own group."],
    ["Arma Additions", "Map Trackers"],
    true,  /* default */
    nil    /* isGlobal */
] call CBA_settings_fnc_init;
[
    "a3aa_map_trackers_unit_iconsource",
    "LIST",
    ["Soldier icon", "How to decide what soldier icon to show (leader/AT/AR/etc.):\n\nGeneric - show a generic non-descript soldier icon for everyone\nClass - extract icon from soldier classes (as seen in Eden)\nAutoguess - guess icon based on ingame state (has launcher -> is AT, etc.)"],
    ["Arma Additions", "Map Trackers"],
    [
        ["none","class","guess"],
        ["Generic","Class","Autoguess"],
        2
    ],    /* default */
    true  /* isGlobal */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    if (!hasInterface) exitWith {};
    a3aa_map_trackers_unit_lines = [];
    a3aa_map_trackers_units = [];
    a3aa_map_trackers_groups = [];
    if (a3aa_map_trackers_group_status != "disabled") then {
        [] spawn a3aa_map_trackers_fnc_groupUpdater;
    };
    if (a3aa_map_trackers_unit_status != "disabled") then {
        [] spawn a3aa_map_trackers_fnc_unitUpdater;
    };
    if (a3aa_map_trackers_unit_status != "disabled" || a3aa_map_trackers_group_status != "disabled") then {
        [] spawn a3aa_map_trackers_fnc_hookAnyMapDisplay;
    };
    nil;
}] call CBA_fnc_addEventHandler;
