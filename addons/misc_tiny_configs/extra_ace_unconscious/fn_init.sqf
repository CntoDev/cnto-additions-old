/*
 * extend unconsciousness with additional conditions
 *
 * note that these apply ONLY if the unit actually goes unconscious by existing
 * ACE logic, not by taking damage
 */

[
    "ace_unconscious",
    Extra_ACE_Unconscious_fnc_manageTimer
] call CBA_fnc_addEventHandler;

[{
    /* active head injury */
    ((_this select 0) getHitPointDamage "hithead") > 0;
}, {
    /*
     * minium unconscious time extension
     * (ace_medical_fnc_setUnconscious hardcodes DEFAULT_DELAY, hence this hack)
     */
    private _endtime = _unit getVariable ["extra_ace_unconscious_wakeup", 0];
    _endtime > time;
}] call ace_medical_fnc_addUnconsciousCondition;
