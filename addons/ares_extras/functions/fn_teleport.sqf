/*
 * teleport '_objects' (possibly players) to a destination '_dst' position,
 * disabling collisions between each other for 10 seconds
 *
 * also teleport vehicles with crew, not individual crew members
 */

params ["_objects", "_dst"];

private _onlocal = {
    params ["_me", "_others", "_dst"];

    /* terminate existing handler */
    private _timer = _me getVariable ["Ares_Extras_teleport_timer", objNull];
    if (!isNull _timer) then {
        terminate _timer;
        waitUntil { scriptDone _timer };
    };

    { _me disableCollisionWith _x; } forEach _others;
    _me setPos _dst;

    private _enabler = [_me, _others] spawn {
        params ["_me", "_others"];
        sleep 10;
        { _me enableCollisionWith _x; } forEach _others;
        _me setVariable ["Ares_Extras_teleport_timer", nil];
    };
    _me setVariable ["Ares_Extras_teleport_timer", _enabler];
};

private _toteleport = [];
{
    if (vehicle _x == _x) then {
        _toteleport pushBack _x;
    } else {
        /* unit in a vehicle, add it only if the vehicle is not teleported */
        if (!(vehicle _x in _objects)) then {
            _toteleport pushBack _x;
        };
    };
} forEach _objects;

{
    [[_x, _objects, _dst], _onlocal] remoteExec ["BIS_fnc_call", _x];
} forEach _toteleport;
