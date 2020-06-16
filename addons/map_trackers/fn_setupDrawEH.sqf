/*
 * draw soldier / group icons on each frame
 */

#include "\A3\ui_f\hpp\defineResincl.inc"

disableSerialization;

private ["_ctrl"];
waitUntil {
    _ctrl = findDisplay IDD_MAIN_MAP displayCtrl IDC_MAP;
    !isNull _ctrl;
};

_ctrl ctrlAddEventHandler ["Draw", {
    params ["_ctrl"];
    {
        _x params ["_unit", "_icon", "_color", "_name"];
        /* fade gradually on the last 10% of distance */
        private _dist_from_edge = map_trackers_unit_dist-(player distance _unit);
        private _alpha = (_dist_from_edge/(map_trackers_unit_dist*0.1)) max 0 min 1;
        // TODO: draw line if map_trackers_unit_showlines
        _ctrl drawIcon [
            _icon,
            [0, 0, 0, _alpha],
            _unit,
            18,
            18,
            getDir _unit,
            _name,
            0,
            0.03,
            "PuristaMedium",
            "right"
        ];
        _ctrl drawIcon [
            _icon,
            _color+[_alpha],
            _unit,
            14,
            14,
            getDir _unit
        ];
    } forEach Map_Trackers_units;
}];
