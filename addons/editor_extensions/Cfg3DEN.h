/* expand Transformation on Logic by default, so that Size config
 * for area-using modules can be seen */
class Logic {
    class AttributeCategories {
        class Transformation {
            collapsed = 0;
        };
    };
};

class Object {
    class AttributeCategories {
        class A3EE {
            displayName = "A3EE";
            collapsed = 1;
            class Attributes {
                class IntoSimpleObject {
                    property = "a3ee_simpleobject";
                    control = "Checkbox";
                    displayName = "Turn into SimpleObject";
                    expression = "[_this,_value] call a3ee_fnc_oa_simpleObject";
                    defaultValue = "false";
                    tooltip = "Re-create the object as SimpleObject (see wiki) before mission start, reducing performance impact. Good for simple props, sandbags, etc. Makes object indestructible and disables simulation.\n\n***Do NOT use on soldiers and normal vehicles, it makes them flip 180deg and display broken animation states (ie. unit firing animation). If unsure, test first.***";
                };
            };
        };
    };
};

#include "\a3\3DEN\UI\macros.inc"
class Attributes {
    class EditMulti3;
    class EditMulti5 : EditMulti3 {
        class Controls { class Title; class Value; };
    };
    class EditBig15 : EditMulti5 {
        h = 15 * SIZE_M * GRID_H;
        class Controls : Controls {
            class Title: Title { h = 15 * SIZE_M * GRID_H; };
            class Value: Value { h = 15 * SIZE_M * GRID_H; };
        };
    };

    class EditCodeMulti5: EditMulti5 {
        class Controls { class Title; class Value; };
    };
    class EditCode30: EditCodeMulti5 {
        h = 30 * SIZE_XS * GRID_H;
        class Controls: Controls {
            class Title: Title { h = 30 * SIZE_XS * GRID_H; };
            class Value: Value { h = 30 * SIZE_XS * GRID_H; };
        };
    };
};
