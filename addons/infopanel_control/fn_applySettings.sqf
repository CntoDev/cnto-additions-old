if (!hasInterface) exitWith {};

private _disabled = [];
{
    private _setting = missionNamespace getVariable
                            format ["infopanel_control_%1", _x];
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
InfoPanel_Control_disabled = _disabled;

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    _vehicle call InfoPanel_Control_fnc_disablePanels;
}];

/*
 * ideally, this would be done using EHs only, like for Respawn, but there are
 * many cases with missing EHs, ie. team switch, respawning in non-local
 * vehicles, etc.
 * - fortunately, enableInfoPanelComponent is *very* fast and the logic below
 *   was optimized for minimum runtime overhead
 */

0 = [] spawn {
    waitUntil {
        sleep 1;
        if (!isNull player) then {
            vehicle player call InfoPanel_Control_fnc_disablePanels;
        };
        false;
    };
};
