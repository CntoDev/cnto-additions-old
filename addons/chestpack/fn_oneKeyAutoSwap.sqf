/*
 * fully automatic decision making framework for determining what the player
 * wants to do based on one key press, ACE-less
 */

private _target = player;
private _desc = "self";

/*
 * if pointing at another corpse, operate on it
 */

/* getCursorObjectParams is as imprecise as cursorTarget */
private _pointed = cursorTarget;
if (_pointed isKindOf "CAManBase" && {player distance _pointed < 2}
                            && {_pointed call a3aa_chestpack_fnc_isDead}) then {
    _target = _pointed;
    _desc = "target's";
};

/* got deleted in the meantime ? .. or was player null all along? */
if (isNull _target) exitWith {};

/*
 * if we have backpack, but no chestpack
 *  --> put backpack on chest
 * if we have chestpack, but no backpack
 *  --> put chestpack on back
 * if we have both
 *  --> swap them
 */

private _chestpack = _target getVariable "a3aa_chestpack_pack";
private _has_chestpack = if (isNil "_chestpack") then { false } else { true };
private _has_backpack = !isNull unitBackpack _target;

if (_has_backpack && !_has_chestpack) then {
    systemChat format ["Putting %1 backpack on chest", _desc];
    private _back = _target call a3aa_chestpack_fnc_removeBackpack;
    [_target, _back] call a3aa_chestpack_fnc_setChestpack;
} else {
    if (!_has_backpack && _has_chestpack) then {
        systemChat format ["Putting %1 chestpack on back", _desc];
        private _chest = _target call a3aa_chestpack_fnc_removeChestpack;
        [_target, _chest] call a3aa_chestpack_fnc_setBackpack;
    } else {
        if (_has_backpack && _has_chestpack) then {
            systemChat format ["Swapping %1 Chest/Back packs", _desc];
            private _back = _target call a3aa_chestpack_fnc_removeBackpack;
            private _chest = _target call a3aa_chestpack_fnc_removeChestpack;
            [_target, _chest] call a3aa_chestpack_fnc_setBackpack;
            [_target, _back] call a3aa_chestpack_fnc_setChestpack;
        };
    };
};
