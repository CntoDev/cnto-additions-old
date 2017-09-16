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

} forEach (
#include "skill_values.h"
);
