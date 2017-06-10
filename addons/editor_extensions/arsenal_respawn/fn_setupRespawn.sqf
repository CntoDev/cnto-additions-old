/*
 * this module is not a remoteExec+delete like the other ones, as it takes
 * advantage of units (and their init EHs) being processed before postInit
 * functions and BIS_fnc_init, so that any other logic that needs to wait
 * to check if arsenal respawn is enabled can just wait for BIS_fnc_init
 * and then check the presence of this module in the mission, race-free
 */

if (is3DEN || isDedicated) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    waitUntil { !isNil { player getVariable "saved3deninventory" } };
    /* false - no saved Arsenal for the unit */
    if (!(player getVariable "saved3deninventory")) exitWith {};

    missionNamespace setVariable ["a3ee_saved_loadout", getUnitLoadout player];
    player addEventHandler ["Respawn", {
        private _loadout = (missionNamespace getVariable "a3ee_saved_loadout");
        player setUnitLoadout [_loadout, false];
    }];
};
