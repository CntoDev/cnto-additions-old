class CfgPatches {
    class Editor_Extensions_validate_mission {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_validate_mission {
        class all {
            file = "\editor_extensions\validate_mission\functions";
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
                class A3EE {
                    items[] += {
                        "A3EE_Validate_Mission"
                    };
                };
                class A3EE_Validate_Mission {
                    text = "Validate mission";
                    picture = "\a3\Modules_F\Data\iconTaskSetState_ca.paa";
                    action = "collect3DENHistory { [] call a3ee_validate_mission_fnc_runAllChecks }";
                };
            };
        };
    };
};
