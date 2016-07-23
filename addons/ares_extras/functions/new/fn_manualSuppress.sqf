/*
 * suppress a unit, manually firing bullets from the script
 *
 *   _duration is how long the suppression should take (will round up
 *   to the last magazine, stops after reload)
 *
 *   _fudge is sleep before suppression start and 3x sleep after end,
 *   to randomize fire within a group of units
 */

params ["_dst", "_unit"];
private _script = _unit getVariable ["suppression_script_active", scriptNull];
if (!scriptDone _script) exitWith {};

_script = _this spawn {
    params ["_dst", "_unit", ["_duration", 60+random 60], ["_fudge", random 10]];
    private _orig_skill = [];
    private _endtime = time + _duration + _fudge*3;

    if (_unit != vehicle _unit) exitWith {};

    private _dst_is_soldier = false;
    if (_dst isEqualType objNull) then {
        _dst_is_soldier = true;
    };

    private _findenemy = {
        params ["_pos", "_enemyto"];
        {
            if (side _enemyto getFriend side _x < 0.6) exitWith { _x };
        } forEach (_pos nearEntities 100);
    };

    private _orig_skill = [_unit skill "aimingAccuracy",
                           _unit skill "aimingShake",
                           _unit skill "aimingSpeed"];
    if (_dst_is_soldier) then {
        _unit setSkill ["aimingAccuracy", 0.5];
        _unit setSkill ["aimingShake", 0.5];
        _unit setSkill ["aimingSpeed", 1];
    } else {
        _unit setSkill ["aimingAccuracy", 0.1];
        _unit setSkill ["aimingShake", 0.01];
        _unit setSkill ["aimingSpeed", 1];
        _dst = [_dst, _unit] call _findenemy;
    };
    if (isNil "_dst") exitWith {};

    _unit setCombatMode "YELLOW";
    _unit setBehaviour "COMBAT";
    _unit setUnitPos "MIDDLE";

    _unit disableAI "PATH";
    _unit doWatch _dst;
    _unit reveal _dst;
    _unit doTarget _dst;
    sleep _fudge;

    private _weap = currentWeapon _unit;
    private _mag = currentMagazine _unit;
    private _mode = currentWeaponMode _unit;
    while {time < _endtime} do {
        if (!alive _unit || isNil "_dst" || {isNull _dst}) exitWith {};
        while {_unit ammo _weap > 0} do {
            if (!alive _dst) then {
                _dst = [position _dst, _unit] call _findenemy;
            };
            if (!alive _unit || isNil "_dst" || {isNull _dst}) exitWith {};
            _unit reveal _dst;
            _unit doWatch _dst;
            _unit doTarget _dst;
            sleep (0.1 + random 0.05);
            _unit forceWeaponFire [_weap, _mode];
        };
        _unit doTarget objNull; _unit doWatch objNull;
        _unit addMagazine _mag;
        reload _unit;
        waitUntil {!alive _unit || (_unit ammo _weap > 0)};
    };

    _unit doTarget objNull;
    _unit doWatch objNull;
    _unit enableAI "PATH";
    _unit setUnitPos "AUTO";
    _unit setSkill ["aimingAccuracy", _orig_skill select 0];
    _unit setSkill ["aimingShake", _orig_skill select 1];
    _unit setSkill ["aimingSpeed", _orig_skill select 1];
};
_unit setVariable ["suppression_script_active", _script];
