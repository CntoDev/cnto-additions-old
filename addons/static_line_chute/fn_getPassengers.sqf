/*
 * get all cargo/turret units, sorted by cargo idx
 *
 * (because the "crew" command prefers turrets)
 *
 * filter by _group, if specified
 */

params ["_vehicle", ["_group", grpNull]];

private _cargo = [];

/*
 * run this atomically
 *
 * it's a good idea in general, but it also works around an engine bug
 * in select{} which randomly returns undefined _x in scheduled env
 */
isNil {
    {
        private _idx = _vehicle getCargoIndex _x;
        if (_idx >= 0) then {
            _cargo set [_idx, _x];
        };
    } forEach crew _vehicle;

    _cargo = _cargo select {
        /* remove <null> members, empty seats */
        !isNull _x
        /* limit to one group, if specified */
        && {isNull _group || group _x == _group}
        /* no ACE prisoners or ACE unconscious units */
        && !(_x getVariable ["ace_captives_isHandcuffed", false])
        && !(_x getVariable ["ACE_isUnconscious", false])
    };
};

_cargo;
