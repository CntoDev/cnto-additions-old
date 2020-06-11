/*
 * create ACE3 menu tree for the pilot/crew
 */

if (!isNil "Static_Line_Chute_created_ace_action") exitWith {
    Static_Line_Chute_created_ace_action;
};

Static_Line_Chute_fnc_menu_children_grouplist = {
    params ["_target", "_player", "_params"];
    private _children = [];

    private _groups = _target call Static_Line_Chute_fnc_getPassengerGroups;

    {
        private _action = [
            format ["Static_Line_Chute_Jump_jumpall_grp_%1", groupId _x],
            groupId _x,
            "",
            {
                params ["_target", "_player", "_params"];
                [_target, _params] spawn Static_Line_Chute_fnc_ejectUnits;
            },
            { true },
            {},
            _x
        ] call ace_interact_menu_fnc_createAction;
        _children pushBack [_action, [], _target];
    } forEach _groups;

    _children;
};

Static_Line_Chute_fnc_menu_children_all_or_group = {
    params ["_target", "_player", "_params"];
    private _children = [];

    /* all passengers, in cargo index order */
    private _jump_all = [
        "Static_Line_Chute_Jump_jumpall",
        "All Passengers",
        "z\ace\addons\interaction\UI\team\team_management_ca.paa",
        {
            params ["_target", "_player", "_params"];
            _target spawn Static_Line_Chute_fnc_ejectUnits;
        },
        { true }
    ] call ace_interact_menu_fnc_createAction;

    /* all passengers, groups together, in cargo index order */
    private _jump_all_groups = [
        "Static_Line_Chute_Jump_jumpallgroups",
        "All Groups",
        "z\ace\addons\interaction\UI\team\team_management_ca.paa",
        {
            params ["_target", "_player", "_params"];
            private _groups = _target call Static_Line_Chute_fnc_getPassengerGroups;
            [_target, _groups] spawn Static_Line_Chute_fnc_ejectUnits;
        },
        { true }
    ] call ace_interact_menu_fnc_createAction;

    /* one group, in cargo index order */
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
        [_jump_all_groups, [], _target],
        [_jump_group, [], _target]
    ];
};

private _action = [
    "Static_Line_Chute_Jump",
    "Static Line Jump",
    "\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa",
    {},
    {
        [_target, _player] call Static_Line_Chute_fnc_canInitiateJump;
    },
    Static_Line_Chute_fnc_menu_children_all_or_group
] call ace_interact_menu_fnc_createAction;

Static_Line_Chute_created_ace_action = _action;
_action;
