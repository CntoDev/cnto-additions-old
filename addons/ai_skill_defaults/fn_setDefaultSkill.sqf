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
     * set > 0:    because we cannot distinguish between createVehicle and
     *             createUnit, the latter having initially skill/skillFinal 0
     * abs check:  because of floating point errors in the final skill
     */

} forEach (
#include "skill_values.h"
);
