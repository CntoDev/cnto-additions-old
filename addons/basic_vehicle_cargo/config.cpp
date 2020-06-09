/*
 * some mods add custom magazines / rocket ammo / etc. into various boxes
 * and vehicles, even those outside of their mod(s) - worse yet, they do it
 * via init EHs, so one can't just override this via configs
 * - as a last resort, wait a short while after each vehicle init and clear
 *   its inventory completely, replacing it with some basic universal loot
 */

class CfgPatches {
    class Basic_Vehicle_Cargo {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "3den",
            "cba_xeh"     /* dynamic class hook from module */
        };
    };
};

class CfgFunctions {
    class Basic_Vehicle_Cargo {
        class All {
            file = "\basic_vehicle_cargo";
            class hookClasses;
            class setCargo;
        };
    };
};

class CfgVehicles {
    class All;
    class Logic : All {
        class EventHandlers;
    };
    class basic_vehicle_cargo_filler : Logic {
        scope = 2;
        /* no Category => Other */
        vehicleClass = "Modules";
        icon = "iconCrateWpns";
        displayName = "Basic vehicle cargo";
        class EventHandlers : EventHandlers {
            class process_cargo { init = "if (!is3DEN) then { (_this select 0) spawn Basic_Vehicle_Cargo_fnc_hookClasses }"; };
        };
    };
};

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class StateSpecial {
                class Attributes {
                    class DontClearCargo {
                        property = "basic_vehicle_cargo_dontclear";
                        control = "Checkbox";
                        displayName = "Don't clear vehicle cargo";
                        expression = "_this setVariable [""%s"",_value,true]";
                        condition = "objectHasInventoryCargo";
                        defaultValue = "false";
                        tooltip = "By default, all inventories of vehicles are wiped 1sec after mission starts, to prevent stupid mods from adding their items via init EHs into random vehicles. This prevents mission makers from specifying loadout via Eden UI. Use this option to disable the functionality at your own risk.\n\nThis option is useless without the appropriate cargo-clearing editor module placed.";
                    };
                };
            };
        };
    };
};
