#include "\a3\3DEN\UI\macros.inc"

/*
 * big edit boxes
 */
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

/*
 * big code boxes
 */
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

/*
 * CfgGlasses dropdown menu
 */
/* ugly, but works, eh */
class Combo;
class Controls;
class Title;
class Value;
class ComboCfgGlasses : Combo {
    class Controls : Controls {
        class Title : Title {};
        class Value : Value {
            /* static items */
            class Items {
                class NoChange {
                    text = "No change";
                    data = "";
                };
            };
            /* dynamic items */
            class ItemsConfig {
                path[] = {"CfgGlasses"};
                localConfig = 0;  /* no description.ext */
                propertyText = "displayName";
                propertyPicture = "picture";
                sort = 1;
            };
        };
    };
};

/*
 * like UnitInsignia, but with custom values
 */
class ComboInsignia : Combo {
    class Controls : Controls {
        class Title : Title {};
        class Value : Value {
            /* static items */
            class Items {
                class NoChange {
                    text = "No change";
                    data = "";
                };
                class None {
                    text = "Use player insignia";
                    data = "a3ee_use_player_insignia";
                };
            };
            /* dynamic items */
            class ItemsConfig {
                path[] = {"CfgUnitInsignia"};
                localConfig = 1;  /* with description.ext */
                propertyText = "displayName";
                propertyPicture = "texture";
                sort = 1;
            };
        };
    };
};

/*
 * like the Face control, but with NoChange
 */
class Face;
class FaceWithNoChange : Face {
    class Controls : Controls {
        class Title : Title {};
        class Value : Value {
            class Items {
                class NoChange {
                    text = "No change";
                    data = "";
                };
            };
        };
    };
};
