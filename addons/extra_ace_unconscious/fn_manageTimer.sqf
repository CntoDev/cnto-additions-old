params ["_unit", "_state"];
if (!local _unit) exitWith {};

if (_state) then {
    /* unit going unconscious; delay waking up by 1-3 minutes */
    private _delay = 60 + random 120;
    _unit setVariable ["extra_ace_unconscious_wakeup", time + _delay, true];
};
