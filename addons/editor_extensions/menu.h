class ctrlMenuStrip;
class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Tools {
                    items[] += { "A3EE" };
                };
                class A3EE {
                    text = "A3EE Tools";
                    picture = "\a3\3DEN\Data\CfgWaypoints\Scripted_ca.paa";
                    items[] += {
                        "A3EE_Check_Apex",
                        "A3EE_Check_Overload",
                        "A3EE_Fill_Role_Desc",
                        "A3EE_Restore_Persistent_Callsigns"
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
                class A3EE_Restore_Persistent_Callsigns {
                    text = "Restore persistent Callsigns";
                    picture = "\a3\Modules_F_Curator\Data\portraitradio_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_fnc_restorePersistentCallsigns }";
                };
            };
        };
    };
};
