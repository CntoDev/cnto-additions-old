/*
 * at regular intervals, collect eligible groups, process them and feed them
 * to the Draw EH
 */

/* wait for all units of the player's group to initialize */
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNull player };

private _get_groups = {
    switch (a3aa_map_trackers_group_status) do {
        case "side": {
            private _player_side = side group player;
            allGroups select { side _x == _player_side };
        };
        case "allies": {
            private _player_side = side group player;
            allGroups select { side _x getFriend _player_side >= 0.6 };
        };
        case "all": {
            allGroups;
        };
        default { [] };
    };
};

waitUntil {
    private _show_self = {
        switch (a3aa_map_trackers_group_showself) do {
            case "always": { true };
            case "never": { false };
            case "ifnotsoldier": { a3aa_map_trackers_unit_status == "disabled" };
        };
    };

    private "_groups";
    if (!isNil "a3aa_map_trackers_custom_groups") then {
        _groups = [] call a3aa_map_trackers_custom_groups;
        if (isNil "_groups") then { _groups = [] };
    } else {
        _groups = ([] call _get_groups) select {
            (a3aa_map_trackers_group_showai || leader _x in allPlayers)
            && {[] call _show_self || leader _x != player}
            && {!(_x getVariable ["a3aa_map_trackers_hide_group", false])}
            && {!(_x getVariable ["ACE_map_hideBlueForceMarker", false])}
        };
    };

    private "_get_grp_type";
    if (!isNil "a3aa_map_trackers_custom_group_type") then {
        _get_grp_type = a3aa_map_trackers_custom_group_type;
    } else {
        _get_grp_type = a3aa_map_trackers_fnc_getGroupIconType;
    };

    /* [leader, paa_path, color, callsign] */
    _groups = _groups apply {
        (_x call a3aa_map_trackers_fnc_getGroupIconColor) params ["_prefix", "_color"];

        /* %1: prefix ('b', 'n', 'o') , %2: type ('inf', 'armor', etc.) */
        private _icon = format [
            "\A3\ui_f\data\map\Markers\NATO\%1_%2.paa",
            _prefix,
            _group call _group_type
        ];
        // TODO
        [
            leader _x,
            _x call _get_grp_type,
            _x call a3aa_map_trackers_fnc_getGroupIconColor,
            if (a3aa_map_trackers_group_shownames) then { groupId _x } else { "" }
        ];
    };

    a3aa_map_trackers_groups = _groups;

    sleep (1 + random 1);

    false;
}
