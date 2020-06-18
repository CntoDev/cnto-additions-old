class CfgPatches {
    class a3aa_spectator_acre {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class a3aa_spectator_acre {
        class all {
            file = "\a3aa\spectator_acre";
            class acreSpectator { postInit = 1; };
        };
    };
};
