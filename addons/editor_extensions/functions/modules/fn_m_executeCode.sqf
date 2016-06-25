if (is3DEN) exitWith {};

private _enable = _this getVariable "enabledexec";
if (!_enable) exitWith {};

private _execonmp = _this getVariable "execonmp";
private _forjip = _this getVariable "forjip";

/* unique internal variable name, based on position */
private _uid = "exec_code_" + ((str position _this) call BIS_fnc_filterString);

[
    [_this getVariable "execenv",
     _this getVariable "waitforplayer",
     _this getVariable "waitforstart",
     _this getVariable "runoninit",
     _this getVariable "runonrespawn",
     compile (_this getVariable "code"),
     _uid],
    {
        params ["_execenv", "_waitforplayer", "_waitforstart",
                "_runoninit", "_runonrespawn", "_code", "_uid"];

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

        if (_runoninit) then {
            private _arg = [_waitforplayer, _waitforstart, _code];
            switch (_execenv) do {
                case 0: { _arg call _wrapper };
                case 1: { _arg spawn _wrapper };
            };
        };

        if (_runonrespawn) then {
            /* globalize code, so that respawn EH can access it */
            missionNamespace setVariable [_uid, _code];

            /* initial EH addition needs to be in scheduled env, as we need
             * to wait for non-null player obj */
            0 = [_execenv, _uid] spawn {
                params ["_execenv", "_uid"];
                if (isDedicated) exitWith {};  /* no player to respawn */
                waitUntil { !isNull player };

                private _wrapper = switch (_execenv) do {
                    case 0: { "_this call " + _uid };
                    case 1: { "_this spawn " + _uid };
                };
                player addEventHandler ["Respawn", compile _wrapper];
            };
        };
    }
] remoteExec ["call", _execonmp, _forjip];

deleteVehicle _this;
