if (isDedicated) exitWith {};

/* ACRE2 mod not enabled */
if (!isClass (configFile >> "CfgPatches" >> "acre_api")) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };

    private _chlist = player getVariable ["a3aa_ee_acre_channels_chlist", []];
    if (_chlist isEqualTo []) exitWith {};
    a3aa_ee_acre_channels_chlist = _chlist apply { parseNumber _x };

    /* setup respawn handling */
    player addEventHandler ["Respawn", {
        0 = [] spawn {
            if (!isNil "a3aa_ee_arsenal_respawn_enabled") then {
                waitUntil { !isNil "a3aa_ee_arsenal_respawn_done" };
            };
            waitUntil { [] call acre_api_fnc_isInitialized };
            a3aa_ee_acre_channels_chlist call a3aa_ee_acre_channels_fnc_setChannels;
        };
    }];

    /* set now, on init */
    waitUntil { [] call acre_api_fnc_isInitialized };
    a3aa_ee_acre_channels_chlist call a3aa_ee_acre_channels_fnc_setChannels;

    /* record radio/channel config for the group */
    if (!didJIP && leader player == player) then {
        [] call a3aa_ee_acre_channels_fnc_addDiaryNote;
    };
};
