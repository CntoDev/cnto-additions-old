class CfgPatches {
    class a3aa_join_group {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class a3aa_join_group {
        class all {
            file = "\a3aa\join_group";
            class init { postInit = 1; };
            class broadcastAction;
        };
    };
};
