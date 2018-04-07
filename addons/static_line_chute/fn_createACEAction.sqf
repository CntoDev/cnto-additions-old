/*
 * create ACE3 menu tree for the pilot/crew
 */

Static_Line_Chute_fnc_menu_children_grouplist = {
    params ["_target", "_player", "_params"];
    private _children = [];

    /* get list of groups onboard */
    private _cargo = _target call Static_Line_Chute_fnc_getPassengers;
    private _unique_groups = [];
    {
        _unique_groups pushBackUnique (group _x);
    } forEach _cargo;

    {
        private _action = [
            format ["Static_Line_Chute_Jump_jumpall_grp_%1", groupId _x],
            groupId _x,
            "",
            {
                params ["_target", "_player", "_params"];
                [_target, _params] call Static_Line_Chute_fnc_ejectUnits;
            },
            { true },
            {},
            _x
        ] call ace_interact_menu_fnc_createAction;
        _children pushBack [_action, [], _target];
    } forEach _unique_groups;

    _children;
};

Static_Line_Chute_fnc_menu_children_all_or_group = {
    params ["_target", "_player", "_params"];
    private _children = [];

    private _jump_all = [
        "Static_Line_Chute_Jump_jumpall",
        "All Passengers",
        "z\ace\addons\interaction\UI\team\team_management_ca.paa",
        {
            params ["_target", "_player", "_params"];
            _target call Static_Line_Chute_fnc_ejectUnits;
        },
        { true }
    ] call ace_interact_menu_fnc_createAction;

    private _jump_group = [
        "Static_Line_Chute_Jump_jumpgrp",
        "Only Group",
        "z\ace\addons\interaction\UI\team\team_white_ca.paa",
        {},
        { true },
        Static_Line_Chute_fnc_menu_children_grouplist
    ] call ace_interact_menu_fnc_createAction;

    [
        [_jump_all, [], _target],
        [_jump_group, [], _target]
    ];
};

private _action = [
    "Static_Line_Chute_Jump",
    "Static Line Jump",
    "\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa",
    {},
    {
        /* only non-cargo crew can initiate the jump */
        ((_this select 0) getCargoIndex (_this select 1)) < 0
        /* above 100m */
        && position (_this select 0) select 2 > 100
        /* only when not already in progress */
        && !((_this select 0) getVariable ["Static_Line_Chute_jumping", false])
        /* only with non-zero passengers */
        && count ((_this select 0) call Static_Line_Chute_fnc_getPassengers) > 0
        /* only in vehicles with cargo/turret space above 8 */
        && count (
            fullCrew [(_this select 0), "turret", true]    /* includes copilot! */
            + fullCrew [(_this select 0), "cargo", true]
           ) >= 9
    },
    Static_Line_Chute_fnc_menu_children_all_or_group
] call ace_interact_menu_fnc_createAction;

_action;
