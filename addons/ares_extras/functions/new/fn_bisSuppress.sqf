/*
 * suppress a unit, using BI functionality
 *
 *   _duration is how long the suppression should take (will round up
 *   to the nearest sleep period)
 *
 *   _fudge is sleep before suppression start and 3x sleep after end,
 *   to randomize fire within a group of units
 */

0 = _this spawn {
    params ["_dst", "_unit"];

    private _script = _unit getVariable ["suppression_script_active", scriptNull];
    if (!scriptDone _script) then {
        terminate _script;
        waitUntil { scriptDone _script };
        /* cleanup target */
        private _dst = _unit getVariable "ares_extras_suppress_target";
        if (!isNil "_dst") then {
            deleteVehicle _dst;
            _unit setVariable ["ares_extras_suppress_target", nil];
        };
    };

    _script = _this spawn {
        params ["_dst", "_unit", ["_duration", 60+random 60], ["_fudge", random 10]];
        private _endtime = time + _duration + _fudge*3;

        /* create dummy target as duSuppressiveFire is broken with position */
        // if it's not an object == it is a position array
        if (!(_dst isEqualType objNull)) then {
            _dst = createVehicle ["Land_HelipadEmpty_F", _dst, [], 0, "CAN_COLLIDE"];
            _unit setVariable ["ares_extras_suppress_target", _dst];
        };
        _unit reveal _dst;
        sleep _fudge;

        _unit doSuppressiveFire _dst;
        sleep 5;
        while {time < _endtime} do {
            _unit reveal _dst;
            _unit doSuppressiveFire _dst;
            sleep 5;
        };

        if (typeOf _dst == "Land_HelipadEmpty_F") then {
            deleteVehicle _dst;
            _unit setVariable ["ares_extras_suppress_target", nil];
        };
    };
    _unit setVariable ["suppression_script_active", _script];
};
