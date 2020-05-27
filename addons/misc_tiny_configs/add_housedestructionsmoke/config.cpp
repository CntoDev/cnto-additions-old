/*
 * works around CUP buildings using Arma1/Arma2 CfgCloudlets,
 * prevents annoying pop-up
 */

class CfgPatches {
    class Add_Housedestructionsmoke {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Data_F_ParticleEffects"
        };
    };
};

class CfgCloudlets {
    class HouseDestructionSmoke1;
    class housedestructionsmoke : HouseDestructionSmoke1 {};

    /* fuel stations, Lingor, etc. */
    class FuelFire1;
    class fuelstationexp : FuelFire1 {};
    class ObjectDestructionSmokeFuelS;
    class fuelsmoke1 : ObjectDestructionSmokeFuelS {};
    class ObjectDestructionSmokeFuelS1_2;
    class fuelsmoke2 : ObjectDestructionSmokeFuelS1_2 {};
};
