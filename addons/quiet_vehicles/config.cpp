class CfgPatches {
    class Quiet_Vehicles {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class Quiet_Vehicles {
        class All {
            file = "\quiet_vehicles";
            class registerEHs { postInit = 1; };
            class adjustSoundVolume;
        };
    };
};
