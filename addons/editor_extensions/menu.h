class ctrlMenuStrip;
class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Tools {
                    items[] += {
                        "A3EE_Check_Apex",
                        "A3EE_Fill_Role_Desc",
                        "A3EE_Restore_Persistent_Callsigns"
                    };
                };
                class A3EE_Check_Apex {
                    text = "Check for Apex objects";
                    action = "collect3DENHistory { [] call a3ee_fnc_checkApex }";
                };
                class A3EE_Fill_Role_Desc {
                    text = "Fill in Role Description";
                    action = "collect3DENHistory { [] call a3ee_fnc_fillRoleDesc }";
                };
                class A3EE_Restore_Persistent_Callsigns {
                    text = "Restore persistent Callsigns";
                    action = "collect3DENHistory { [] call a3ee_fnc_restorePersistentCallsigns }";
                };
            };
        };
    };
};
