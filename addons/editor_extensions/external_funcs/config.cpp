class CfgPatches {
    class Editor_Extensions_external_funcs {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee {
        class external_funcs {
            file = "\editor_extensions\external_funcs";
            class modifyLoadout;
            class godlike;
            class boxGuard;
        };
    };
};
