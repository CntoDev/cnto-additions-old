#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"
//#include "\A3\ui_f\hpp\defineResincl.inc"  // included by the above

waitUntil { !isNil "a3aa_map_trackers_settings_initialized" };

if (a3aa_map_trackers_unit_status == "disabled"
    && a3aa_map_trackers_group_status == "disabled") exitWith {};

disableSerialization;
private "_ctrl";
waitUntil {
    _ctrl = _this displayCtrl IDC_RSCDISPLAYCURATOR_MAINMAP;
    !isNull _ctrl;
};
_ctrl call a3aa_map_trackers_fnc_setupDrawEH;
