/*
 * ACRE2 customizations
 */

/*
 * default direct speech volume to 2/5 instead of default 3/5
 * (helps against people shouting during briefing, disturbing others)
 */
if (isClass (configFile >> "CfgPatches" >> "acre_api")) then {
    0 = [] spawn {
        waitUntil { [] call acre_api_fnc_isInitialized };
        /* range: -2 to +2, default 0 */
        acre_sys_gui_VolumeControl_Level = -1;
        /* simulate release of volume adjustment key */
        [] call acre_sys_gui_fnc_closeVolumeControl;
    };
};
