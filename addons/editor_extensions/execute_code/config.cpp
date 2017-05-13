class CfgPatches {
    class Editor_Extensions_execute_code {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_execute_code {
        class all {
            file = "\editor_extensions\execute_code";
            class decomment;
            class execModule;
        };
    };
};

class CfgVehicles {
    class Logic;
    class a3ee_module_base : Logic {
        class EventHandlers;
    };
    class a3ee_exec_code : a3ee_module_base {
        scope = 2;
        icon = "\a3\3DEN\Data\CfgWaypoints\Scripted_ca.paa";
        displayName = "Execute code";
        class Attributes {
            class enabledexec {
                property = "a3ee_enabledexec";
                control = "Checkbox";
                displayName = "Enable";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "Enable this module. Uncheck to disable without having to remove the module completely.";
            };
            class execonmp {
                property = "a3ee_execonmp";
                control = "Combo";
                displayName = "Execute on (MP)";
                expression = "_this setVariable [""%s"",_value]";
                class Values {
                    class All { name = "All"; value = 0; };
                    class Server_Only { name = "Server only"; value = 2; };
                    class Clients_Only { name = "Clients only"; value = -2; };
                };
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class forjip {
                property = "a3ee_forjip";
                control = "Checkbox";
                displayName = "Exec for JIP players";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
            };
            class execenv {
                property = "a3ee_execenv";
                control = "Combo";
                displayName = "Environment";
                expression = "_this setVariable [""%s"",_value]";
                class Values {
                    class Unscheduled { name = "Unscheduled"; value = 0; };
                    class Scheduled { name = "Scheduled"; value = 1; };
                };
                typeName = "NUMBER";
                defaultValue = "1";
            };
            class runoninit {
                property = "a3ee_runoninit";
                control = "Checkbox";
                displayName = "Run on init";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "Run once, on mission initialization.";
            };
            class runonrespawn {
                property = "a3ee_runonrespawn";
                control = "Checkbox";
                displayName = "Run on respawn";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "false";
                tooltip = "Run on each player respawn.\n\nWorks only on clients and fires only for respawn of client's own player unit, not for any other units.";
            };
            class keepmodule {
                property = "a3ee_keepmodule";
                control = "Checkbox";
                displayName = "Keep module after mission start";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "false";
                tooltip = "Keep this module around at all times and pass it as an object argument to the executed code. This allows the use of this module as a reference point (for positions, distances, synchronizedObjects, etc.).";
            };
            class code {
                property = "a3ee_code";
                control = "EditCode30";
                displayName = "Code";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = """""";
                typeName = "STRING";
                /* does only init line -like validation, forbits passed local vars
                * like _this on the compiler level - unusable for ie. respawn code */
                //validate = "expression";
                tooltip = "Code to run. No valid arguments are passed except when the ""Keep module"" checkbox is selected.";
            };
        };
        class EventHandlers : EventHandlers {
            class exec_code { init = "if (isServer) then { (_this select 0) call a3ee_execute_code_fnc_execModule }"; };
        };
    };
    class a3ee_exec_code_3den : a3ee_module_base {
        scope = 2;
        icon = "\a3\3DEN\Data\CfgWaypoints\Scripted_ca.paa";
        displayName = "Execute code (Eden)";
        class Attributes {
            class 3den_code {
                property = "a3ee_3den_code";
                control = "EditCode30";
                displayName = "Code";
                expression = "if (is3DEN) then { [] call (compile (_value call a3ee_execute_code_fnc_decomment)) } else { deleteVehicle _this }";
                defaultValue = """""";
                typeName = "STRING";
                tooltip = "Code to run in the Eden editor whenever this module is pasted, placed from a composition, loaded in a mission in Eden or when you press ""OK"". Thus make sure the code can be run any number of times in succession without breaking. No valid arguments are passed, do not parse any.";
            };
        };
    };
};
