_this params ["_unit", "_skills"];
{
    private _name = _x;
    private _val = _skills select _forEachIndex;

    if (time < 600) then {
        /* atomic, prevents other mods from interfering */
        private ["_set", "_final"];

        _unit setSkill [_name, _val];
        _set = _unit skill _name;
        _final = _unit skillFinal _name;

        /*
         * val >= 0.2: because our CfgAISkill override doesn't guarantee anything
         *             below 0.2, due to engine limitations of CfgAISkill
         * set > 0:    because we cannot distinguish between createVehicle and
         *             createUnit, the latter having initially skill/skillFinal 0
         * abs check:  because of floating point errors in the final skill
         */
        if (_val >= 0.2 && _set > 0 && abs (_val-_final) > 1e-2) then {
            systemChat format [
                "warning: skill %1 is %2, but skillFinal is %3",
                _name, _val, _final
            ];
        };
    } else {
        _unit setSkill [_name, _val];
    };
} forEach [
    "aimingAccuracy",
    "aimingShake",
    "aimingSpeed",
    "endurance",
    "spotDistance",
    "spotTime",
    "courage",
    "reloadSpeed",
    "commanding",
    "general"
];
