
_this ctrlAddEventHandler ["MouseButtonDown", {
    params ["_control", "_button", "_x_pos", "_y_pos", "_shift", "_ctrl", "_alt"];
    if (_button != 0) exitWith {};  /* left mouse button only */

    /* if paper map is in use, this gets set after time > 0 */
    if (!isNil "a3aa_ee_paper_map_permarkers") exitWith {};

    private _mouseover = ctrlMapMouseOver _control;
    if (_mouseover isEqualTo []) exitWith {};
    _mouseover params ["_type", "_marker"];
    if (_type != "marker" || {_marker find "_USER_DEFINED" == -1}) exitWith {};

    switch ([_shift, _ctrl, _alt]) do {
        case [true, false, false]: {
            a3aa_marker_enh_actingon = ["rotate", _marker];
        };
        case [false, false, true]: {
            a3aa_marker_enh_actingon = ["move", _marker];
        };
        default {
            a3aa_marker_enh_actingon = nil;
        };
    };
}];
_this ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control", "_button"];
    if (_button != 0 || isNil "a3aa_marker_enh_actingon_result") exitWith {};

    a3aa_marker_enh_actingon_result params ["_type", "_marker", "_arg"];
    switch (_type) do {
        case "rotate": { _marker setMarkerDir _arg };
        case "move":   { _marker setMarkerPos _arg };
    };
    a3aa_marker_enh_actingon_result = nil;
    a3aa_marker_enh_actingon = nil;
}];
_this ctrlAddEventHandler ["MouseMoving", {
    params ["_control", "_x_pos", "_y_pos"];
    if (isNil "a3aa_marker_enh_actingon") exitWith {};

    a3aa_marker_enh_actingon params ["_type", "_marker"];

    private _mousepos = _control ctrlMapScreenToWorld [_x_pos, _y_pos];

    switch (_type) do {
        case "rotate": {
            private _markerpos = markerPos _marker;
            _markerpos deleteAt 2;  /* make into Position2D */
            private _dir = _markerpos getDir _mousepos;
            _marker setMarkerDirLocal _dir;
            a3aa_marker_enh_actingon_result = ["rotate", _marker, _dir];
        };
        case "move": {
            _marker setMarkerPosLocal _mousepos;
            a3aa_marker_enh_actingon_result = ["move", _marker, _mousepos];
        };
    };
}];
