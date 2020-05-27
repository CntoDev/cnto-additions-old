/*
 * force open spectator and wait for all of the teleport conditions
 * to be true, then teleport the player
 *
 * needs scheduled env
 */

true call a3ee_onelife_fnc_forceSpectator;

waitUntil { !isNil "a3ee_onelife_preload_finished" };

/* engine bug; time not synced early after JIP */
waitUntil { time > 2 };

/* the first call sometimes doesn't open spectator */
true call a3ee_onelife_fnc_forceSpectator;

waitUntil {
    sleep 1;
    [] call a3ee_onelife_fnc_checkTeleport;
};
[] call a3ee_onelife_fnc_doTeleport;
