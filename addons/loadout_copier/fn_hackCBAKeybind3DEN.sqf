/*
 * this hack makes CBA configured keybinds for this addon work in 3DEN
 * where CBA (at least now) doesn't execute keybind code at all and this
 * probably won't change as it would break many mods using keybinds
 *
 * so just hack our own Display EH into the 3DEN window, extract the
 * user-configured shortcuts from CBA registry and manually check against
 * them
 *
 * note that this isn't perfect as we're using KeyUp only - KeyDown fires
 * continuously while keys are held, but KeyUp only registers if a given key
 * was released *while* the modifier keys are still being held
 * - ie if you release 'ctrl' first while pressing 'ctrl+shift+z', the 'z' key
 *   will be registered without 'ctrl' and fail the match
 *   - however this is probably GEFN
 */

disableSerialization;

private _d = findDisplay 313;
if (isNull _d) exitWith {};

private _exists = _d getVariable "Loadout_Copier_hooked_313";
if (!isNil "_exists") exitWith {};

_d displayAddEventHandler ["KeyUp", {
    params ["_d", "_key", "_shift", "_ctrl", "_alt"];
    if (!is3DEN) exitWith {};  // just in case of delayed Destroy
    private _match = [_key, [_shift, _ctrl, _alt]];
    private _registry = profileNamespace getVariable "cba_keybinding_registry_v3";
    if (isNil "_registry") exitWith {};
    {
        _x params ["_addon", "_action", "_code"];
        private _full_action = toLower format ["%1$%2", _addon, _action];
        private _keybinds = [_registry, _full_action] call CBA_fnc_hashGet;
        if (_match in _keybinds) then {
            [] call _code;
        };
    } forEach [
        /*
         * CBA doesn't use addon subcategory as part of the index, so use
         * ["addon", "action"] instead of [["addon","subcat"],"action"]
         */
        [
            "Arma Additions",
            "Loadout_Copier_editor_curator_copy",
            { ["editor_curator", "copy"] call Loadout_Copier_fnc_copyPaste }
        ],
        [
            "Arma Additions",
            "Loadout_Copier_editor_curator_paste",
            { ["editor_curator", "paste"] call Loadout_Copier_fnc_copyPaste }
        ]
    ];
}];

_d setVariable ["Loadout_Copier_hooked_313", true];
