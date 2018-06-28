/*
 * extend ACE3 unconsciousness logic
 */

class CfgPatches {
    class Extra_ACE_Unconscious {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "ace_medical"
        };
    };
};

class CfgFunctions {
    class Extra_ACE_Unconscious {
        class All {
            file = "\misc_tiny_configs\extra_ace_unconscious";
            class init { postInit = 1; };
            class manageTimer;
        };
    };
};
