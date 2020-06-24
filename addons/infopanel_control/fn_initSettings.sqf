{
    _x params ["_id", "_pretty"];
    [
        format ["a3aa_infopanel_control_%1", _id],
        "CHECKBOX",
        _pretty,
        ["Arma Additions", "InfoPanel Control"],
        true,  /* default */
        true,  /* isGlobal */
        nil,   /* script */
        true   /* needRestart */
    ] call CBA_settings_fnc_init;
} forEach [
    ["MinimapDisplay", "GPS"],
    ["MineDetectorDisplay", "Mine Detector"],
    ["SlingLoadDisplay", "Slingload assistant"],
    ["UAVDisplay", "Drone camera"],
    ["CrewDisplay", "Crew list"]
];

["CBA_settingsInitialized", {
    [] call a3aa_infopanel_control_fnc_applySettings;
}] call CBA_fnc_addEventHandler;
