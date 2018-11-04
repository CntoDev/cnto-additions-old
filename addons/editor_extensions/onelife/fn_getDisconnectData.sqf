/*
 * request data from the server, saving publicVariable broadcast every
 * time the variable would be otherwise changed (every disconnect)
 *
 * - unused, was replaced by publicVariable due to frequent calls
 */
/*
[clientOwner, "a3ee_onelife_disconnects"] remoteExec ["publicVariableClient", 2];
*/

if (canSuspend) then {
    waitUntil { !isNil "a3ee_onelife_disconnects" };
};
if (isNil "a3ee_onelife_disconnects") exitWith {};
[a3ee_onelife_disconnects, getPlayerUID player] call a3aa_fnc_hashGet;
