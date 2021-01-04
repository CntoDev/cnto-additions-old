class CfgPatches {
    class a3aa_acre_unconscious {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class a3aa_acre_unconscious {
        class all {
            file = "\a3aa\acre_unconscious";
            class init { postInit = 1; };
        };
    };
};
