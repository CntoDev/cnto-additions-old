/*
 * allow only "authorized" players to access spectator slots
 *
 * IOW allow only players who were in VirtualSpectator_F slots on mission
 * start to re-join back as spectators, no other player should be able to join
 * as VirtualSpectator_F
 *
 * note that this works on non-dedicated as well as the server can never JIP,
 * leaving game ends the mission
 */

if (isServer) then {
    Spectator_Tweaks_Authorized = [];
} else {
    0 = [] spawn {
        waitUntil { !isNull player };
        if (!(player isKindOf "VirtualSpectator_F")) exitWith {};
        if (!didJIP) then {
            /* joined before start - tell the server to record our UID */
            [getPlayerUID player, {
                waitUntil { !isNil "Spectator_Tweaks_Authorized" };
                Spectator_Tweaks_Authorized pushBack _this;
                publicVariable "Spectator_Tweaks_Authorized";
            }] remoteExec ["spawn", 2];
        } else {
            /* joined as JIP, quit if we're not authorized */
            if (!(getPlayerUID player in Spectator_Tweaks_Authorized)) then {
                /* failMission doesn't work right away, wait for a bit */
                sleep 5;
                failMission "LOSER";
            };
        };
    };
};
