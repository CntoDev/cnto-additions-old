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
};
