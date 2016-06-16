/* take care of assigned/unassigned curator over time, watching for when
 * a client logs in/out of the admin role */

if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNil "Insta_Zeus_Curator" };
    if (!isMultiplayer) exitWith {
        /* always assign in singleplayer */
        player assignCurator Insta_Zeus_Curator;
    };
    0 = Insta_Zeus_Curator spawn {
        while {true} do {
            /* #logout works only on dedicated, #kick is on hosted as well */
            if (serverCommandAvailable "#kick") then {
                if (isNull getAssignedCuratorLogic player) then {
                    _this remoteExec ["unassignCurator", 2];
                    [player, _this] remoteExec ["assignCurator", 2];
                };
            } else {
                /* only if the assigned curator is our global one */
                if (_this isEqualTo getAssignedCuratorLogic player) then {
                    _this remoteExec ["unassignCurator", 2];
                };
            };
            sleep 1;
        };
    };
};
