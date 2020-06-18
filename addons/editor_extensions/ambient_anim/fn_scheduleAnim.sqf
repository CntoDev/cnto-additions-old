if (is3DEN) exitWith {};

/* run scheduled because synchronizedObjects needs extra time */
0 = _this spawn {

private _animlist = _this getVariable "animlist";
private _maxdelay = _this getVariable "maxdelay";
private _exitcombat = _this getVariable "exitcombat";
private _exitanim = _this getVariable "exitanim";

private _parsed_list = _animlist splitString ",. """;
if (_parsed_list isEqualTo []) exitWith {};

waitUntil {
    !isNil { synchronizedObjects _this } &&
        !(synchronizedObjects _this isEqualTo []);
};
private _synced_soldiers = (synchronizedObjects _this) select {
    _x isKindOf "CAManBase";
};
if (_synced_soldiers isEqualTo []) exitWith {};

/* randomize once, on the server */
private _unit_anims = _synced_soldiers apply {
    [_x, selectRandom _parsed_list, random _maxdelay];
};

/* flag the units as active (for later combat/etc. check) */
{
    _x setVariable ["a3aa_ee_ambient_anim_active", true, true];
} forEach _synced_soldiers;

/* watch (only on the server) for combat state changes */
0 = [_synced_soldiers, _exitcombat, _exitanim] spawn {
    params ["_units", "_exitcombat", "_exitanim"];
    private _discard = [];
    sleep 3;
    waitUntil {
        /* remove combat/dead/deleted/etc. units */
        _units = _units - [objNull] - _discard;
        _discard = [];

        /* check all units every ~2 seconds, spread out */
        private _cnt = count _units;
        if (_cnt > 0) then {
            private _slp = 2 / _cnt;
            {
                if (
                    /* dead or deleted */
                    !alive _x ||
                    /* entered combat state */
                    { _exitcombat && behaviour _x in ["STEALTH", "COMBAT"] } ||
                    /* injured */
                    count (((getAllHitPointsDamage _x) select 2) - [0]) > 0 ||
                    /* made inactive by scripting */
                    !(_x getVariable ["a3aa_ee_ambient_anim_active", false])
                ) then {
                    _x setVariable ["a3aa_ee_ambient_anim_active", nil, true];
                    if (alive _x) then {
                        [[_x, _exitanim], {
                            params ["_unit", "_exit"];
                            _unit enableAI "ANIM";
                            _unit switchMove _exit;
                        }] remoteExec ["call"];
                    };
                    _discard pushBack _x;
                };
                sleep _slp;
            } forEach _units;
            false;
        } else {
            true;
        };
    };
};

/* tell clients to play the animations */
[
    [_unit_anims, _maxdelay],
    {
        params ["_unit_anims", "_maxdelay"];

        //sleep 1;
        if (didJIP) then {
            /*
             * on JIP, the server broadcasts the current unit animation, but
             * without regard for delay, so we still run the logic below,
             * overriding the anim phase .. after loading ingame
             */
            sleep 10;
        } else {
            waitUntil { !isNil "BIS_fnc_init" };
        };

        {
            _x params ["_unit", "_anim", "_delay"];
            if (_delay > 0) then {
                0 = [_unit, _anim, _delay] spawn {
                    params ["_unit", "_anim", "_delay"];
                    sleep _delay;
                    [_unit, _anim] call a3aa_ee_ambient_anim_fnc_doAnim;
                };
            } else {
                [_unit, _anim] call a3aa_ee_ambient_anim_fnc_doAnim;
            };
        } forEach _unit_anims;
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;

};
