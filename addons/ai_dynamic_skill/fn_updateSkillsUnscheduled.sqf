/*
 * run in unscheduled environment to avoid scripting errors of commands
 * accessing a deleted unit (ie.)
 */

private _unit = _this;

if (!simulationEnabled _unit || !alive _unit || isPlayer _unit) exitWith {};
private _initialized = _this getVariable "a3aa_ai_dynamic_skill_initialized";
if (isNil "_initialized") exitWith {};

private _prev = _unit getVariable "a3aa_ai_dynamic_skill_prevskills";
private _curr = _unit call a3aa_ai_dynamic_skill_fnc_currentSkills;
/* if _prev are not identical to current skills, user has modified them, exit */
if (!isNil "_prev" && {!(_prev isEqualTo _curr)}) exitWith {};

private [
    "_aimingAccuracy",
    "_aimingShake",
    "_aimingSpeed",
    "_endurance",
    "_spotDistance",
    "_spotTime",
    "_courage",
    "_reloadSpeed",
    "_commanding",
    "_general"
];

/* -------------------------------------------------------------------------- */

/*
 * make infantry fairly accurate, vehicles more so
 * (avoid >=0.9 for vehicles as it makes them single-shoot MGs)
 */
private _veh = vehicle _unit;
if (_veh != _unit && {_unit in [driver _veh, gunner _veh, commander _veh]}) then {
    if (_veh isKindOf "Tank_F" || {_veh isKindOf "Helicopter" || _veh isKindOf "Plane"}) then {
        _aimingAccuracy = 0.7;
    } else {
        _aimingAccuracy = 0.5;
    };
    /* when in COMBAT, don't exit a vehicle if it becomes immobilized */
    if (behaviour _unit == "COMBAT" && a3aa_ai_dynamic_skill_immobile) then {
        _veh allowCrewInImmobile true;
    } else {
        _veh allowCrewInImmobile false;
    };
} else {
    _aimingAccuracy = 0.5;
};

/*
 * give slight Parkinson's to guerrilla factions when shooting
 */
private _guerrilla_factions = [
    "BLU_G_F", "IND_G_F", "OPF_G_F", "CIV_F",
    "rhs_faction_insurgents", "rhsgref_faction_chdkz", "rhsgref_faction_chdkz_g",
    "LOP_AFR", "LOP_AFR_Civ", "LOP_AFR_OPF", "LOP_AM", "LOP_AM_OPF", "LOP_BH",
    "LOP_ChDKZ", "LOP_CHR_Civ", "LOP_NAPA", "LOP_TAK_Civ", "LOP_UA", "LOP_UVF"
];
if (faction _unit in _guerrilla_factions) then {
    _aimingShake = 0.4;
} else {
    _aimingShake = 0.9;  /* 1.0 seems to do unnatural insta-headshot-kills */
};
/* some hidden overrides for manual tuning */
if (!isNil "a3aa_ai_dynamic_skill_easymode") then { _aimingShake = 0.4 };
if (!isNil "a3aa_ai_dynamic_skill_hardmode") then { _aimingShake = 0.9 };

_aimingSpeed = 0.95;
_endurance = 1.0;
_spotDistance = 1.0;

/*
 * react slower to visual contact outside combat
 * (allow enemies to ie. reposition between trees, don't spot them instantly
 *  as they leave hard cover)
 */
_spotTime = switch (behaviour _unit) do {
    case "STEALTH";
    case "AWARE":  { 0.4 };
    case "COMBAT": { 0.95 };
    default { 0.2 };
};

_courage = 0.6;   /* allows retreat when under fire */
_reloadSpeed = 1.0;
_commanding = 1.0;
_general = 1.0;


/* -------------------------------------------------------------------------- */

private _skills = [
    _aimingAccuracy, _aimingShake, _aimingSpeed, _endurance, _spotDistance,
    _spotTime, _courage, _reloadSpeed, _commanding, _general
];
[_unit, _skills] call a3aa_ai_dynamic_skill_fnc_setSkills;

/* set new "prev" skills */
_unit setVariable ["a3aa_ai_dynamic_skill_prevskills", _skills];
