/*
 * use special ACRE2 "spectator channel" for vanilla spectator
 *
 * instead of hooking all possible known and unknown transitions between
 * spectator and non-spectator, just regularly check if player is spectator
 * (or not) and switch the ACRE2 voice "channel" based on that
 *
 * this automagically works for script-induced spectator camera as well
 */

if (!hasInterface) exitWith {};

0 = [] spawn {
    while {true} do {
        /* wait for opened spectator */
        waitUntil {
            sleep 1;
            !isNil "BIS_EGSpectator_thread" && {!isNull BIS_EGSpectator_thread};
        };

        [true] call acre_api_fnc_setSpectator;

        /* wait for closed spectator */
        waitUntil {
            sleep 1;
            isNil "BIS_EGSpectator_thread" || {isNull BIS_EGSpectator_thread};
        };

        [false] call acre_api_fnc_setSpectator;
    };
};
