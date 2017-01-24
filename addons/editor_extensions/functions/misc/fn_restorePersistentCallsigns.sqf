/*
 * Eden doesn't seem to restore custom Callsigns on copy/paste or when placing
 * a SQE composition - use a custom field and restore Callsign when possible
 */

/* return +1 if callsign was changed, 0 if not, big negative nr on fatal err */
private _restore_one = {
    private _sign = _this get3DENAttribute "a3ee_persistent_callsign";
    if (_sign isEqualTo [] || _sign isEqualTo [""]) exitWith {0};
    _sign = _sign select 0;

    /* already assigned? */
    if (_sign isEqualTo groupId _this) exitWith {0};

    /* does it already exist? */
    if (_sign in (allGroups apply { groupId _x })) exitWith {
        0 = [_sign, groupId _this] spawn {
            disableSerialization;
            [
                format ["Callsign %1 already exists, leaving %2.",
                        (_this select 0), (_this select 1)],
                1, 8
            ] call BIS_fnc_3DENNotification;
        };
        -10000;
    };

    _this set3DENAttribute ["groupID", _sign];
    1;
};

private _cnt = 0;
{
    _cnt = _cnt + (_x call _restore_one);
    if (_cnt < 0) exitWith {};
} forEach allGroups;

if (_cnt > 0) then {
    0 = _cnt spawn {
        disableSerialization;
        [
            format ["Restored %1 persistent callsigns. Please save the mission.", _this],
            0, 8
        ] call BIS_fnc_3DENNotification;
    };
};
