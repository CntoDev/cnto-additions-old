/*
 * remove rakurs - remove an annoying RHS scope which has higher Arsenal
 * priority than <None>, being the default for many (even vanilla) weapons
 */

class CfgPatches {
    class Remove_Rakurs {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "rhs_c_weapons"
        };
    };
};

class CfgWeapons {
    class rhs_acc_1p63;
    class rhs_acc_rakursPM : rhs_acc_1p63 {
        scope = 1;
    };
};
