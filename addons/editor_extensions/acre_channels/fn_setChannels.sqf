private _chlist = _this;

waitUntil { [] call acre_api_fnc_isInitialized };
/* isInitialized is buggy, https://github.com/IDI-Systems/acre2/issues/354 */
sleep 3;

if (!alive player) exitWith {};

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
