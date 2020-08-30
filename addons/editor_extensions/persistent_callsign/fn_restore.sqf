/*
 * Eden doesn't seem to restore custom Callsigns on copy/paste or when placing
 * a SQE composition - use a custom field and restore Callsign when possible
 */

/* return 1 if callsign was changed, 0 if not, -1 on fatal err */
private _restore_one = {
    private _sign = _this get3DENAttribute "a3aa_ee_persistent_callsign";
    if (_sign isEqualTo [] || _sign isEqualTo [""]) exitWith {0};
    _sign = _sign select 0;

    /* already assigned? */
    if (_sign == groupId _this) exitWith {0};

    /* does it already exist? */
    if (_sign in (allGroups apply { groupId _x })) exitWith {
        [
            format ["Callsign %1 already exists, leaving %2.",
                    _sign, groupId _this],
            1
        ] call BIS_fnc_3DENNotification;
        -1;
    };

    _this set3DENAttribute ["groupID", _sign];
    1;
};

{
    if ((_x call _restore_one) < 0) exitWith {};
} forEach allGroups;
