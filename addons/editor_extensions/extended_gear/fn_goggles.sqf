params ["_unit", "_goggles"];

if (is3DEN) then {
    if (_goggles == "None") then {
        removeGoggles _unit;
    } else {
        _unit linkItem _goggles;
    };
} else {
    _unit setVariable ["a3aa_ee_extended_gear_goggles", _goggles, true];
};
