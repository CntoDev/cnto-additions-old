/*
 * Set up the vanilla Dynamic Group system on mission start.
 */

class CfgPatches {
    class Dynamic_Groups {
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
    class Dynamic_Groups {
        class All {
            file = "\dynamic_groups";
            class init;
            class missionSetup;  /* scheduled by init */
        };
    };
};

class Extended_PreInit_EventHandlers {
    class Dynamic_Groups {
        init = "[] call Dynamic_Groups_fnc_init";
    };
};
