class CfgPatches {
    class Ares_Extras {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Modules_F_Curator_Respawn"
        };
    };
};

class CfgFunctions {
    class Ares_Extras {
        class All {
            file = "\ares_extras";
            class init { postInit = 1; };
        };
        class Task_Force {
            file = "\ares_extras\task_force";
            class assignTaskForce;
            class unassignTaskForce;
            class informLoopTaskForces { postInit = 1; };
        };
    };
};
