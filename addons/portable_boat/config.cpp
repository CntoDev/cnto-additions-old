/*
 * simple Portable Boat that can be assembled/disassembled, single backpack
 */

class CfgPatches {
    class Portable_Boat {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Static_F",
            "A3_Boat_F_Boat_Transport_01"
        };
    };
};

class CfgVehicles {
    class B_Boat_Transport_01_F;
    class Portable_Boat_boat : B_Boat_Transport_01_F {
        scope = 2;
        displayName = "Portable Boat";
        class assembleInfo {
            primary = 1;
            base = "";
            assembleTo = "";
            displayName = "";
            dissasembleTo[] = {"Portable_Boat_backpack"};
        };
    };

    class Weapon_Bag_Base;
    class Portable_Boat_backpack : Weapon_Bag_Base {
        scope = 2;
        displayName = "Portable Boat Bag";
        picture = "\A3\Drones_F\Weapons_F_Gamma\ammoboxes\bags\data\ui\icon_B_C_UAV_rgr_ca";
        model = "\A3\Drones_F\Weapons_F_Gamma\Ammoboxes\Bags\UAV_backpack_F.p3d";
        hiddenSelectionsTextures[] = {"\A3\Drones_F\Weapons_F_Gamma\Ammoboxes\Bags\data\UAV_backpack_rgr_co.paa"};
        maximumLoad = 0;
        mass = 600;
        mapSize = 0.6;
        class assembleInfo {
            primary = 1;
            base = "";
            assembleTo = "Portable_Boat_boat";
            displayName = "Portable Boat";
            dissasembleTo[] = {};
        };
    };
};
