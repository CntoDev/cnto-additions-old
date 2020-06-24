/* take care of assigned/unassigned curator over time, watching for when
 * a client logs in/out of the admin role */

if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNil "a3aa_insta_zeus_curator" };
    if (!isMultiplayer) exitWith {
        /* always assign in singleplayer */
        player assignCurator a3aa_insta_zeus_curator;
    };
    0 = a3aa_insta_zeus_curator spawn {
        /* wait for any other unit-linked curators to take over */
        sleep 5;
        while {true} do {
            /* #logout works only on dedicated, #kick is on hosted as well */
            if (serverCommandAvailable "#kick") then {
                if (isNull getAssignedCuratorLogic player) then {
                    _this remoteExec ["unassignCurator", 2];
                    [player, _this] remoteExec ["assignCurator", 2];
                };
            } else {
                /* only if the assigned curator is our global one */
                if (_this == getAssignedCuratorLogic player) then {
                    _this remoteExec ["unassignCurator", 2];
                };
            };
            sleep 1;
        };
    };
};
