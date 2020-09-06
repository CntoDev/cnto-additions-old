class CfgPatches {
    class a3aa_mtc_puffy_smoke {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F_ParticleEffects"};
    };
};

/*
 * ACE optionals 'particles' defines its own CfgCloudlets and points to it
 * from CfgAmmo resulting in 100% ACE optionals/particles behavior, making
 * these tweaks useless
 */

class CfgCloudlets {
    class Default;
    class SmokeShellWhite : Default {
        rubbing = 0.02;  /* wind effect, default 0.05 */
        sizeCoef = 1.5;
        moveVelocity[] = {0.4, 0.2, 0.2};
        MoveVelocityVar[] = {0.5, 0.5, 0.5};
    };
};
