if (is3DEN) exitWith {};
private _execonmp = _this getVariable "execonmp";
private _forjip = _this getVariable "forjip";
private _execenv = _this getVariable "execenv";
private _waitforplayer = _this getVariable "waitforplayer";
private _waitforstart = _this getVariable "waitforstart";
private _code = compile (_this getVariable "code");

[
    [_execenv, _waitforplayer, _waitforstart, _code],
    {
        params ["_execenv"];
        _this deleteAt 0;

        private _wrapper = {
            params ["_waitforplayer", "_waitforstart", "_code"];
            if (canSuspend && _waitforplayer && !isDedicated) then {
                waitUntil { !isNull player };
            };
            if (canSuspend && _waitforstart) then {
                waitUntil { time > 0 };
            };
            [] call _code;
        };

        switch (_execenv) do {
            case 0: { _this call _wrapper };
            case 1: { _this spawn _wrapper };
        };
    }
] remoteExec ["call", _execonmp, _forjip];

deleteVehicle _this;
