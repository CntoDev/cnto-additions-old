params ["_unit", "_insignia"];

/* special case - load classname from client profile */
if (_insignia == "a3aa_ee_extended_gear_use_player_insignia") then {
    private _class = profileNamespace getVariable "a3aa_ee_extended_gear_player_insignia";
    if (!isNil "_class") then {
        _insignia = _class;
    } else {
        /* default to "No change" */
        _insignia = "";
    };
};

if (is3DEN) then {
    /* some races when loading mission? */
    0 = [_unit, _insignia] spawn {
        uiSleep 0.5;
        _this call BIS_fnc_setUnitInsignia;
    };
} else {
    _unit setVariable ["a3aa_ee_extended_gear_insignia", _insignia, true];
};
