if (is3DEN || !local _this) exitWith {};
{
    _x params ["_name", "_def"];
    private _final = [
            [0,1],
            0.5,  /* default in editor/zeus */
            _this skill _name,
            [0,1],
            _def  /* center around our default */
        ] call AI_Skill_Defaults_fnc_interpolate;
    _this setSkill [_name, _final];
} forEach (
#include "skill_values.h"
);
