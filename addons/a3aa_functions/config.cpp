/*
 * misc useful functions
 */

class CfgPatches {
    class A3AA_Functions {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class a3aa {
        class cargo {
            file = "\a3aa_functions\cargo";
            class boxGuard;
        };
    };
    /* historical namespace from editor_extensions, deprecated */
    class a3ee {
        class All {
            file = "\a3aa_functions\a3ee";
            class modifyLoadout;
            class godlike;
            class boxGuard {
                file = "\a3aa_functions\cargo\fn_boxGuard.sqf";
            };
        };
    };
};
