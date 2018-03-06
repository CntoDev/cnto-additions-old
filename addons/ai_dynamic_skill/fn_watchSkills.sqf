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
        private _cnt = count _ents;
        if (_cnt > 0) then {
            private _slp = 10 / _cnt;
            {
                /* unscheduled/atomic, in case something deletes the unit */
                isNil {
                    _x call AI_Dynamic_Skill_fnc_updateSkills;
                };
                sleep _slp;
            } forEach _ents;
        };
        false;
    };
};
