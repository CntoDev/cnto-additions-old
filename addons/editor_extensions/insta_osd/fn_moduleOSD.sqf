if (is3DEN) exitWith {};
private _header = _this getVariable "header";
private _tojip = _this getVariable "tojip";

[
    _header,
    {
        a3ee_instaOSD_header = _this;
        addMissionEventHandler ["PreloadFinished", {
            0 = [] spawn {
                waitUntil { time > 0 };
                sleep 1;

                if (a3ee_instaOSD_header != "") then {
                    a3ee_instaOSD_header call a3ee_fnc_instaOSD;
                } else {
                    [] call a3ee_fnc_instaOSD;
                };
            };
        }];
    }
] remoteExec ["call", 0, _tojip];

deleteVehicle _this;
