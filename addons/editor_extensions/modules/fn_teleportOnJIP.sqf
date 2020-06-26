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

        /* add 1m to Z, just in case it's inside a road, etc. */
        private _pos = +a3aa_ee_teleport_on_jip_pos;
        _pos set [2, (_pos select 2) + 1];

        /*
         * due to some stupid vanilla logic, the player unit is being teleported
         * on JIP several times at seemingly random points (ie. [0,0,0] or half-
         * way between our teleport destination and the original spawn point
         * --> there's no way to beat the bullshit reasonably, so just keep
         *     teleporting the player for 1 second and hope for the best
         * (also don't rely on 'time', it may not yet be synced from server)
         */
        private _end = diag_tickTime + 1;
        private _dmg = isDamageAllowed player;
        player allowDamage false;
        waitUntil {
            player setPosASL _pos;
            diag_tickTime > _end;
        };
        sleep 2;
        player allowDamage _dmg;
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;
