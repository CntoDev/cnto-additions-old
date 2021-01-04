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
                _x call a3aa_ai_dynamic_skill_fnc_updateSkills;
                _x call a3aa_ai_dynamic_skill_fnc_warnBadCfg;
                sleep _slp;
            } forEach _ents;
        };
        false;
    };
};
