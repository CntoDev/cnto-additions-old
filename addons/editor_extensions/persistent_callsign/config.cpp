class CfgPatches {
    class Editor_Extensions_persistent_callsign {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_persistent_callsign {
        class modules {
            file = "\editor_extensions\persistent_callsign";
            class restore;
        };
    };
};

class Cfg3DEN {
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
};

class ctrlMenuStrip;
class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class A3EE {
                    items[] += {
                        "A3EE_Restore_Persistent_Callsigns"
                    };
                };
                class A3EE_Restore_Persistent_Callsigns {
                    text = "Restore persistent Callsigns";
                    picture = "\a3\Modules_F_Curator\Data\portraitradio_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_persistent_callsign_fnc_restore }";
                };
            };
        };
    };
};
