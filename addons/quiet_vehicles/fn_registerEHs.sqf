if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    player addEventHandler ["GetInMan", {
        call quiet_vehicles_fnc_adjustSoundVolume;
    }];
    player addEventHandler ["GetOutMan", {
        call quiet_vehicles_fnc_adjustSoundVolume;
    }];

    /* in case player dies in a vehicle and goes into spectator */
    player addEventHandler ["Killed", {
        call quiet_vehicles_fnc_adjustSoundVolume;
    }];
    /* in case the player respawns instead (may spawn in/out of vehicle */
    player addEventHandler ["Respawn", {
        call quiet_vehicles_fnc_adjustSoundVolume;
    }];

    /* one time, on mission start */
    waitUntil { time > 0 };
    call quiet_vehicles_fnc_adjustSoundVolume;
};
