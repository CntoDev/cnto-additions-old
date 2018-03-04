/*
 * misc default settings for AI skill
 */

class CfgPatches {
    class AI_Dynamic_Skill {
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
    class AI_Dynamic_Skill {
        class All {
            file = "\ai_dynamic_skill";
            class setSkills;
            class updateSkills;
            class watchSkills { postInit = 1; };
            class currentSkills;
            class scheduleInitSkills;
        };
    };
};

class Extended_Init_Eventhandlers {
    class CAManBase {
        class AI_Dynamic_Skill {
            init = "(_this select 0) call AI_Dynamic_Skill_fnc_scheduleInitSkills";
        };
    };
};
class Extended_GetInMan_Eventhandlers {
    class CAManBase {
        class AI_Dynamic_Skill {
            getinman = "isNil { (_this select 0) call AI_Dynamic_Skill_fnc_updateSkills }";
        };
    };
};
class Extended_GetOutMan_Eventhandlers {
    class CAManBase {
        class AI_Dynamic_Skill {
            getoutman = "isNil { (_this select 0) call AI_Dynamic_Skill_fnc_updateSkills }";
        };
    };
};
class Extended_SeatSwitchedMan_Eventhandlers {
    class CAManBase {
        class AI_Dynamic_Skill {
            seatswitchedman = "isNil { (_this select 0) call AI_Dynamic_Skill_fnc_updateSkills }";
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
            class AI_Dynamic_Skill {
                init = "(_this select 0) call AI_Dynamic_Skill_fnc_updateSkills";
            };
        };
    };
};
#endif

/* linear X=Y from 0.2 up, don't ask how, took 3 days of research */
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

class Cfg3DEN {
    class Attributes {
        class Slider;
        class Controls;
        class Value;
        /* allow full 0-1 setting, not just 0.2-1 */
        class Skill : Slider {
            class Controls : Controls {
                class Value : Value {
                    sliderRange[] = {0, 1};
                };
            };
        };
    };
};
