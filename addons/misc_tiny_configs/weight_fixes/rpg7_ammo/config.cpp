/*
 * https://en.wikipedia.org/wiki/RPG-7#Specifications
 * http://vmz.bg/en/%D0%BF%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%86%D0%B8%D1%8F/%D0%BF%D1%80%D0%BE%D1%82%D0%B8%D0%B2%D0%BE%D1%82%D0%B0%D0%BD%D0%BA%D0%BE%D0%B2%D0%B0-%D0%B3%D1%80%D0%B0%D0%BD%D0%B0%D1%82%D0%BE%D1%85%D0%B2%D1%8A%D1%80%D0%B3%D0%B0%D1%87%D0%BA%D0%B0/
 */

class CfgPatches {
    class Weight_Fixes_RPG7_Ammo {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "rhs_c_weapons"
        };
    };
};

/*
 * 1 kg = 22.046016 Arma mass units
 * ( probably 10*lbs, as 1 kg = 2.20462 lbs, thus: )
 * 1 lb = 10 Arma mass units
 */

class CfgMagazines {
    class CA_LauncherMagazine;
    class rhs_rpg7_PG7VL_mag : CA_LauncherMagazine {
        mass = 57.32;
    };
    class rhs_rpg7_PG7V_mag : rhs_rpg7_PG7VL_mag {
        mass = 49.714;
    };
    class rhs_rpg7_PG7VM_mag : rhs_rpg7_PG7V_mag {
        mass = 43,541;  // seems unused ingame
    };
    class rhs_rpg7_PG7VS_mag : rhs_rpg7_PG7V_mag {
        mass = 50; // ??? doesn't exist IRL?
    };
    class rhs_rpg7_PG7VR_mag : rhs_rpg7_PG7VL_mag {
        mass = 99.207;
    };
    class rhs_rpg7_TBG7V_mag : rhs_rpg7_PG7VL_mag {
        mass = 99.207;
    };
    class rhs_rpg7_OG7V_mag : rhs_rpg7_PG7VL_mag {
        mass = 44.092;
    };
    class rhs_rpg7_type69_airburst_mag : rhs_rpg7_PG7VL_mag {
        mass = 123.458;
    };
};
