if (is3DEN || !local _this) exitWith {};
{
    _x params ["_name", "_def"];
    _this setSkill [_name, _def];

    private _final = _this skillFinal _name;
    if (_def >= 0.2 && abs (_def-_final) > 1e-4) then {
        systemChat format [
            "warning: skill %1 is %2, but skillFinal is %3",
            _name, _def, _final
        ];
    };
} forEach (
#include "skill_values.h"
);
