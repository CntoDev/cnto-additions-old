class CfgPatches {
    class a3aa_ai_dynamic_skill {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_xeh",
            "A3_Data_F",
            "A3_3DEN"
        };
    };
};

class CfgFunctions {
    class a3aa_ai_dynamic_skill {
        class all {
            file = "\a3aa\ai_dynamic_skill";
            class setSkills;
            class updateSkills;
            class updateSkillsUnscheduled;
            class watchSkills { postInit = 1; };
            class currentSkills;
            class scheduleInitSkills;
            class warnBadCfg;
        };
    };
};

class Extended_Init_Eventhandlers {
    class CAManBase {
        class a3aa_ai_dynamic_skill {
            init = "(_this select 0) call a3aa_ai_dynamic_skill_fnc_scheduleInitSkills";
        };
    };
};
class Extended_GetInMan_Eventhandlers {
    class CAManBase {
        class a3aa_ai_dynamic_skill {
            getinman = "(_this select 0) call a3aa_ai_dynamic_skill_fnc_updateSkills";
        };
    };
};
class Extended_GetOutMan_Eventhandlers {
    class CAManBase {
        class a3aa_ai_dynamic_skill {
            getoutman = "(_this select 0) call a3aa_ai_dynamic_skill_fnc_updateSkills";
        };
    };
};
class Extended_SeatSwitchedMan_Eventhandlers {
    class CAManBase {
        class a3aa_ai_dynamic_skill {
            seatswitchedman = "(_this select 0) call a3aa_ai_dynamic_skill_fnc_updateSkills";
        };
    };
};

#ifdef doesnt_work_for_all_subclasses
class CfgVehicles {
    class Land;
    class Man : Land {
        class EventHandlers;
    };
    class CAManBase : Man {
        class EventHandlers : EventHandlers {
            class a3aa_ai_dynamic_skill {
                init = "(_this select 0) call a3aa_ai_dynamic_skill_fnc_updateSkills";
            };
        };
    };
};
#endif

/*
 * linear X=Y from 0.2 up, don't ask how, took 3 days of research
 * https://drive.google.com/open?id=1GDzxZpVa1IDFP9GAeHUVrKIiGqKR5jv68qvE-0JhMQ0
 *
 * default UI slider ranges in Eden / Zeus are 0.2 to 1.0, so the user won't set
 * values below 0.2 via UI
 */
class CfgAISkill {
    aimingAccuracy[] = {0,0, 0.5,0, 1,1};
    aimingShake[]    = {0,0, 0.5,0, 1,1};
    aimingSpeed[]    = {0,0, 0.5,0, 1,1};
    endurance[]      = {0,0, 0.5,0, 1,1};
    spotDistance[]   = {0,0, 0.5,0, 1,1};
    spotTime[]       = {0,0, 0.5,0, 1,1};
    courage[]        = {0,0, 0.5,0, 1,1};
    reloadSpeed[]    = {0,0, 0.5,0, 1,1};
    commanding[]     = {0,0, 0.5,0, 1,1};
    general[]        = {0,0, 0.5,0, 1,1};
};
