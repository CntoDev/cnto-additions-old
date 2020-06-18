params ["_unit", "_face"];

if (is3DEN) then {
    _unit setFace _face;
} else {
    _unit setVariable ["a3aa_ee_extended_gear_face", _face, true];
};
