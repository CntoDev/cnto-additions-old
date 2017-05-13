/* ACRE2 mod not enabled */
if (!isClass (configFile >> "CfgPatches" >> "acre_api")) exitWith {};

0 = _this spawn {
    params ["_unit", "_chlist"];
    if (_chlist isEqualTo []) exitWith {};

    waitUntil { !isNil "BIS_fnc_init" };
    if (!isPlayer _unit) exitWith {};

    [
        [_unit, _chlist],
        {
            params ["_unit", "_chlist"];

            waitUntil { !isNil "BIS_fnc_init" };
            waitUntil { !isNull player };

            /*
             * ACRE2 needs a while to remove the original radios and replace
             * them with unique radio classes (separate special items)
             */
            sleep 3;

            _chlist = _chlist apply { parseNumber _x };  /* to numbers */

            private _radios = [] call acre_api_fnc_getCurrentRadioList;
            if (count _chlist > count _radios) then {
                _chlist resize count _radios;
            };

            {
                if (_x > 0) then {
                    private _radio = _radios select _forEachIndex;
                    [_radio, _x] call acre_api_fnc_setRadioChannel;
                };
            } forEach _chlist;

            /* record radio/channel config for the group */
            if (!didJIP && leader player == player) then {
                private _text = format [
                    "<font size='16'>Radio setup for %1:</font>",
                    groupId group player
                ];
                _text = _text + "<br /><br /><font size='14'>";
                {
                    _text = _text + format [
                        "<font color='#ffaa00'>%1</font>: channel %2<br />",
                        [_x] call acre_api_fnc_getBaseRadio,
                        [_x] call acre_api_fnc_getRadioChannel
                    ];
                } forEach _radios;
                _text = _text + "</font>";
                [
                    _text,
                    {
                        if (isDedicated) exitWith {};
                        waitUntil { !isNull player };
                        /* ignored if exists */
                        player createDiarySubject ["a3ee_acre_setup", "ACRE2 Channels"];
                        player createDiaryRecord ["a3ee_acre_setup", [
                            groupId group player, _this
                        ]];
                    }
                ] remoteExec ["spawn", 0, true];
            };
        }
    ] remoteExec ["spawn", _unit];
};
