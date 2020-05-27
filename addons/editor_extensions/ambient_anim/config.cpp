class CfgPatches {
    class Editor_Extensions_ambient_anim {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_ambient_anim {
        class all {
            file = "\editor_extensions\ambient_anim";
            class scheduleAnim;
            class doAnim;
        };
    };
};

class CfgVehicles {
    class Logic;
    class a3ee_module_base : Logic {
        class EventHandlers;
    };
    class a3ee_ambient_anim : a3ee_module_base {
        scope = 2;
        icon = "A3\Modules_F_Tacops\Data\CivilianPresenceUnit\icon32_ca.paa";
        displayName = "Ambient animation";
        class Attributes {
            class structured_hint {
                property = "a3ee_structured_hint";
                control = "StructuredText1";
                description = "Hint: Synchronize soldier units to this module.";
            };
            class animlist {
                property = "a3ee_animlist";
                control = "Edit";
                displayName = "Anim";
                expression = "_this setVariable [""%s"",_value]";
                typeName = "STRING";
                defaultValue = """""";
                tooltip = "Animation classname. If multiple (comma-separated) are specified, a random one is chosen and played.";
            };
            class maxdelay {
                property = "a3ee_maxdelay";
                control = "EditShort";
                displayName = "Random delay";
                expression = "_this setVariable [""%s"",_value]";
                typeName = "NUMBER";
                defaultValue = "0";
                tooltip = "Wait up to the specified amount of seconds before applying the animation. Useful when multiple adjacent units share the same animation and you want to avoid their jarring frame-perfect sync with each other.";
            };
            class exitcombat {
                property = "a3ee_exitcombat";
                control = "Checkbox";
                displayName = "Combat cancels animation";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "When the unit's group enters COMBAT state, exit with the Exit animation.";
            };
            class exitanim {
                property = "a3ee_exitanim";
                control = "Combo";
                displayName = "Exit animation";
                expression = "_this setVariable [""%s"",_value]";
                class Values {
                    class Standing { name = "Switch to standing"; value = "amovpercmstpsraswrfldnon"; };
                    class Crouching { name = "Switch to crouching"; value = "amovpknlmstpsraswrfldnon"; };
                    class Prone { name = "Switch to prone"; value = "amovppnemstpsraswrfldnon"; };
                };
                typeName = "STRING";
                defaultValue = "0";
                tooltip = "What anim to switch to when cancelling the animation(s) specified above.\n\nThe switching transition should be as close to the ambient animation pose as possible (ie. squatting animation should switch to crouching).";
            };
        };
        class EventHandlers : EventHandlers {
            class exec_code { init = "if (isServer) then { (_this select 0) call a3ee_ambient_anim_fnc_scheduleAnim }"; };
        };
    };
};
