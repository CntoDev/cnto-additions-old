if (is3DEN) exitWith {};

[
    [],
    {
        if (isDedicated) exitWith {};
        waitUntil { !isNull player };
        waitUntil { !isNil { player getVariable "saved3deninventory" } };
        /* false - no saved Arsenal for the unit */
        if (!(player getVariable "saved3deninventory")) exitWith {};

        missionNamespace setVariable ["a3ee_saved_loadout", getUnitLoadout player];
        player addEventHandler ["Respawn", {
            private _loadout = (missionNamespace getVariable "a3ee_saved_loadout");
            player setUnitLoadout [_loadout, false];
        }];
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;
