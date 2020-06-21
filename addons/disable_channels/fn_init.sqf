[
    "a3aa_disable_channels_list",
    "EDITBOX",
    ["Channel IDs", "List of channel IDs to disable:\n\n0: Global\n1: Side\n2: Command\n3: Group\n4: Vehicle\n5: Direct\n\nGroup channel cannot be disabled."],
    ["Arma Additions", "Disable Channels"],
    "[1,2,4,5]",  /* default */
    true,         /* isGlobal */
    {
        private _list = parseSimpleArray _this;
        if (!isNil "_list") then {
            for "_i" from 0 to 5 do {
                if (_i in _list) then {
                    _i enableChannel false;
                } else {
                    _i enableChannel true;
                };
            };
        };
    }
] call CBA_settings_fnc_init;
[
    "a3aa_disable_channels_default",
    "LIST",
    ["Default channel", "Switched to before mission start. Must be one of the non-disabled channel IDs.\n\nDoes nothing when using ACE, use: ACE Map -> Default Channel."],
    ["Arma Additions", "Disable Channels"],
    [
        [0, 1, 2, 3, 4, 5],
        ["0 (Global)","1 (Side)","2 (Command)","3 (Group)","4 (Vehicle)","5 (Direct communication)"],
        0
    ],     /* default */
    true,  /* isGlobal */
    {
        if (!isMultiplayer) exitWith {};
        if (isClass (configFile >> "CfgPatches" >> "ace_map")) exitWith {};
        /* wait a bit for vanilla to set some channel, so we can override it */
        0 = _this spawn {
            if (isMultiplayer) then {
                waitUntil { getClientStateNumber >= 9 };
            };
            setCurrentChannel _this;
        };
    }
] call CBA_settings_fnc_init;
