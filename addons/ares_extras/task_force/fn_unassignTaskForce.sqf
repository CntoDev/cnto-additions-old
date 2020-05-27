/*
 * remove a group from any task force(s)
 */

if (!isServer) then {
    _this remoteExec ["Ares_Extras_fnc_unassignTaskForce", 2];
};

private _group = _this;

private _tf = _group getVariable "ares_extras_task_force";
if (!isNil "_if") then {
    private _idx = _tf find _group;
    if (_idx > -1) then {
        _tf set [_idx, grpNull];
    };
    _group setVariable ["ares_extras_task_force", nil];
};
