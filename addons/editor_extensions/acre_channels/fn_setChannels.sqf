private _chlist = _this;

/*
 * ACRE2 needs a while to remove the original radios and replace
 * them with unique radio classes (separate special items)
 */
waitUntil { [] call acre_api_fnc_isInitialized };
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
