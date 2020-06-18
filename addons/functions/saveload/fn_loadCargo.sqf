params ["_box", "_loadout", "_filter"];

/*
 * _filter is CODE, which should return true (add) or false (do not add)
 * and is passed the weap/mag/item/backp classname as an argument
 */

if (!isNil "_filter") then {
    _loadout = _loadout apply {
        _x select { (_x select 0) call _filter };
    };
};

_loadout params ["_weaps", "_bmags", "_items", "_packs"];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

{
    _x params ["_class", "_cnt"];
    _box addWeaponCargoGlobal [_class, _cnt];
} forEach _weaps;

{
    _x params ["_class", "_bullets"];
    /* split bullets into magazines */
    private _div = getNumber (configFile >> "CfgMagazines" >> _class >> "count");
    private _magcnt = floor (_bullets/_div);
    if (_magcnt > 0) then {
        _box addMagazineCargoGlobal [_class, _magcnt];
    };
    /* remaining partial mag */
    private _remain = _bullets%_div;
    if (_remain > 0) then {
        _box addMagazineAmmoCargo [_class, 1, _remain];
    };
} forEach _bmags;

{
    _x params ["_class", "_cnt"];
    _box addItemCargoGlobal [_class, _cnt];
} forEach _items;

{
    _x params ["_class", "_cnt"];
    _box addBackpackCargoGlobal [_class, _cnt];
} forEach _packs;
/* empty all added backpacks */
{
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearItemCargoGlobal _x;
    clearBackpackCargoGlobal _x;
} forEach everyBackpack _box;
