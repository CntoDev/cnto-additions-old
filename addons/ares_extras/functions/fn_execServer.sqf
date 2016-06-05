/*
 * execute '_code' on the server only
 *
 * '_code' may be of type CODE or ARRAY, if it is ARRAY, the first member
 * is an arbitrary arg to be passed to the second member, which is the CODE
 * (similarly to BIS_fnc_call)
 */

if (typeName _this == "ARRAY") then {
    _this remoteExec ["BIS_fnc_call", 2];
} else {
    _this remoteExec ["call", 2];
};
