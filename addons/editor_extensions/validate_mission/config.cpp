class CfgPatches {
    class a3aa_ee_validate_mission {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"a3aa_ee_shared"};
    };
};

class CfgFunctions {
    class a3aa_ee_validate_mission {
        class all {
            file = "\a3aa\ee\validate_mission";
            class runAllChecks;
            class getEntityInfo;
            class checkOverload;
            class checkAcreIds;
            class checkOrdering;
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
                        "a3aa_ee_validate_mission"
                    };
                };
                class a3aa_ee_validate_mission {
                    text = "Validate mission";
                    picture = "\a3\Modules_F\Data\iconTaskSetState_ca.paa";
                    action = "collect3DENHistory { [] call a3aa_ee_validate_mission_fnc_runAllChecks }";
                };
            };
        };
    };
};
