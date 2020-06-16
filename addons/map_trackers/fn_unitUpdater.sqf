/*
 * at regular intervals, collect units in range, process them and feed them
 * to the Draw EH
 */

/* wait for all units of the player's group to initialize */
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNull player };

/* CODE to execute to get unit's icon */
private _geticon = switch (map_trackers_unit_iconsource) do {
    case "class": {
        {
            private _icon = getText (
                configFile >> "CfgVehicles" >> typeOf _this >> "icon"
            );
            if (_icon == "") then { "iconMan" } else { _icon };
        };
    };
    case "guess": {
        Map_Trackers_fnc_guessUnitIcon;
    };
    case "custom": {
        {
            /* user-defined function */
            if (!isNil "Map_Trackers_custom_unit_icon") then {
                _this call Map_Trackers_custom_unit_icon;
            } else {
                "iconMan";
            };
        };
    };
    /* "none" */
    default {
        { "iconMan" };
    };
};

waitUntil {
    private _units = (units group player) select {
        player distance _x < map_trackers_unit_dist;
    };

    /* [object, icon, color, name] */
    _units = _units apply {
        [
            _x,
            _x call _geticon,
            _x call Map_Trackers_fnc_getUnitTeamColor,
            if (map_trackers_unit_shownames) then { name _x } else { "" }
        ];
    };

    Map_Trackers_units = _units;

    // TODO: better sleep?
    sleep 1;

    false;
}
