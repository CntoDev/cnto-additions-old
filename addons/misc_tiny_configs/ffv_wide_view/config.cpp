/*
 * ffv wide view - increase the shoot angle when in fire-from-vehicles (ffv)
 *                 mode, as a passenger, especially in RHS vehicles
 */

class CfgPatches {
    class FFV_Wide_View {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "rhsusf_vehicles"
        };
    };
};

class Turrets;
class CfgVehicles {
    class rhsusf_m998_w_2dr;
    class rhsusf_m998_w_4dr : rhsusf_m998_w_2dr {
        class CargoTurret_01;
        class Turrets : Turrets {
            class CargoTurret_03 : CargoTurret_01 {
                maxTurn = -30;
                minTurn = -130;
            };
            class CargoTurret_04 : CargoTurret_03 {
                maxTurn = -20;
                minTurn = -130;
            };
            class CargoTurret_05 : CargoTurret_03 {
                maxTurn = 160;
                minTurn = 25;
            };
        };
    };

    class rhsusf_m998_w_4dr_fulltop;
    class rhsusf_m1025_w : rhsusf_m998_w_4dr_fulltop {
        class CargoTurret;
        class Turrets : Turrets {
            class CargoTurret_01 : CargoTurret {
                maxTurn = -30;
                minTurn = -90;
                maxElev = 15;
                minElev = -15;
            };
            class CargoTurret_02 : CargoTurret_01 {
                maxTurn = -30;
                minTurn = -95;
                maxElev = 9;
                minElev = -20;
            };
            class CargoTurret_03 : CargoTurret_01 {
                maxTurn = 120;
                minTurn = 50;
                maxElev = 9;
                minElev = -20;
            };
        };
    };
};
