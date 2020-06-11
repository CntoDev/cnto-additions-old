/*
 * various Arma 3 Spectator related tweaks and configuration
 */

class CfgPatches {
    class Static_Line_Chute {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Air_F_Beta",          // NonSteerable_Parachute_F
            "A3_Weapons_F_Ammoboxes"  // B_Parachute
        };
    };
};

class CfgVehicles {
    class NonSteerable_Parachute_F;
    class Static_Line_Chute_straightdown_chute : NonSteerable_Parachute_F {
        airInfluence = 0.1;
    };
    class B_Parachute;
    class Static_Line_Chute_straightdown_chute_item : B_Parachute {
        displayName = "Straight-Fall Non-Steerable Chute";
        parachuteClass = "Static_Line_Chute_straightdown_chute";
    };
};

class CfgFunctions {
    class Static_Line_Chute {
        class All {
            file = "\static_line_chute";
            class getPassengers;
            class getPassengerGroups;
            class calcJumpDelay;
            class ejectWithChute;
            class ejectUnits;
            class vehicleChat;
        };
        class Action {
            file = "\static_line_chute\action";
            class addAction { postInit = 1; };
            class addVanillaAction;
            class canInitiateJump;
            class createACEAction;
        };
    };
};
