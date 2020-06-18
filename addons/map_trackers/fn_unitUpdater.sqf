/*
 * at regular intervals, collect units in range, process them and feed them
 * to the Draw EH
 */

/* wait for all units of the player's group to initialize */
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNull player };

private _get_units = {
    switch (map_trackers_unit_status) do {
        case "group": {
            units group player;
        };
        case "side": {
            private _player_side = side player;
            //allPlayers select { side _x == _player_side };
            allUnits select { _x isKindOf "CAManBase" && side _x == _player_side };
        };
        case "allies": {
            private _player_side = side player;
            //allPlayers select { side _x getFriend _player_side >= 0.6 };
            allUnits select { (_x isKindOf "CAManBase") && (side _x getFriend _player_side >= 0.6) };
        };
        case "all": {
            //allPlayers;
            allUnits select { _x isKindOf "CAManBase" };
        };
        default { [] };
    };
};

private _get_icon = {
    switch (map_trackers_unit_iconsource) do {
        case "class": {
            private _icon = getText (
                configFile >> "CfgVehicles" >> typeOf _this >> "icon"
            );
            if (_icon == "") then { "iconMan" } else { _icon };
        };
        case "guess": {
            // TODO: AT/MG recognition
            if (leader group _this == _this) then {
                "iconManLeader";
            } else {
                "iconMan";
            };
        };
        default {
            { "iconMan" };
        };
    };
};

private _get_color = {
    switch (assignedTeam _this) do {
        case "RED":    { [1, 0.2, 0.2] };
        case "GREEN":  { [0.2, 1, 0.2] };
        case "BLUE":   { [0.4, 0.4, 1] };
        case "YELLOW": { [0.7, 0.7, 0] };
        default        { [0.9, 0.9, 0.9] };
    };
};

waitUntil {
    /* allow smooth fade-in @ soldier move speed (see EH) */
    private _dist = map_trackers_unit_dist + 20;

    if (map_trackers_unit_showlines) then {
        private _leader = leader group player;
        private _sources = (units group player) select {
            _x != _leader && {player distance _x < _dist};
        };
        private _lines = _sources apply {
            /* [src, dst] */
            [_x, _leader];
        };
        Map_Trackers_unit_lines = _lines;
    };

    private _units = ([] call _get_units) select {
        player distance _x < _dist;
    };

    private _grp_units = units group player;
    _units = _units apply {
        /* [object, icon, color, name] */
        [
            _x,
            _x call _get_icon,
            _x call _get_color,
            if (map_trackers_unit_shownames) then { name _x } else { "" }
        ];
    };

    Map_Trackers_units = _units;

    sleep (1 + random 1);

    false;
}
