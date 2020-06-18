/*
 * at regular intervals, collect eligible groups, process them and feed them
 * to the Draw EH
 */

/* wait for all units of the player's group to initialize */
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNull player };

private _get_groups = {
    switch (map_trackers_group_status) do {
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
        switch (map_trackers_group_showself) do {
            case "always": { true };
            case "never": { false };
            case "ifnotsoldier": { map_trackers_unit_status == "disabled" };
        };
    };

    private _groups = ([] call _get_groups) select {
        (map_trackers_group_showai || leader _x in allPlayers)
        && {[] call _show_self || leader _x != player}
        && {!(_x getVariable ["Map_Trackers_hide_group", false])}
        && {!(_x getVariable ["ACE_map_hideBlueForceMarker", false])}
    };

    /* [leader, paa_path, color, callsign] */
    _groups = _groups apply {
        (_x call Map_Trackers_fnc_getGroupIcon) params ["_icon", "_color"];
        [
            leader _x,
            _icon,
            _color,
            if (map_trackers_group_shownames) then { groupId _x } else { "" }
        ];
    };

    Map_Trackers_groups = _groups;

    sleep (1 + random 1);

    false;
}
