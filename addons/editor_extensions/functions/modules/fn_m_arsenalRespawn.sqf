if (is3DEN) exitWith {};

[
    [],
    {
        if (isDedicated) exitWith {};
        waitUntil { !isNull player };
        missionNamespace setVariable ["a3ee_saved_loadout", getUnitLoadout player];
        player addEventHandler ["Respawn", {
            private _loadout = (missionNamespace getVariable "a3ee_saved_loadout");
            player setUnitLoadout [_loadout, false];
        }];
    }
] remoteExec ["spawn", 0, true];

// the above is run only once, on the server, so it is safe
// to keep the module for existence checks
//deleteVehicle _this;
