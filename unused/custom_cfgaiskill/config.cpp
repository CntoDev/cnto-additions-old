/*
 * AI skill adjustments for CNTO
 * https://community.bistudio.com/wiki/Category:AI
 * https://community.bistudio.com/wiki/CfgAISkill
 */
class CfgPatches {
    class Custom_Cfgaiskill {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
    };
};

/*
 * { A , B , C , D }
 * these define starting (A,B) and ending (C,D) points of interpolation lines
 * used for translating AI skill from values set ingame to the actual values
 * the engine uses
 *
 * example:
 * { 0 , 0.4 , 1 , 0.6 } - steep skill line 0 to 1 gets translated into
 *                         a more flat one, 0.4 to 0.6
 */

//vanilla
class CfgAISkill {
    aimingAccuracy[] = {0,   0,   1,  1};
    aimingShake[]    = {0,   0,   1,  1};
    aimingSpeed[]    = {0,   0.5, 1,  1};
    endurance[]      = {0,   0,   1,  1};
    spotDistance[]   = {0,   0,   1,  1};
    spotTime[]       = {0,   0,   1,  0.7};
    courage[]        = {0,   0,   1,  1};
    reloadSpeed[]    = {0,   0,   1,  1};
    commanding[]     = {0,   0,   1,  1};
    general[]        = {0,   0,   1,  1};
};

/*
class CfgAISkill {
    aimingAccuracy[] = {0,   1,   1,  1};
    aimingShake[]    = {0,   1,   1,  1};
    aimingSpeed[]    = {0,   1,   1,  1};
    endurance[]      = {0,   1,   1,  1};
    spotDistance[]   = {0,   1,   1,  1};
    spotTime[]       = {0,   1,   1,  1};
    courage[]        = {0,   1,   1,  1};
    reloadSpeed[]    = {0,   1,   1,  1};
    commanding[]     = {0,   1,   1,  1};
    general[]        = {0,   1,   1,  1};
};
*/
