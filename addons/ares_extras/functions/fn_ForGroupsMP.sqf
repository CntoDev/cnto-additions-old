/*
 * call '_code' for each Curator-selected group, passing the group as arg
 *
 * the execution is guaranteed to run only where each group is local (default)
 * or where the user specified (object, ClientID or 0, like remoteExec)
 */

params ["_code", "_ares_args", "_clientid"];

private _passed_args = [_code];
if (!isNil "_clientid") then {
    _passed_args pushBack _clientid;
};

[
    [
        _passed_args,
        {
            params ["_args", "_groups"];
            _args params ["_code", "_clientid"];
            {
                private _where = (units _x select 0);
                if (!isNil "_clientid") then {
                    _where = _clientid;
                };

                /* if a custom arg was given, create a composite [] arg out of
                 * it and the group in this iteration */
                if (typeName _code == "ARRAY") then {
                    _code params ["_codearg", "_code"];
                    [[_codearg, _x], _code] remoteExec ["BIS_fnc_call", _where];

                /* else simply use the group as arg */
                } else {
                    [_x, _code] remoteExec ["BIS_fnc_call", _where];
                };
            } forEach _groups;
        }
    ],
    _ares_args,
    true
] call Ares_Extras_fnc_Selection;
