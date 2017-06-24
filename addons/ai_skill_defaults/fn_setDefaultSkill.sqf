if (is3DEN || !local _this) exitWith {};
{
    _x params ["_name", "_def"];
    _this setSkill [_name, _def];
} forEach (
#include "skill_values.h"
);
