class CfgPatches {
    class Editor_Extensions_extended_gear {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_extended_gear {
        class all {
            file = "\editor_extensions\extended_gear";
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
    };

    class Object {
        class AttributeCategories {
            class Extended_Gear {
                displayName = "Extended Gear";
                collapsed = 1;
                class Attributes {
                    class goggles {
                        property = "a3ee_extgear_goggles";
                        control = "ComboCfgGlasses";
                        displayName = "Goggles";
                        expression = "[_this, _value] call a3ee_extended_gear_fnc_goggles";
                        condition = "objectBrain";
                        defaultValue = "''";
                        tooltip = "Override goggles/glasses/facewear on a player.\n\nUse ""None"" to force remove any goggles.";
                    };
                    class insignia {
                        property = "a3ee_extgear_insignia";
                        control = "ComboInsignia";
                        displayName = "Insignia";
                        expression = "[_this, _value] call a3ee_extended_gear_fnc_insignia";
                        condition = "objectBrain";
                        defaultValue = "''";
                        tooltip = "Insignia from CfgUnitInsignia (mod or description.ext).\n\n""Use player insignia"" tries to find a variable named ""a3ee_player_insignia"" in the client profile, specifying a CfgUnitInsignia class name - if found, it is assigned. Otherwise behaves like ""No change"".";
                    };
                    class face {
                        property = "a3ee_extgear_face";
                        control = "FaceWithNoChange";
                        displayName = "Face";
                        expression = "[_this, _value] call a3ee_extended_gear_fnc_face";
                        condition = "objectBrain";
                        defaultValue = "''";
                        tooltip = "Override player face.";
                    };
                };
            };
        };
    };
};
