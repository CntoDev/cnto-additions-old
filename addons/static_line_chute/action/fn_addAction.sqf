/*
 * add interaction actions to air vehicles capable of static line jump
 */

if (!hasInterface || isNull player) exitWith {};

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    private _got_action = _vehicle getVariable "Static_Line_Chute_has_action";
    if (!isNil "_got_action") exitWith {};
    if (!(_vehicle isKindOf "Plane") && !(_vehile isKindOf "Helicopter")) exitWith {};

    if (!isNil "ace_interact_menu_fnc_createAction") then {
        /* ACE */
        private _root_action = [] call Static_Line_Chute_fnc_createACEAction;
        [_vehicle, 1, ["ACE_SelfActions"], _root_action]
            call ace_interact_menu_fnc_addActionToObject;
    } else {
        /* vanilla */
        _vehicle call Static_Line_Chute_fnc_addVanillaAction;
    };
    _vehicle setVariable ["Static_Line_Chute_has_action", true];
}];
