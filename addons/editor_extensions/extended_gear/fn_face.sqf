params ["_unit", "_face"];

if (is3DEN) then {
    _unit setFace _face;
} else {
    _unit setVariable ["a3ee_extgear_face", _face, true];
};
