class CfgPatches {
    class a3aa_dynamic_groups {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_settings",
            "cba_events",
            "cba_xeh"
        };
    };
};

class CfgFunctions {
    class a3aa_dynamic_groups {
        class all {
            file = "\a3aa\dynamic_groups";
            class init;
            class missionSetup;  /* scheduled by init */
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_dynamic_groups {
        init = "[] call a3aa_dynamic_groups_fnc_init";
    };
};
