if (is3DEN) exitWith {};
private _header = _this getVariable "a3aa_ee_insta_osd_header";
private _tojip = _this getVariable "a3aa_ee_insta_osd_tojip";

[
    _header,
    {
        a3aa_ee_insta_osd_header = _this;
        addMissionEventHandler ["PreloadFinished", {
            0 = [] spawn {
                waitUntil { time > 0 };
                sleep 1;

                if (a3aa_ee_insta_osd_header != "") then {
                    a3aa_ee_insta_osd_header call a3aa_ee_insta_osd_fnc_instaOSD;
                } else {
                    [] call a3aa_ee_insta_osd_fnc_instaOSD;
                };
            };
            removeMissionEventHandler ["PreloadFinished", _thisEventHandler];
        }];
    }
] remoteExec ["call", 0, _tojip];

deleteVehicle _this;
