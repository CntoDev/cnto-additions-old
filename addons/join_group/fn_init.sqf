if (isClass (configFile >> "CfgPatches" >> "ace_interaction")) exitWith {};
0 = [] spawn {
    waitUntil { !isNull player };
    player remoteExec ["a3aa_join_group_fnc_broadcastAction", 0, player];
    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];
        _unit remoteExec ["a3aa_join_group_fnc_broadcastAction", 0, _unit];
    }];
};
