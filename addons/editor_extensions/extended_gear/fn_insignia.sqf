params ["_unit", "_insignia"];

if (is3DEN) then {
    /* some races when loading mission? */
    0 = [_unit, _insignia] spawn {
        uiSleep 0.5;
        _this call BIS_fnc_setUnitInsignia;
    };
} else {
    _unit setVariable ["a3aa_ee_extended_gear_insignia", _insignia, true];
};
