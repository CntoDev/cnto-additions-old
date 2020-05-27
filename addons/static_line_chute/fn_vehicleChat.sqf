/*
 * send a message to members of a given vehicle (incl. remote control)
 */

[_this, {
    params ["_vehicle", "_msg"];
    if (ace_player in crew _vehicle) then {
        systemChat _msg;
    };
}] remoteExec ["call"];
/*
 * don't use array of objects here in remoteExec, the code gets executed for
 * each of the objects, not only once where (any) of them are local
 */
