/*
 * make the engine never switch a player to sideEnemy, as friendly fire should
 * be dealt with on the real people level and not what the engine considers it
 * to be
 *
 * also (and primarily) allows friendly-fire shooters to get onboard vehicles
 * along with other players without having to ACE "Pardon" them manually
 */

if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    player addRating 99999999;
};
