class CfgPatches {
    class a3aa_ee_team_colors {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"a3aa_ee_shared"};
    };
};

class CfgFunctions {
    class a3aa_ee_team_colors {
        class all {
            file = "\a3aa\ee\team_colors";
            class setColor;
        };
    };
};

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class Control {
                class Attributes {
                    class a3aa_ee_team_colors {
                        property = "a3aa_ee_team_colors";
                        control = "Combo";
                        displayName = "Team color";
                        expression = "[_this, _value] call a3aa_ee_team_colors_fnc_setColor";
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
