/*
 * reduce sound in vehicles to make direct speech communication viable
 */
class CfgPatches {
    class a3aa_map_trackers {
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
    class a3aa_map_trackers {
        class all {
            file = "\a3aa\map_trackers";
            class init;
            class hookMapDisplay;
            class hookGetReadyDisplays;  /* scheduled by init */
            class setupDrawEH;
            class groupUpdater;       /* scheduled by init */
            class getGroupIcon;
            class unitUpdater;        /* scheduled by init */
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_map_trackers {
        init = "[] call a3aa_map_trackers_fnc_init";
    };
};

#define COMMA ,
#define QUOTE(arg) #arg
#define CONCAT4(a,b,c,d) a##b##c##d
#define HOOK_CONTROL(idc) \
    a3aa_map_trackers = ##QUOTE( \
        CONCAT4( \
            [_this select 0, \
            COMMA, \
            idc, \
            ] spawn a3aa_map_trackers_fnc_hookMapDisplay \
        ) \
    )

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"
//#include "\A3\ui_f\hpp\defineResincl.inc"  /* included by the above */

class Extended_DisplayLoad_EventHandlers {
    /*
     * these don't seem to be triggered via CBA's DisplayLoad XEH, so just hook
     * them up manually from fn_hookGetReadyDisplays
     *
     * // IDD_MAIN_MAP
     * class RscDisplayMainMap {
     *     HOOK_CONTROL(IDC_MAP);
     * };
     * // IDD_INTEL_GETREADY
     * class RscDisplayGetReady {
     *     HOOK_CONTROL(IDC_MAP);
     * };
     * // IDD_SERVER_GET_READY
     * class RscDisplayServerGetReady {
     *     HOOK_CONTROL(IDC_MAP);
     * };
     * // IDD_CLIENT_GET_READY
     * class RscDisplayClientGetReady {
     *     HOOK_CONTROL(IDC_MAP);
     * };
     */

    /* IDD_RSCDISPLAYCURATOR */
    class RscDisplayCurator {
        HOOK_CONTROL(IDC_RSCDISPLAYCURATOR_MAINMAP);
    };

#ifdef unused_for_now
    /* IDD_CUSTOMINFO_MINIMAP */
    class RscCustomInfoMiniMap {
        HOOK_CONTROL(IDC_MINIMAP);
    };
#endif
};
