if (!hasInterface) exitWith {};

private _disabled = [];
{
    private _setting = missionNamespace getVariable
                            format ["a3aa_infopanel_control_%1", _x];
    if (!_setting) then {
        _disabled pushBack _x;
    };
} forEach [
    "MinimapDisplay",
    "MineDetectorDisplay",
    "SlingLoadDisplay",
    "UAVDisplay",
    "CrewDisplay"
];
if (_disabled isEqualTo []) exitWith {};
a3aa_infopanel_control_disabled = _disabled;

0 = [] spawn {
    waitUntil { !isNull player };
    player addEventHandler ["GetInMan", {
        params ["_unit", "_role", "_vehicle", "_turret"];
        _vehicle call a3aa_infopanel_control_fnc_disablePanels;
    }];

    /*
     * ideally, this would be done using EHs only, like for Respawn, but
     * there are many cases with missing EHs, ie. team switch, respawning
     * in non-local vehicles, etc.
     */
    waitUntil {
        sleep 1;
        if (!isNull player) then {
            vehicle player call a3aa_infopanel_control_fnc_disablePanels;
        };
        false;
    };
};
