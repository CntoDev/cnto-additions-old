/*
 * called by display (X)EH on Curator UI open/close
 */

params ["_open", ["_display", objNull]];

if (_open) then {
    /* curator ui opening */

    if (!isNil "insta_zeus_acre_toggle_enabled") then {
        true call Insta_Zeus_fnc_setAcreSpectator;
    };

    /* hook destruction of this display instance */
    if (!isNull _display) then {
        _display displayAddEventHandler ["Unload", {
            [false] call Insta_Zeus_fnc_acreOpenCloseSpectator;
        }];
    };

} else {
    /* curator ui closing */

    if (!isNil "insta_zeus_acre_toggle_enabled") then {
        false call Insta_Zeus_fnc_setAcreSpectator;
    };

    /* EH is destroyed automatically on display unLoad */
};
