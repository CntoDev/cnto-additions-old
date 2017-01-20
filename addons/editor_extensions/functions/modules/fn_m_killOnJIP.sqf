if (is3DEN) exitWith {};

[
    [],  // 'spawn' needs this, doesn't accept just {} like 'call'
    {
        if (!hasInterface) exitWith {};
        waitUntil { !isNull player };

        /* don't kill VirtualSpectator_F and other logic units */
        if (side player isEqualTo sideLogic) exitWith {};

        if (didJIP) then { player setDamage 1 };
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;
