class CfgPatches {
    class a3aa_ee_menu {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"a3aa_ee_shared"};
    };
};

class CfgFunctions {
    class a3aa_ee_menu {
        class all {
            file = "\a3aa\ee\menu";
            class fillRoleDesc;
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
                        "a3aa_ee_menu_fill_role_desc"
                    };
                };
                class a3aa_ee_menu_fill_role_desc {
                    text = "Fill in Role Description";
                    picture = "\a3\Modules_F_Curator\Data\portraitmissionname_ca.paa";
                    action = "collect3DENHistory { [] call a3aa_ee_menu_fnc_fillRoleDesc }";
                };
            };
        };
    };
};
