/*
 * smoke bounce - reduce bounciness of UGL smoke shells, as they can,
 * by default, bounce even kilometers from their original impact
 */

class CfgPatches {
    class Smoke_Bounce {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F"
        };
    };
};

class CfgAmmo {
    class SmokeShell;
    class G_40mm_Smoke : SmokeShell {
        /* inherited from SmokeShell is shotSmokeX which ignores
         * "deflecting" and "deflectionSlowDown" parameters */
        simulation = "shotSmoke";
        /* multiplier; small bounce, on 400m flat ground shot ~10m bounce */
        deflectionSlowDown = 0.3;
    };
};
