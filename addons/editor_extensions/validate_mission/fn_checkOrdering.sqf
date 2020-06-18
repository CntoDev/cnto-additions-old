/*
 * check if logic 3DEN entities don't precede non-logic ones
 * - this can happen if ie. HC or Virtual Spectator are placed before other
 *   playable units, or if the playable units are deleted and placed again
 */

private ["_i", "_ent", "_fail"];

/* entity IDs have gaps and there's no way to get the highest one, so guess */
for "_i" from 0 to 10000 do {
    _ent = get3DENEntity _i;
    if (!isNil "_ent" && {_ent isEqualType objNull} &&
            {(_ent get3DENAttribute "ControlSP") isEqualTo [true] ||
             (_ent get3DENAttribute "ControlMP") isEqualTo [true]}) exitWith {
        /* fail if logic, because we expect Playable non-logic first */
        if (_ent in (all3DENEntities select 3)) then { _fail = _ent };
    };
};
if (isNil "_fail") then {
    true;
} else {
    [false, [_ent]];
};
