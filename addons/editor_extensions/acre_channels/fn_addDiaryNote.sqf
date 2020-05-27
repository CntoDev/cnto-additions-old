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
} forEach ([] call acre_api_fnc_getCurrentRadioList);
_text = _text + "</font>";
[
    [groupId group player, _text],
    {
        params ["_title", "_text"];
        if (isDedicated) exitWith {};
        waitUntil { !isNull player };
        /* ignored if exists */
        player createDiarySubject ["a3ee_acre_setup", "ACRE2 Channels"];
        player createDiaryRecord ["a3ee_acre_setup", [_title, _text]];
    }
] remoteExec ["spawn", 0, true];
