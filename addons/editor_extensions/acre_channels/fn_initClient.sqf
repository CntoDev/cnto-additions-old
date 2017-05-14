if (isDedicated) exitWith {};

/* ACRE2 mod not enabled */
if (!isClass (configFile >> "CfgPatches" >> "acre_api")) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };

    private _chlist = player getVariable ["a3ee_acre_chlist", []];
    if (_chlist isEqualTo []) exitWith {};
    _chlist = _chlist apply { parseNumber _x };  /* to numbers */

    /* setup respawn handling */
    missionNamespace setVariable ["a3ee_acre_chlist", _chlist];
    player addEventHandler ["Respawn", {
        0 = [] spawn {
            waitUntil { !isNull player };
            private _chlist = missionNamespace getVariable "a3ee_acre_chlist";
            _chlist call a3ee_acre_channels_fnc_setChannels;
        };
    }];

    /* set now, on init */
    _chlist call a3ee_acre_channels_fnc_setChannels;

    /* record radio/channel config for the group */
    if (!didJIP && leader player == player) then {
        [] call a3ee_acre_channels_fnc_addDiaryNote;
    };
};
