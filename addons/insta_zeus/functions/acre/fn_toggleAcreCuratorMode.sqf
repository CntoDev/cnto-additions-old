/*
 * switch to ACRE's spectator mode while in curator (on keybind)
 */

if (!([] call Insta_Zeus_fnc_curatorOpened)) exitWith {};

if (isNil "insta_zeus_acre_toggle_enabled") then {
    systemChat "Enabling ACRE spectator mode.";
    true call Insta_Zeus_fnc_setAcreSpectator;
    insta_zeus_acre_toggle_enabled = true;
} else {
    systemChat "Disabling ACRE spectator mode.";
    false call Insta_Zeus_fnc_setAcreSpectator;
    insta_zeus_acre_toggle_enabled = nil;
};
