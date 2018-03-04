/*
 * when a unit is spawned and the init EH fires, all its skills are set to 0
 * - some time later (after our EH runs), some game logic sets the skills to
 * the default 0.5, potentially overriding what we would have set
 *
 * this makes us unable to detect if this foreign skill modification was done
 * by a user via Zeus or by this arbitrary logic
 *
 * therefore do a special procedure on unit init and allow any other invocation
 * (from another EH or periodically) only after this special procedure has
 * completed
 */

0 = _this spawn {
    /* wait for the skills to become 0.5, account for dedi server rounding */
    waitUntil { abs ((_this skill "general")-0.5) < 1e-2 };

    /* unblock updateSkills and call it */
    _this setVariable ["AI_Dynamic_Skill_initialized", true];
    isNil { _this call AI_Dynamic_Skill_fnc_updateSkills };
};
