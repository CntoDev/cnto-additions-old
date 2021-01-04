[
    "a3aa_ai_dynamic_skill_immobile",
    "CHECKBOX",
    ["Crew stays in immobile", "Let AI vehicle crew stay inside an otherwise immobile vehicle (wheels destroyed).\nIf the vehicle takes critical damage, the crew still dismounts."],
    ["Arma Additions", "AI Dynamic Skill"],
    true,  /* default */
    true   /* isGlobal */
] call CBA_settings_fnc_init;

["CBA_settingsInitialized", {
    a3aa_ai_dynamic_skill_settings_initialized = true;
}] call CBA_fnc_addEventHandler;
