class CfgPatches
{
    class Stamina_Tweak
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.54;  /* new stamina system needed */
        /* since we want to override maxSoldierLoad defined by ACE3,
         * we need to load after it, hence the dependency */
        requiredAddons[] = {"ace_movement"};
        /* if you wish to run this stamina tweak without ACE3, comment
         * out the above requiredAddons and uncomment the following */
        //requiredAddons[] = {"A3_Modules_F"};
    };
};

class CfgMovesFatigue
{
    /* make sway recovery faster when changing stances, offset by weight */
    aimPrecisionSpeedCoef = 20;  //default 5
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
};

class CfgInventoryGlobalVariable
{
    /* how much a soldier can carry (weight bar width) */
    maxSoldierLoad = 1400;     //default 1000, ACE 1200
};
