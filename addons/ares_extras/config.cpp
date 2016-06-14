class CfgPatches {
    class Ares_Extras {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Ares"};
    };
};

class CfgFunctions {
    class Ares_Extras {
        class All {
            file = "\ares_extras\functions";
            class init { postInit = 1; };
            class teleport;
            class execServer;
            class addRemoveNVGs;
            class vehLightOn;
            class setPosAGLS;
            class Dialog;
            class ForGroups;
            class ForGroupsMP;
            class ForUnits;
            class ForUnitsMP;
            class Selection;
            class StdDistances;
        };
    };
};
