class CfgPatches {
    class a3aa_ee_persistent_callsign {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"a3aa_ee_shared"};
    };
};

class CfgFunctions {
    class a3aa_ee_persistent_callsign {
        class modules {
            file = "\a3aa\ee\persistent_callsign";
            class restore;
        };
    };
};

class Cfg3DEN {
    class Group {
        class AttributeCategories {
            class Init {
                class Attributes {
                    class a3aa_ee_persistent_callsign {
                        property = "a3aa_ee_persistent_callsign";
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
                class a3aa_ee {
                    items[] += {
                        "a3aa_ee_persistent_callsign_restore"
                    };
                };
                class a3aa_ee_persistent_callsign_restore {
                    text = "Restore persistent Callsigns";
                    picture = "\a3\Modules_F_Curator\Data\portraitradio_ca.paa";
                    action = "collect3DENHistory { [] call a3aa_ee_persistent_callsign_fnc_restore }";
                };
            };
        };
    };
};
