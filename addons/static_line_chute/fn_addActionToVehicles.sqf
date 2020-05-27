/*
 * add ACE interaction actions to air vehicles capable of static line jump
 */

private _root_action = [] call Static_Line_Chute_fnc_createACEAction;

{
    [_x, 1, ["ACE_SelfActions"], _root_action, true] call ace_interact_menu_fnc_addActionToClass;
} forEach ["Plane", "Helicopter"];
