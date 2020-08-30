/*
 * add interaction actions to air vehicles capable of static line jump
 */

if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    player addEventHandler ["GetInMan", {
        params ["_unit", "_role", "_vehicle", "_turret"];

        private _got_action = _vehicle getVariable "a3aa_static_line_has_action";
        if (!isNil "_got_action") exitWith {};
        if (!(_vehicle isKindOf "Plane") && !(_vehile isKindOf "Helicopter")) exitWith {};

        if (!isNil "ace_interact_menu_fnc_createAction") then {
            /* ACE */
            private _root_action = [] call a3aa_static_line_fnc_createACEAction;
            [_vehicle, 1, ["ACE_SelfActions"], _root_action]
                call ace_interact_menu_fnc_addActionToObject;
        } else {
            /* vanilla */
            _vehicle call a3aa_static_line_fnc_addVanillaAction;
        };
        _vehicle setVariable ["a3aa_static_line_has_action", true];
    }];
};
