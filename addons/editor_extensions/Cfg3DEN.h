/* expand Transformation on Logic by default, so that Size config
 * for area-using modules can be seen */
class Logic {
    class AttributeCategories {
        class Transformation {
            collapsed = 0;
        };
    };
};

#include "attributes.h"

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
