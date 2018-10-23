class CfgPatches {
    class A3AA_Functions_Saveload {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class a3aa_saveload {
        class All {
            file = "\a3aa_functions\saveload\helpers";
            class baseClass;
            class cargoIsEmpty;
            class isTransport;
            class weapNativeLinked;
        };
    };
};
