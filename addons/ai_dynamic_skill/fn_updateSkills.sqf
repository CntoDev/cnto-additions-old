/*
 * dynamically update skills of a unit
 */

/* some easy checks that don't need atomic context */
if (!isServer || !simulationEnabled _this || isPlayer _this) exitWith {};
private _initialized = _this getVariable "AI_Dynamic_Skill_initialized";
if (isNil "_initialized") exitWith {};

/* unscheduled/atomic, in case something deletes the unit */
isNil { _this call AI_Dynamic_Skill_fnc_updateSkillsUnscheduled };
