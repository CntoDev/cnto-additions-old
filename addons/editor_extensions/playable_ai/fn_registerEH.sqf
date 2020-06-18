if (is3DEN) exitWith {};

a3aa_ee_playable_ai_args = [
    _this getVariable "stop_ai",
    compile (_this getVariable "custom_code")
];

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    if (!local _unit || !alive _unit || side _unit == sideLogic) exitWith {};

    a3aa_ee_playable_ai_args params ["_stop_ai", "_code"];

    if (_stop_ai) then {
        _unit disableAI "AUTOTARGET";
        _unit disableAI "TARGET";
        _unit setBehaviour "AWARE";
        (group _unit) setCombatMode "GREEN";
        _unit setUnitPos "DOWN";
        doStop _unit;
        _unit doWatch objNull;
    };

    _unit call _code;

    true;
}];

deleteVehicle _this;
