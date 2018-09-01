/*
 * assign passed groups into a "task force", letting them to share
 * known targets
 */

if (!isServer) exitWith {
    _this remoteExec ["Ares_Extras_fnc_assignTaskForce", 2];
};

private _new_groups = _this;

/* if any group is in any existing TF, leave it */
{
    _x call Ares_Extras_fnc_unassignTaskForce;
} forEach _new_groups;

/* create new TF */
if (count _new_groups >= 2) then {
    private _tf = +_new_groups;
    ares_extras_task_forces pushBack _tf;
    {
        _x setVariable ["ares_extras_task_force", _tf];
    } forEach _new_groups;
};
