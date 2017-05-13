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
            class checkApex;
            class checkOverload;
            class fillRoleDesc;
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
                        "A3EE_Check_Apex",
                        "A3EE_Check_Overload",
                        "A3EE_Fill_Role_Desc"
                    };
                };
                class A3EE_Check_Apex {
                    text = "Check for Apex objects";
                    picture = "\a3\Modules_F_Curator\Data\portraitordnancerocket_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_fnc_checkApex }";
                };
                class A3EE_Check_Overload {
                    text = "Check for overloaded units";
                    picture = "\a3\Modules_F_Curator\Data\portraitrespawninventory_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_fnc_checkOverload }";
                };
                class A3EE_Fill_Role_Desc {
                    text = "Fill in Role Description";
                    picture = "\a3\Modules_F_Curator\Data\portraitmissionname_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_fnc_fillRoleDesc }";
                };
            };
        };
    };
};
