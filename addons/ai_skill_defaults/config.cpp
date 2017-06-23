/*
 * misc default settings for AI skill
 */

class CfgPatches {
    class AI_Skill_Defaults {
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
    class AI_Skill_Defaults {
        class All {
            file = "\ai_skill_defaults";
            class setDefaultSkill;
            class interpolate;
        };
    };
};

class Extended_Init_Eventhandlers {
    class CAManBase {
        class AI_Skill_Defaults {
            init = "(_this select 0) call AI_Skill_Defaults_fnc_setDefaultSkill";
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
            class AI_Skill_Defaults {
                init = "(_this select 0) call AI_Skill_Defaults_fnc_setDefaultSkill";
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
