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

/* doesn't work, squashes lines together
class Attributes {
    class EditMulti3;
    class EditMulti5: EditMulti3 {
        class Controls { class Title; class Value; };
    };
    class EditBig15: EditMulti5 {
        h = 5 * SIZE_M * GRID_H;
        class Controls: Controls {
            class Title: Title { h = 5 * SIZE_M * GRID_H; };
            class Value: Value { h = 5 * SIZE_M * GRID_H; };
        };
    };
};
*/
