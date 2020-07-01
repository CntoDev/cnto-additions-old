if (is3DEN) exitWith {};

/* global publicVariable, can be overwritten by external logic */
a3aa_ee_teleport_on_jip_pos = getPosASL _this;
publicVariable "a3aa_ee_teleport_on_jip_pos";

[
    [],  // 'spawn' needs this, doesn't accept just {} like 'call'
    {
        if (!hasInterface || !isRemoteExecutedJIP) exitWith {};

        /*
         * due to some stupid vanilla logic, the player unit is being teleported
         * on JIP several times at seemingly random points (ie. [0,0,0] or half-
         * way between our teleport destination and the original spawn point
         *
         * even if we keep teleporting for several seconds to the destination,
         * the player might be teleported back once our timer ends
         * - this suggests that vanilla keeps teleporting the unit back to start
         *   until it detects player on the starting position
         *
         * so instead of constantly teleporting the player to dest, give vanilla
         * logic a chance to register the starting position before we teleport
         * the player once (no need to re-try)
         */
        addMissionEventHandler ["PreloadFinished", {
            0 = [] spawn {
                sleep 1;

                waitUntil { !isNil "a3aa_ee_teleport_on_jip_simul" };

                /* add 1m to Z, just in case it's inside a road, etc. */
                waitUntil { !isNil "a3aa_ee_teleport_on_jip_pos" };
                private _pos = +a3aa_ee_teleport_on_jip_pos;
                _pos set [2, (_pos select 2) + 1];
                moveOut player;
                player setPosASL _pos;

                sleep 1;
                player enableSimulation a3aa_ee_teleport_on_jip_simul;
            };
            removeMissionEventHandler ["PreloadFinished", _thisEventHandler];
        }];

        waitUntil { !isNull player };
        a3aa_ee_teleport_on_jip_simul = simulationEnabled player;
        player enableSimulation false;
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;
