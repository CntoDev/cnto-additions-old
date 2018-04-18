/*
 * various Arma 3 Spectator related tweaks and configuration
 */

class CfgPatches {
    class Static_Line_Chute {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = { "rhs_c_troops" };
    };
};

class CfgVehicles {
    /* make D6 fall more vertically than a glider */
    class Steerable_Parachute_F;
    class rhs_d6_Parachute : Steerable_Parachute_F {
        ace_hasReserveParachute = 0;
        ace_reserveParachute = "";
        airInfluence = 0.1;
    };
};

class CfgFunctions {
    class Static_Line_Chute {
        class All {
            file = "\static_line_chute";
            class createACEAction;
            class addActionToVehicles { postInit = 1; };
            class getPassengers;
            class getPassengerGroups;
            class calcJumpDelay;
            class ejectWithChute;
            class ejectUnits;
            class vehicleChat;
        };
    };
};
