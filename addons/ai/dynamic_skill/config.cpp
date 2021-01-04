class CfgPatches {
    class a3aa_ai_dynamic_skill {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Data_F",
            "A3_3DEN",
            "cba_settings",
            "cba_events",
            "cba_xeh"
        };
    };
};

class CfgFunctions {
    class a3aa_ai_dynamic_skill {
        class all {
            file = "\a3aa\ai\dynamic_skill";
            class setSkills;
            class updateSkills;
            class updateSkillsUnscheduled;
            class watchSkills { postInit = 1; };
            class currentSkills;
            class scheduleInitSkills;
            class warnBadCfg;
            class initSettings;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_ai_dynamic_skill {
        init = "[] call a3aa_ai_dynamic_skill_fnc_initSettings";
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
