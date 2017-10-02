if (is3DEN || !local _this) exitWith {};
{
    _x params ["_name", "_def"];

    /* atomic, prevents other mods from interfering */
    private ["_set", "_final"];
    isNil {
        _this setSkill [_name, _def];
        _set = _this skill _name;
        _final = _this skillFinal _name;
    };

    /*
     * def >= 0.2: because our CfgAISkill override doesn't guarantee anything
     *             below 0.2, due to engine limitations of CfgAISkill
     * set > 0:    because we cannot distinguish between createVehicle and
     *             createUnit, the latter having initially skill/skillFinal 0
     * abs check:  because of floating point errors in the final skill
     */
    if (_def >= 0.2 && _set > 0 && abs (_def-_final) > 1e-2) then {
        systemChat format [
            "warning: skill %1 is %2, but skillFinal is %3",
            _name, _def, _final
        ];
    };
} forEach (
#include "skill_values.h"
);
