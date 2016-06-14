/*
 * call '_code' for each Curator-selected group, passing the group as arg,
 */

params ["_code", "_ares_args"];

[
    [
        _code,
        {
            params ["_code", "_groups"];
            {
                if (typeName _code == "ARRAY") then {
                    [(_code select 0), _x] call (_code select 1);
                } else {
                    _x call _code;
                };
            } forEach _groups;
        }
    ],
    _ares_args,
    true
] call Ares_Extras_fnc_Selection;
