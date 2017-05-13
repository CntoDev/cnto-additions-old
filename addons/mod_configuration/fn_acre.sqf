/*
 * ACRE2 customizations
 */

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
