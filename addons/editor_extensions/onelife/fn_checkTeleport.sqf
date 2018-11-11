private _data = [] call a3ee_onelife_fnc_getDisconnectData;
if (isNil "_data") exitWith { false };

_data params ["_alive", "_corpse", "_grp", "_time"];

if (
        alive player &&                     /* double checking */
        _alive &&                           /* previous unit was alive */
        !isNull _corpse &&                  /* corpse exists */
        {alive leader _grp} &&              /* non-0 units, leader alive */
        {isNull objectParent leader _grp}   /* leader not in a vehicle */
   ) then {
    true;
} else {
    false;
};
