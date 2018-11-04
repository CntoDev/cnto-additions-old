if (is3DEN) exitWith {};

/*
 * server-side logic
 */

/*
 * DB of disconnected players, format:
 *   [was alive, unit/corpse, orig group, time of disconnect]
 */
a3ee_onelife_disconnects = [] call a3aa_fnc_hashInit;

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    private _db = a3ee_onelife_disconnects;

    /*
     * if an entry exists, don't override it - in case of disconnect
     * while spectating (with technically alive player unit)
     */
    if ([_db, _uid] call a3aa_fnc_hashKeyExists) exitWith {};

    /*
     * disconnect sometimes deletes the unit, so create our own corpse
     * - unused as this separates primary weapon from the corpse, .. trust the
     *   engine to not delete the original unit (for now)
     */
    /*
    private _alive = alive _unit;
    private _new = createVehicle [typeOf _unit, position _unit, [], 0, "CAN_COLLIDE"];
    _new setVectorDirAndUp [vectorDir _unit, vectorUp _unit];
    _new setUnitLoadout [getUnitLoadout _unit, false];
    _new setDamage [1, false];
    */

    private _alive = alive _unit;

    /* consider bleeding units as dead */
    private _injuries = _unit getVariable ["ace_medical_bodyPartStatus", []];
    if (!(_injuries isEqualTo [0,0,0,0,0,0])) then {
        _alive = false;
    };

    /* consider injured+bandaged units as dead (to prevent cheating) */
    private _bandaged = _unit getVariable ["ace_medical_bandagedWounds", []];
    /* 3 or more bandaged injuries */
    if (count _bandaged >= 3) then {
        _alive = false;
    };

    /* consider unconscious units as dead */
    private _unconscious = _unit getVariable ["ACE_isUnconscious", true];
    if (_unconscious) then {
        _alive = false;
    };

    /* consider units more than 1000m away from grp lead as dead */
    if ((_unit distance leader group _unit) > 1000) then {
        _alive = false;
    };

    /* set disconnects db entry */
    private _data = [_alive, _unit, group _unit, time];
    [_db, _uid, _data] call a3aa_fnc_hashSet;

    /*
     * ideally, we would leave the original AI unit with "true" and kill it
     * later, so that a corpse inside a vehicle would remain in the vehicle,
     * but, with respawn enabled, the AI unit would respawn endlessly on its
     * current position after setDamage, even with no player controlling it,
     * so just delete it and create our own (above)
     * - unused, see above
     */
    /*
    _unit call a3ee_onelife_fnc_deleteCorpse;
    */

    publicVariable "a3ee_onelife_disconnects";

    false;
}];

/*
 * client-side logic
 */

/* mission maker settable during running game */
a3ee_onelife_onnewjoin = _this getVariable "onnewjoin";
publicVariable "a3ee_onelife_onnewjoin";

[
    [
        _this getVariable "onrespawn",
        _this getVariable "onrejoin",
        _this getVariable "disteleport"
    ],
    {
        if (!hasInterface) exitWith {};
        waitUntil { !isNull player };

        params ["_onrespawn", "_onrejoin", "_disteleport"];
        waitUntil { !isNil "a3ee_onelife_onnewjoin" };
        private _onnewjoin = a3ee_onelife_onnewjoin;

        // TODO: rewrite respawn+newjoin+rejoin as one logic, checking regularly
        // for checkTeleport, in case zeus pardons the player

        if (_onrespawn) then {
            player addEventHandler ["Respawn", {
                params ["_unit", "_corpse"];
                true call a3ee_onelife_fnc_forceSpectator;
                /* force spectator on rejoin; false = dead */
                private _data = [false, _corpse, group _unit, time];
                [[getPlayerUID player, _data], {
                    params ["_uid", "_data"];
                    [
                        a3ee_onelife_disconnects,
                        _uid,
                        _data
                    ] call a3aa_fnc_hashSet;
                    publicVariable "a3ee_onelife_disconnects";
                }] remoteExecCall ["call", 2];
            }];
        };

        private _rejoining = [] call a3ee_onelife_fnc_isRejoining;
        if (_onnewjoin && didJIP && !_rejoining) exitWith {
            true call a3ee_onelife_fnc_forceSpectator;
        };

        if (_onrejoin && didJIP) exitWith {
            if (_disteleport) then {
                true call a3ee_onelife_fnc_forceSpectator;
                waitUntil { !isNil "a3ee_onelife_preload_finished" };
                waitUntil { time > 2 };  /* engine bug; time not synced */
                /* the first call sometimes doesn't open spectator */
                true call a3ee_onelife_fnc_forceSpectator;
                waitUntil {
                    sleep 1;
                    [] call a3ee_onelife_fnc_checkTeleport;
                };
                [] call a3ee_onelife_fnc_doTeleport;
            } else {
                true call a3ee_onelife_fnc_forceSpectator;
            };
        };
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;
