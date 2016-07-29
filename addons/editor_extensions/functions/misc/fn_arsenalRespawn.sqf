if (isDedicated) exitWith {};

// TEMP: if using (now obsolete) Arsenal Respawn module, do nothing
if (count entities "a3ee_arsenal_respawn" > 0) exitWith {};

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
