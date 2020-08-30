#include "\A3\ui_f\hpp\defineResincl.inc"

disableSerialization;

private _hooked = [];
waitUntil {
    /*
     * SP/MP briefing screen - find any client/server display with IDC_MAP
     * and hook it up, keep doing that until you see IDD_MAIN_MAP (running
     * game map)
     */
    private _done = {
        private _ctrl = _x displayCtrl IDC_MAP;
        if (!isNull _ctrl) then {
            _ctrl call a3aa_map_trackers_fnc_setupDrawEH;
            _hooked pushBack _x;
        };
        if (!isNull _ctrl && ctrlIDD _x == IDD_MAIN_MAP) exitWith { true };
        false;
    } forEach (
        [
            findDisplay IDD_INTEL_GETREADY,  /* SP briefing map */
            findDisplay IDD_SERVER_GET_READY,
            findDisplay IDD_CLIENT_GET_READY,
            findDisplay IDD_MAIN_MAP
        ] - [displayNull] - _hooked
    );
    /* in case there were no displays left to hook this frame */
    if (isNil "_done") then { false } else { _done };
};
