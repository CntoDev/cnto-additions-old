/*
 * dynamically update skills of a unit
 */

/* some easy checks that don't need atomic context */
if (!isServer || !simulationEnabled _this || isPlayer _this) exitWith {};
private _initialized = _this getVariable "a3aa_ai_dynamic_skill_initialized";
if (isNil "_initialized") exitWith {};

/* unscheduled/atomic, in case something deletes the unit */
isNil { _this call a3aa_ai_dynamic_skill_fnc_updateSkillsUnscheduled };
