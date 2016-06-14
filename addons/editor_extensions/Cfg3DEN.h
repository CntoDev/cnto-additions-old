class Object {
    class AttributeCategories {
        class StateSpecial {
            class Attributes {
                class TurnIntoSimpleObject {
                    property = "intoSimpleObject";
                    displayName = "Turn into SimpleObject";
                    control = "Checkbox";
                    defaultValue = "false";
                    expression = "[_this,_value] call a3ee_fnc_intoSimpleObject";
                    tooltip = "Re-create the object as SimpleObject (see wiki) before mission start, reducing performance impact. Good for simple props, sandbags, etc. Makes object indestructible and disables simulation.";
                };
            };
        };
    };
};
