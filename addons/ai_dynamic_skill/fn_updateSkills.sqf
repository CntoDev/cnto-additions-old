/*
 * dynamically update skills of a unit
 */

/* some easy checks that don't need atomic context */
if (!isServer) exitWith {};

/* unscheduled/atomic, in case something deletes the unit */
isNil { _this call a3aa_ai_dynamic_skill_fnc_updateSkillsUnscheduled };
