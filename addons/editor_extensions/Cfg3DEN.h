class Object {
    class AttributeCategories {
        class A3EE {
            displayName = "A3EE";
            collapsed = 1;
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
