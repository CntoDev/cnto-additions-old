/*
 * periodically monitor units for behaviour changes and adjust skills
 * accordingly
 */

if (!isServer) exitWith {};

0 = [] spawn {
    /* wait a bit after game start */
    sleep 5;
    waitUntil {
        /* update skills of all units every ~10 seconds, spread out */
        private _ents = entities [["CAManBase"], [], true, true] - allPlayers;
        if (count _ents > 0) then {
            private _slp = 10 / count _ents;
            {
                /* unscheduled/atomic, in case something deletes the unit */
                isNil {
                    if (alive _x) then {  /* also !isNull */
                        _x call AI_Dynamic_Skill_fnc_updateSkills;
                    };
                };
                sleep _slp;
            } forEach _ents;
        };
        false;
    };
};
