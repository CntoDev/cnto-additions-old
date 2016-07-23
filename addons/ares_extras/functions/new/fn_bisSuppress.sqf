/*
 * suppress a unit, using BI functionality
 *
 *   _duration is how long the suppression should take (will round up
 *   to the nearest sleep period)
 *
 *   _fudge is sleep before suppression start and 3x sleep after end,
 *   to randomize fire within a group of units
 */

params ["_dst", "_unit"];
private _script = _unit getVariable ["suppression_script_active", scriptNull];
if (!scriptDone _script) exitWith {};

_script = _this spawn {
    params ["_dst", "_unit", ["_duration", 60+random 60], ["_fudge", random 10]];
    private _endtime = time + _duration + _fudge*3;

    _unit reveal _dst;
    sleep _fudge;

    _unit doSuppressiveFire _dst;
    sleep 5;
    while {time < _endtime} do {
        _unit reveal _dst;
        _unit doSuppressiveFire _dst;
        sleep 5;
    };
};
_unit setVariable ["suppression_script_active", _script];
