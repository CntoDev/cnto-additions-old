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
        /* simple wrappers for a circular buffer */
        class cbuff {
            file = "\a3aa_functions\cbuff";
            class cbuffInit;
            class cbuffGet;
            class cbuffSet;
        };
        /* fast implementation of a "dict" (hash lookup table) */
        class hash {
            file = "\a3aa_functions\hash";
            class hashAppendUnique;
            class hashCntIncrement;
            class hashGet;
            class hashInit;
            class hashKeyExists;
            class hashKeyVals;
            class hashKeys;
            class hashSet;
            class hashValues;
        };
        /* mission persistence (boxes, vehicles, terrain) saving/loading */
        class saveload {
            file = "\a3aa_functions\saveload";
            class loadCargo;
            class loadTerrain;
            class loadVehicle;
            class saveCargo;
            class saveTerrain;
            class saveVehicle;
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
