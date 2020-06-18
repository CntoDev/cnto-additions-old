if (!is3DEN) exitWith {};

/*
 * run all custom 3den checks to validate the mission
 *
 * the checks can return either true/false for pass/fail or an array of
 * [true/false, [entities]], indicating which entities were affected
 */

private _failed = 0;

private _text = "Mission validation report" + endl +
                "-------------------------" + endl;
{
    _x params ["_checkdesc", "_code"];

    private _res = [] call _code;
    private _ents = [];
    if (_res isEqualType []) then {
        _ents = _res select 1;
        _res = _res select 0;
    };

    if (!_res) then { _failed = _failed + 1 };

    _text = _text + format [
        "%1: %2",
        if (_res) then { "PASSED" } else { "FAILED" },
        _checkdesc
    ] + endl;

    if (count _ents > 0) then {
        _ents = _ents apply {
                    "  - " + (_x call a3aa_ee_validate_mission_fnc_getEntityInfo)
                };
        _text = _text + "  Affected entities:" + endl +
                (_ents joinString endl) + endl;
    };
} forEach [
    [
        "Overloaded units",
        a3aa_ee_validate_mission_fnc_checkOverload
    ],
    [
        "Unique ACRE _ID_ radios",
        a3aa_ee_validate_mission_fnc_checkAcreIds
    ],
    [
        "Playable unit ordering",
        a3aa_ee_validate_mission_fnc_checkOrdering
    ]
];

copyToClipboard _text;

if (_failed > 0) then {
    [format ["%1 validity checks FAILED, report in clipboard.", _failed], 1] call BIS_fnc_3DENNotification;
} else {
    ["All validity checks PASSED, report in clipboard.", 0] call BIS_fnc_3DENNotification;
};
