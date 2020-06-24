if (is3DEN) exitWith {};

/* global publicVariable, can be overwritten by external logic */
a3aa_ee_teleport_on_jip_pos = getPosASL _this;
publicVariable "a3aa_ee_teleport_on_jip_pos";

[
    [],  // 'spawn' needs this, doesn't accept just {} like 'call'
    {
        if (!hasInterface || !isRemoteExecutedJIP) exitWith {};
        waitUntil { !isNull player };
        waitUntil { !isNil "a3aa_ee_teleport_on_jip_pos" };
        player setPosASL a3aa_ee_teleport_on_jip_pos;

        /* sometimes, for some reason, the player is teleported
         * only halfway to the destination, sigh, try again */
        sleep 0.1;
        player setPosASL a3aa_ee_teleport_on_jip_pos;
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;
