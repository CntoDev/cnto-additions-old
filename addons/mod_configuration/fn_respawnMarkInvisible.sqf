/*
 * make all respawn markers invisible on the map, in case somebody forgot
 * to set this in the editor
 */

if (!isServer) exitWith {};
{
    /* support even misc 'respawn_west_<whatever>' */
    if ((_x find "respawn") == 0) then {
        _x setMarkerAlpha 0;
    };
} forEach allMapMarkers;
