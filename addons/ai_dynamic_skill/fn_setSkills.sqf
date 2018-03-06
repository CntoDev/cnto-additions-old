_this params ["_unit", "_skills"];

#define SKILLS "aimingAccuracy", "aimingShake", "aimingSpeed", "endurance", \
               "spotDistance", "spotTime", "courage", "reloadSpeed", \
               "commanding", "general"

{
    _unit setSkill [_x, _skills select _forEachIndex];
} forEach [ SKILLS ];

/* verify CustomAILevel Arma3Profile setting during the first 10 minutes */
if (time < 600 && {time > 60 && isDedicated}) then {
    private ["_skill", "_final"];

    if (isNil "AI_Dynamic_Skill_latest_warning") then {
	AI_Dynamic_Skill_latest_warning = 0;
    };

    if (time - AI_Dynamic_Skill_latest_warning > 10) then {
        {
            private _name = _x;
            private _val = _skills select _forEachIndex;
    
            _skill = _unit skill _name;
            _final = _unit skillFinal _name;
    
            /*
             * val >= 0.2: because our CfgAISkill override doesn't guarantee anything
             *             below 0.2, due to engine limitations of CfgAISkill
             * set > 0:    because we cannot distinguish between createVehicle and
             *             createUnit, the latter having initially skill/skillFinal 0
             * abs check:  because of floating point MP errors in the final skill
             */
            if (_val >= 0.2 && _skill > 0 && abs (_val-_final) > 0.05) then {
                private _msg = format [
                    "ai_dynamic_skill: skill %1 is %2, but skillFinal is %3",
                    _name, _val toFixed 2, _final toFixed 2
                ];
                _msg remoteExec ["systemChat"];
                diag_log _msg;
            };
        } forEach [ SKILLS ];
        AI_Dynamic_Skill_latest_warning = time;
    };
};
