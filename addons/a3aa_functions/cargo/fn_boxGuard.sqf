/*
 * show empty inventory on _box if it is closer than _range meters to its
 * initial placement location (as seen on mission start)
 */

params ["_box", "_range"];

if (isServer) then {
    _box setVariable ["boxguard_data", [
        position _box, _range
    ], true];
};
if (hasInterface) then {
    _box addEventHandler ["ContainerOpened", {
        params ["_box", "_player"];

        private _data = _box getVariable "boxguard_data";
        if (isNil "_data") exitWith {};
        _data params ["_initpos", "_range"];
        if (position _box distance2D _initpos > _range) exitWith {};

        0 = [] spawn {
            waitUntil { !isNull findDisplay 602 };
            (findDisplay 602) closeDisplay 0;
            player action ["Gear", objNull];
        };
    }];
};
