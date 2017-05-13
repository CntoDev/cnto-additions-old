/*
 * ACRE2 customizations
 *
 * most of the settings are now exported as editor modules, not much left here
 */

[0.2] call acre_api_fnc_setLossModelScale;

/*
 * default direct speech volume to 2/5 instead of default 3/5
 * (helps against people shouting during briefing, disturbing others)
 */
if (isClass (configFile >> "CfgPatches" >> "acre_api")) then {
    0 = [] spawn {
        sleep 1;
        /* range: -2 to +2, default 0 */
        acre_sys_gui_VolumeControl_Level = -1;
    };
};
