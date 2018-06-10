0 = [] spawn {
    /*
     * wake unconscious units up only ...
     */
    waitUntil { !isNil "ace_medical_unconsciousConditions" };
    ace_medical_unconsciousConditions append [
        /* ... if they have less than 0.4 pain (actual, ignoring suppressed) */
        {((_this select 0) getVariable ["ace_medical_pain", 0]) > 0.4},
        /* ... if they don't have an immediate head injury */
        {((_this select 0) getHitPointDamage "hitHead") > 0}
    ];

#ifdef this_is_unused
    if (!hasInterface) exitWith {};
    /*
     * if a player is above 0.7 pain, let there be a chance for them to
     * randomly fall unconscious
     * (10% every 6 seconds ~ 100% in 60 seconds)
     *
     * disabled for now, ACE seems to do a good job of setting this on
     * instant shock (head or chest hit, etc.)
     */
    waitUntil {
        private _pain = player getvariable ["ace_medical_pain", 0];
        if (alive player && {_pain > 0.7 && random 1 < 0.1}) then {
            [player, true, 10 + random 10, true]
                call ace_medical_fnc_setUnconscious;
        };
        sleep 6;
        false;
    };
#endif
};
