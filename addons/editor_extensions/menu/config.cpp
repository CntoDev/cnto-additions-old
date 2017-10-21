class CfgPatches {
    class Editor_Extensions_menu {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee {
        class menu {
            file = "\editor_extensions\menu\functions";
            class checkOverload;
            class fillRoleDesc;
            class checkAcreIds;
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
                        "A3EE_Fill_Role_Desc"
                    };
                };
                class A3EE_Fill_Role_Desc {
                    text = "Fill in Role Description";
                    picture = "\a3\Modules_F_Curator\Data\portraitmissionname_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_fnc_fillRoleDesc }";
                };

                class Tools {
                    items[] += { "A3EE_Compositions" };
                };
                class A3EE_Compositions {
                    text = "A3EE Compositions Checks";
                    picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_custom_ca.paa";
                    items[] = {
                        "A3EE_Check_Overload",
                        "A3EE_Check_ACRE_IDs"
                    };
                };
                class A3EE_Check_Overload {
                    text = "Check for overloaded units";
                    picture = "\a3\Modules_F_Curator\Data\portraitrespawninventory_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_fnc_checkOverload }";
                };
                class A3EE_Check_ACRE_IDs {
                    text = "Check for unique ACRE2 radios";
                    picture = "\a3\Modules_F_Curator\Data\portraitradio_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_fnc_checkAcreIds }";
                };
            };
        };
    };
};
