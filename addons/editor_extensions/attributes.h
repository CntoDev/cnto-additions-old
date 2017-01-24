/*
 * just object/group attributes, Eden UI global attributes are elsewhere
 */

class Object {
    class AttributeCategories {
        class Control {
            class Attributes {
                class a3ee_teamcolor {
                    property = "a3ee_teamcolor";
                    control = "Combo";
                    displayName = "Team color";
                    expression = "[_this, _value] call a3ee_fnc_o_teamColor";
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

class Group {
    class AttributeCategories {
        class Init {
            class Attributes {
                class a3ee_persistent_callsign {
                    property = "a3ee_persistent_callsign";
                    control = "Edit";
                    displayName = "Persistent Callsign";
                    expression = "";
                    typeName = "STRING";
                    defaultValue = """""";
                    tooltip = "Set a persistent callsign for a group. This callsign can be restored via the Eden editor Tools menu, overriding the default Callsign field above.";
                };
            };
        };
    };
};
