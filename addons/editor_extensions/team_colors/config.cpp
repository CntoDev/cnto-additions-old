class CfgPatches {
    class Editor_Extensions_team_colors {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_team_colors {
        class All {
            file = "\editor_extensions\team_colors";
            class setColor;
        };
    };
};

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class Control {
                class Attributes {
                    class a3ee_teamcolor {
                        property = "a3ee_teamcolor";
                        control = "Combo";
                        displayName = "Team color";
                        expression = "[_this, _value] call a3ee_team_colors_fnc_setColor";
                        condition = "objectBrain";
                        class Values {
                            class Default { name = "Default"; value = "MAIN"; };
                            class Red { name = "Red"; value = "RED"; };
                            class Green { name = "Green"; value = "GREEN"; };
                            class Blue { name = "Blue"; value = "BLUE"; };
                            class Yellow { name = "Yellow"; value = "YELLOW"; };
                        };
                        typeName = "STRING";
                        defaultValue = """MAIN""";
                        tooltip = "Set unit color inside a group.";
                    };
                };
            };
        };
    };
};
