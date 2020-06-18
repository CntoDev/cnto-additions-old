/*
 * verify CustomAILevel Arma3Profile setting during the first 10 minutes
 */

if (time > 600) exitWith {};
if (time < 60 || !isDedicated) exitWith {};

private _unit = _this;

if (isNil "a3aa_ai_dynamic_skill_latest_warning") then {
    a3aa_ai_dynamic_skill_latest_warning = 0;
};
if (time - a3aa_ai_dynamic_skill_latest_warning < 10) exitWith {};

{
    private _name = _x;

    /* atomic, just in case the skill is modified from elsewhere */
    private ["_skill", "_final"];
    isNil {
        _skill = _unit skill _name;
        _final = _unit skillFinal _name;
    };

    /*
     * val >= 0.2: because our CfgAISkill override doesn't guarantee anything
     *             below 0.2, due to engine limitations of CfgAISkill
     * set > 0:    because we cannot distinguish between createVehicle and
     *             createUnit, the latter having initially skill/skillFinal 0
     * abs check:  because of floating point MP errors in the final skill
     */
    if (_skill >= 0.2 && _skill > 0 && abs (_skill-_final) > 0.05) then {
        private _msg = format [
            "a3aa_ai_dynamic_skill: skill %1 is %2, but skillFinal is %3",
            _name, _skill toFixed 2, _final toFixed 2
        ];
        _msg remoteExec ["systemChat"];
        diag_log _msg;
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

a3aa_ai_dynamic_skill_latest_warning = time;
