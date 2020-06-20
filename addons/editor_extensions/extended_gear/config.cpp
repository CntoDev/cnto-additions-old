class CfgPatches {
    class a3aa_ee_extended_gear {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"a3aa_ee_shared"};
    };
};

class CfgFunctions {
    class a3aa_ee_extended_gear {
        class all {
            file = "\a3aa\ee\extended_gear";
            class goggles;
            class insignia;
            class face;
            class initExtendedGear { postInit = 1; };
        };
    };
};

class Cfg3DEN {
    class Attributes {
        /*
         * CfgGlasses dropdown menu
         */
        /* ugly, but works, eh */
        class Combo;
        class Controls;
        class Title;
        class Value;
        class a3aa_ee_extended_gear_combo_cfg_glasses : Combo {
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
        class a3aa_ee_extended_gear_combo_insignia : Combo {
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
                            data = "a3aa_ee_extended_gear_use_player_insignia";
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
        class a3aa_ee_extended_gear_face_nochange : Face {
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
    };

    class Object {
        class AttributeCategories {
            class extended_gear {
                displayName = "Extended Gear";
                collapsed = 1;
                class Attributes {
                    class goggles {
                        property = "a3aa_ee_extended_gear_goggles";
                        control = "a3aa_ee_extended_gear_combo_cfg_glasses";
                        displayName = "Goggles";
                        expression = "[_this, _value] call a3aa_ee_extended_gear_fnc_goggles";
                        condition = "objectBrain";
                        defaultValue = "''";
                        tooltip = "Override goggles/glasses/facewear on a player.\n\nUse ""None"" to force remove any goggles.";
                    };
                    class insignia {
                        property = "a3aa_ee_extended_gear_insignia";
                        control = "a3aa_ee_extended_gear_combo_insignia";
                        displayName = "Insignia";
                        expression = "[_this, _value] call a3aa_ee_extended_gear_fnc_insignia";
                        condition = "objectBrain";
                        defaultValue = "''";
                        tooltip = "Insignia from CfgUnitInsignia (mod or description.ext).\n\n""Use player insignia"" tries to find a variable named ""a3aa_ee_extended_gear_player_insignia"" in the client profile, specifying a CfgUnitInsignia class name - if found, it is assigned. Otherwise behaves like ""No change"".";
                    };
                    class face {
                        property = "a3aa_ee_extended_gear_face";
                        control = "a3aa_ee_extended_gear_face_nochange";
                        displayName = "Face";
                        expression = "[_this, _value] call a3aa_ee_extended_gear_fnc_face";
                        condition = "objectBrain";
                        defaultValue = "''";
                        tooltip = "Override player face.";
                    };
                };
            };
        };
    };
};
