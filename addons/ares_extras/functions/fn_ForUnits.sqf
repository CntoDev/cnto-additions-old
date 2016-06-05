/*
 * call '_code' for each Curator-selected unit, passing the unit as arg
 */

params ["_code", "_ares_args"];

[
    [
        _code,
        {
            params ["_code", "_units"];
            {
                if (typeName _code == "ARRAY") then {
                    [(_code select 0), _x] call (_code select 1);
                } else {
                    _x call _code;
                };
            } forEach _units;
        }
    ],
    _ares_args
] call Ares_Extras_fnc_Selection;
