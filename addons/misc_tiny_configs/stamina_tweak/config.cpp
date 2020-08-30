class CfgPatches {
    class a3aa_mtc_stamina_tweak {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.54;  /* new stamina system needed */
        requiredAddons[] = {"A3_Characters_F"};
    };
};

/* ACE uses enableStamina false, so these don't get used with ACE */

class CfgMovesFatigue {
    /* make sway recovery faster after stamina drain, also depends on weight */
    aimPrecisionSpeedCoef = 10;  //default 5
    /* disable sprinting for this amount of secs when stamina runs out */
    staminaCooldown = 5;         //default 10
    /* "amount" of stamina, how fast it drains (higher = slower) */
    staminaDuration = 90;        //default 60
    /* restore stamina from 0 to full in this amount of secs */
    staminaRestoration = 90;     //default 30
    /* when terrain gradient prevents sprinting (hill icon),
     * add this value to stamina gain */
    terrainDrainSprint = -0.6;   //default -1
    /* when terrain gradient forces you to walk (steep hill),
     * add this value to stamina gain (warning: too low negative values
     * actually restore stamina due to the character walking) */
    terrainDrainRun = -1.4;      //default -1
    /* when terrain gradient disables sprint, this value is used
     * as animation speed multiplier */
    terrainSpeedCoef = 0.7;      //default 0.9
};
