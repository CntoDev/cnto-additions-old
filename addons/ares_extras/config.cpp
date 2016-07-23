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
            class Dialog;
            class ForGroups;
            class ForGroupsMP;
            class ForUnits;
            class ForUnitsMP;
            class Selection;
            class StdDistances;
        };
        /* these came from the original A3MT */
        class A3MT {
            file = "\ares_extras\functions\a3mt";
            class teleport;
            class addRemoveNVGs;
            class vehLightOn;
            class setPosAGLS;
        };
    };
};
