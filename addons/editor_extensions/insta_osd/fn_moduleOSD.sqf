if (is3DEN) exitWith {};
private _header = _this getVariable "header";
private _delay = _this getVariable "delay";
private _tojip = _this getVariable "tojip";

[
    [_header, _delay],
    {
        0 = _this spawn {
            params ["_header", "_delay"];

            waitUntil { time > 0 };
            sleep _delay;

            if (_header != "") then {
                _header call a3ee_fnc_instaOSD;
            } else {
                [] call a3ee_fnc_instaOSD;
            };
        };
    }
] remoteExec ["call", 0, _tojip];

deleteVehicle _this;
