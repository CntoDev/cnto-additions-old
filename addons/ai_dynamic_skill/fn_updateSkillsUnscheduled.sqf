/*
 * run in unscheduled environment to avoid scripting errors of commands
 * accessing a deleted unit (ie.)
 */

private _unit = _this;

if (!alive _unit) exitWith {};

private _prev = _unit getVariable "AI_Dynamic_Skill_prevskills";
private _curr = _unit call AI_Dynamic_Skill_fnc_currentSkills;
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
    if (_veh isKindOf "Car") then {
        _aimingAccuracy = 0.55;
    } else {
        _aimingAccuracy = 0.6;
    };
    /* when in COMBAT, don't exit a vehicle if it becomes immobilized */
    if (behaviour _unit == "COMBAT") then {
        _veh allowCrewInImmobile true;
    } else {
        _veh allowCrewInImmobile false;
    };
} else {
    _aimingAccuracy = 0.5;
};

/*
 * give slight Parkinson's to guerrilla factions when shooting
 * List of "Guerillas" Factions:
 * FIA (BluFor, Ind, OpFor)
 * Gendarmerie (BluFor)
 * IDAP (Civ)
 * Livonian Park Rangers (Ind)
 * Syndikat (Ind)
 * Looters (Ind)
 * PO African Militia (Ind, OpFor, Civ)
 * PO Middle Eastern Militia (Ind, OpFor, Civ)
 * PO Boko Haram (OpFor)
 * PO ChDKZ (OpFor, Civ)
 * PO Irish Republican Army (Ind)
 * PO Islamic State (Ind, OpFor)
 * PO Chernarussian National Insurgents (Ind)
 * PO Ultranationalists (Ind)
 * PO United Armed Forces of Novorossiya (OpFor)
 * PO Ulster Volunteer Force (Ind)
 * RDS Russians (Civ)
 * RHS ChDKZ (Ind, OpFor)
 * RHS CDF National Guard (Ind)
 * RHS NAPA (Ind)
 * RHS Tanoan Liberation Army (Ind)
 * 3CB Afghan National Police (BluFor)
 * 3CB Chernarus Local Defense Volunteers (BluFor)
 * 3CB Chernarus Nationalist Militia (Ind)
 * 3CB Chernarus Communist Militia (OpFor)
 * 3CB Chernarus Civilians (BluFor, Ind, OpFor, Civ)
 * 3CB Chernarus Police Department (BluFor, Ind, OpFor)
 * 3CB Takistan Civilians (BluFor, Ind, OpFor, Civ)
 * 3CB Takistan Pro-Government Militia (BluFor)
 * 3CB Takistan Tribal Fighters (Ind)
 * 3CB Takistan Insurgents (OpFor)
 * 3CB Takistan National Police (BluFor, Ind, OpFor)
 */
private _guerrilla_factions = [
    "BLU_G_F", "BLU_GEN_F", "CIV_F", "CIV_IDAP_F", "I_LPR", "IND_C_F", "IND_G_F", "IND_L_F", "OPF_G_F",
	"LOP_AFR", "LOP_AFR_Civ", "LOP_AFR_OPF", "LOP_AM", "LOP_AM_OPF", "LOP_BH",
    "LOP_ChDKZ", "LOP_CHR_Civ", "LOP_IRA", "LOP_ISTS", "LOP_ISTS_OPF", "LOP_NAPA", "LOP_TAK_Civ", "LOP_UA", "LOP_US", "LOP_UVF",
	"rds_rus_civ",
    "rhs_faction_insurgents", "rhsgref_faction_cdf_ng", "rhsgref_faction_cdf_ng_b",	"rhsgref_faction_chdkz", "rhsgref_faction_chdkz_g", "rhsgref_faction_nationalist", "rhsgref_faction_tla",
	"UK3CB_ANP_B", "UK3CB_CCM_B", "UK3CB_CCM_I", "UK3CB_CCM_O", "UK3CB_CHC_B", "UK3CB_CHC_C", "UK3CB_CHC_I", "UK3CB_CHC_O", "UK3CB_CPD_B", "UK3CB_CPD_I", "UK3CB_CPD_O", "UK3CB_TKC_B", "UK3CB_TKC_I", "UK3CB_TKC_O", "UK3CB_TKC_C", "UK3CB_TKM_B", "UK3CB_TKM_I", "UK3CB_TKM_I", "UK3CB_TKP_B", "UK3CB_TKP_I", "UK3CB_TKP_O"
];
if (faction _unit in _guerrilla_factions) then {
    _aimingShake = 0.4;
} else {
    _aimingShake = 0.9;  /* 1.0 seems to do unnatural insta-headshot-kills */
};

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
    case "AWARE":  { 0.7 };
    case "COMBAT": { 0.95 };
    default { 0.5 };
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
[_unit, _skills] call AI_Dynamic_Skill_fnc_setSkills;

/* set new "prev" skills */
_unit setVariable ["AI_Dynamic_Skill_prevskills", _skills];
