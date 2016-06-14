/*
 * call '_code' for each Curator-selected unit, passing the unit as arg
 *
 * the execution is guaranteed to run only where each unit is local (default)
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
            params ["_args", "_units"];
            _args params ["_code", "_clientid"];
            {
                private _where = _x;
                if (!isNil "_clientid") then {
                    _where = _clientid;
                };

                /* if a custom arg was given, create a composite [] arg out of
                 * it and the unit in this iteration */
                if (typeName _code == "ARRAY") then {
                    _code params ["_codearg", "_code"];
                    [[_codearg, _x], _code] remoteExec ["BIS_fnc_call", _where];

                /* else simply use the unit as arg */
                } else {
                    [_x, _code] remoteExec ["BIS_fnc_call", _where];
                };
            } forEach _units;
        }
    ],
    _ares_args
] call Ares_Extras_fnc_Selection;
