if (is3DEN) exitWith {};

private _enable = _this getVariable "enabledexec";
if (!_enable) exitWith {};

private _execonmp = _this getVariable "execonmp";
private _forjip = _this getVariable "forjip";
private _keepmodule = _this getVariable "keepmodule";

/* unique internal variable name, based on position */
private _uid = "exec_code_" + ((str position _this) call BIS_fnc_filterString);

[
    [_this getVariable "execenv",
     _this getVariable "waitforplayer",
     _this getVariable "waitforstart",
     _this getVariable "runoninit",
     _this getVariable "runonrespawn",
     compile ((_this getVariable "code") call a3ee_execute_code_fnc_decomment),
     _keepmodule,
     _this,
     _uid],
    {
        params ["_execenv", "_waitforplayer", "_waitforstart",
                "_runoninit", "_runonrespawn", "_code",
                "_keepmodule", "_module", "_uid"];

        if (_runoninit) then {
            switch (_execenv) do {
                case 0: {
                    if (_keepmodule) then {
                        _module call _code;
                    } else {
                        [] call _code;
                    };
                };
                case 1: {
                    if (_keepmodule) then {
                        _module spawn _code;
                    } else {
                        [] spawn _code;
                    };
                };
            };
        };

        if (_runonrespawn) then {
            /* globalize code and module, so that respawn EH can access them */
            missionNamespace setVariable [_uid+"code", _code];
            if (_keepmodule) then {
                missionNamespace setVariable [_uid+"mod", _module];
            };

            /* initial EH addition needs to be in scheduled env, as we need
             * to wait for non-null player obj */
            0 = [_execenv, _uid] spawn {
                params ["_execenv", "_uid"];
                if (isDedicated) exitWith {};  /* no player to respawn */
                waitUntil { !isNull player };
                player addEventHandler ["Respawn", compile (
                    'private _code = missionNamespace getVariable "' + _uid+"code" + '";' +
                    'private _arg = missionNamespace getVariable ["' + _uid+"mod" + '", []];' +
                    (switch (_execenv) do {
                        case 0: { '_arg call _code' };
                        case 1: { '_arg spawn _code' };
                    })
                )];
            };
        };
    }
] remoteExec ["call", _execonmp, _forjip];

if (!_keepmodule) then {
    deleteVehicle _this;
};
