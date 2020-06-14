if (isClass (configFile >> "CfgPatches" >> "acex_volume")) exitWith {};

if (!hasInterface) exitWith {};
if (!quiet_vehicles_enable) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    player addEventHandler ["GetInMan", {
        [] call Quiet_Vehicles_fnc_adjustSoundVolume;
    }];
    player addEventHandler ["GetOutMan", {
        [] call Quiet_Vehicles_fnc_adjustSoundVolume;
    }];

    /* in case player dies in a vehicle and goes into spectator */
    player addEventHandler ["Killed", {
        [] call Quiet_Vehicles_fnc_adjustSoundVolume;
    }];
    /* in case the player respawns instead (may spawn in/out of vehicle) */
    player addEventHandler ["Respawn", {
        [] call Quiet_Vehicles_fnc_adjustSoundVolume;
    }];
};
