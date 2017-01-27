/*
 * make a player unit "godlike" (immortal + captive), useful for GMs
 */

if (isDedicated) exitWith {};

0 = _this spawn {
    waitUntil { !isNull player };
    if (!(player isEqualTo _this )) exitWith {};

    _this allowDamage false;
    _this setCaptive true;

    /* hide on the map (ACE BluFor Tracking) */
    _this setVariable ["ACE_map_hideBlueForceMarker", true, true];
    (group _this) setVariable ["ACE_map_hideBlueForceMarker", true, true];
};
