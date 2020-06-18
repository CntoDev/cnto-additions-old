/*
 * create ACE3 menu tree for the pilot/crew
 */

if (!isNil "a3aa_static_line_created_ace_action") exitWith {
    a3aa_static_line_created_ace_action;
};

a3aa_static_line_fnc_menu_children_grouplist = {
    params ["_target", "_player", "_params"];
    private _children = [];

    private _groups = _target call a3aa_static_line_fnc_getPassengerGroups;

    {
        private _action = [
            format ["a3aa_static_line_jump_jumpall_grp_%1", groupId _x],
            groupId _x,
            "",
            {
                params ["_target", "_player", "_params"];
                [_target, _params] spawn a3aa_static_line_fnc_ejectUnits;
            },
            { true },
            {},
            _x
        ] call ace_interact_menu_fnc_createAction;
        _children pushBack [_action, [], _target];
    } forEach _groups;

    _children;
};

a3aa_static_line_fnc_menu_children_all_or_group = {
    params ["_target", "_player", "_params"];
    private _children = [];

    /* all passengers, in cargo index order */
    private _jump_all = [
        "a3aa_static_line_jump_jumpall",
        "All Passengers",
        "z\ace\addons\interaction\UI\team\team_management_ca.paa",
        {
            params ["_target", "_player", "_params"];
            _target spawn a3aa_static_line_fnc_ejectUnits;
        },
        { true }
    ] call ace_interact_menu_fnc_createAction;

    /* all passengers, groups together, in cargo index order */
    private _jump_all_groups = [
        "a3aa_static_line_jump_jumpallgroups",
        "All Groups",
        "z\ace\addons\interaction\UI\team\team_management_ca.paa",
        {
            params ["_target", "_player", "_params"];
            private _groups = _target call a3aa_static_line_fnc_getPassengerGroups;
            [_target, _groups] spawn a3aa_static_line_fnc_ejectUnits;
        },
        { true }
    ] call ace_interact_menu_fnc_createAction;

    /* one group, in cargo index order */
    private _jump_group = [
        "a3aa_static_line_jump_jumpgrp",
        "Only Group",
        "z\ace\addons\interaction\UI\team\team_white_ca.paa",
        {},
        { true },
        a3aa_static_line_fnc_menu_children_grouplist
    ] call ace_interact_menu_fnc_createAction;

    [
        [_jump_all, [], _target],
        [_jump_all_groups, [], _target],
        [_jump_group, [], _target]
    ];
};

private _action = [
    "a3aa_static_line_jump",
    "Static Line Jump",
    "\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa",
    {},
    {
        [_target, _player] call a3aa_static_line_fnc_canInitiateJump;
    },
    a3aa_static_line_fnc_menu_children_all_or_group
] call ace_interact_menu_fnc_createAction;

a3aa_static_line_created_ace_action = _action;
_action;
