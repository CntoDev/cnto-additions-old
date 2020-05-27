class CfgPatches {
    class Chestpack {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"ace_interaction"};
    };
};

class CfgVehicles {
    class Man;
    class CAManBase : Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                exceptions[] += {"isNotSwimming"};
                class Chestpack_onChest {
                    displayName = "Backpack on Chest";
                    statement = "[(_this select 0), ((_this select 0) call Chestpack_fnc_removeBackpack)] call Chestpack_fnc_setChestpack;";
                    condition = "isNil {(_this select 0) getVariable ""Chestpack_pack""} && !isNull unitBackpack (_this select 0)";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };
                class Chestpack_onBack {
                    displayName = "Chestpack on Back";
                    statement = "[(_this select 0), ((_this select 0) call Chestpack_fnc_removeChestpack)] call Chestpack_fnc_setBackpack;";
                    condition = "!isNil {(_this select 0) getVariable ""Chestpack_pack""} && isNull unitBackpack (_this select 0)";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };
                /*class Chestpack_onGround {
                    displayName = "Chestpack on Ground";
                    statement = "call Chestpack_onGround";
                    condition = "!isNil {(_this select 0) getVariable ""Chestpack_pack""}";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };*/
                class Chestpack_swapPacks {
                    displayName = "Swap Chest/Back packs";
                    statement = "private _back = (_this select 0) call Chestpack_fnc_removeBackpack; [(_this select 0), ((_this select 0) call Chestpack_fnc_removeChestpack)] call Chestpack_fnc_setBackpack; [(_this select 0), _back] call Chestpack_fnc_setChestpack;";
                    condition = "!isNil {(_this select 0) getVariable ""Chestpack_pack""} && !isNull unitBackpack (_this select 0)";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                /* corpse or unconscious */
                class Chestpack_onChest {
                    displayName = "Backpack on Chest";
                    statement = "[(_this select 0), ((_this select 0) call Chestpack_fnc_removeBackpack)] call Chestpack_fnc_setChestpack;";
                    condition = "isNil {(_this select 0) getVariable ""Chestpack_pack""} && !isNull unitBackpack (_this select 0) && {!alive (_this select 0) || (_this select 0) getVariable [""ACE_isUnconscious"", false]}";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };
                class Chestpack_onBack {
                    displayName = "Chestpack on Back";
                    statement = "[(_this select 0), ((_this select 0) call Chestpack_fnc_removeChestpack)] call Chestpack_fnc_setBackpack;";
                    condition = "!isNil {(_this select 0) getVariable ""Chestpack_pack""} && isNull unitBackpack (_this select 0) && {!alive (_this select 0) || (_this select 0) getVariable [""ACE_isUnconscious"", false]}";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };
                /*class Chestpack_onGround {
                    displayName = "Chestpack on Ground";
                    statement = "call Chestpack_onGround";
                    condition = "!isNil {(_this select 0) getVariable ""Chestpack_pack""} && {!alive (_this select 0) || (_this select 0) getVariable [""ACE_isUnconscious"", false]}";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };*/
                class Chestpack_swapPacks {
                    displayName = "Swap Chest/Back packs";
                    statement = "private _back = (_this select 0) call Chestpack_fnc_removeBackpack; [(_this select 0), ((_this select 0) call Chestpack_fnc_removeChestpack)] call Chestpack_fnc_setBackpack; [(_this select 0), _back] call Chestpack_fnc_setChestpack;";
                    condition = "!isNil {(_this select 0) getVariable ""Chestpack_pack""} && !isNull unitBackpack (_this select 0) && {!alive (_this select 0) || (_this select 0) getVariable [""ACE_isUnconscious"", false]}";
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                };
            };
        };
        /* vanilla Actions */
        /*class UserActions {
            class Chestpack_onChest {};
            class Chestpack_onBack {};
        };*/
    };
    /*class Reammobox;
    class Bag_base : Reammobox {
        class ACE_Actions {
            class ACE_MainActions {
                class Chestpack_onChest {
                    displayName = "Groundpack on Chest";
                    statement = "call Chestpack_fromGround";
                    condition = "!isNil {(_this select 1) getVariable ""Chestpack_pack""}";
                };
            };
        };
    };*/
};

class CfgFunctions {
    class Chestpack {
        class All {
            file = "\chestpack\functions";
            //class init { postInit = 1; };
            class setChestpack;
            class removeChestpack;
            class setBackpack;
            class removeBackpack;
        };
    };
};
