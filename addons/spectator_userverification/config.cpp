class CfgPatches {
    class Spectator_UserVerification {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class Spectator_UserVerification {
        class All {
            file = "\spectator_userverification";
            class registerSpectators { postInit = 1 };
            class spectatorCheck { postInit = 1 };
        };
    };
};
