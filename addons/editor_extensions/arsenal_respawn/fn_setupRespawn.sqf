if (is3DEN || isDedicated) exitWith {};

/*
 * in other modules that run after BIS_fnc_init or in spawn:
 * - check !isNil "a3ee_arsenal_respawn_enabled" to see if this module exists
 *   and if further waiting makes sense or would be infinite
 * - wait for !isNil "a3ee_arsenal_respawn_done" to read or modify anything
 *   loadout related
 * - to check whether the unit had custom arsenal saved for respawn, simply
 *   check for !isNil "a3ee_arsenal_respawn_loadout" after waiting for "done"
 */

a3ee_arsenal_respawn_enabled = true;

0 = [] spawn {
    waitUntil { !isNull player };
    waitUntil { !isNil { player getVariable "saved3deninventory" } };

    /* false - no saved Arsenal for the unit */
    if (!(player getVariable "saved3deninventory")) exitWith {
        a3ee_arsenal_respawn_done = true;
    };

    private _loadout = getUnitLoadout player;
    _loadout call a3ee_arsenal_respawn_fnc_acreFixRadios;
    a3ee_arsenal_respawn_loadout = _loadout;

    player addEventHandler ["Killed", {
        a3ee_arsenal_respawn_done = nil;
    }];

    player addEventHandler ["Respawn", {
        player setUnitLoadout [a3ee_arsenal_respawn_loadout, false];
        a3ee_arsenal_respawn_done = true;
    }];

    a3ee_arsenal_respawn_done = true;
};

/*
 * don't delete this module as we don't remoteExec the thing above to make it
 * run locally on each client, but ASAP, during object initialization, not JIP
 * queue execution - this way, we can set a3ee_arsenal_respawn_enabled before
 * other logic checks it (we set it before BIS_fnc_init starts returning true)
 */
//deleteVehicle _this;
