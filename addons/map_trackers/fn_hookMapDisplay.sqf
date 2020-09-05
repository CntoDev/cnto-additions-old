disableSerialization;

params ["_display", "_mapidc"];

waitUntil { !isNil "a3aa_map_trackers_settings_initialized" };

if (a3aa_map_trackers_unit_status == "disabled"
    && a3aa_map_trackers_group_status == "disabled") exitWith {};

private _ctrl = controlNull;
waitUntil {
    if (isNull _display) exitWith { true };
    _ctrl = _display displayCtrl _mapidc;
    if (isNull _ctrl) then {
        sleep 0.1;
        false;
    } else {
        true;
    };
};
if (!isNull _ctrl) then {
    _ctrl call a3aa_map_trackers_fnc_setupDrawEH;
};
