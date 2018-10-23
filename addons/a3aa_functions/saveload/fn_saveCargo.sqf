/* if an array, merge contents of all boxes */
private _box = _this;

if (_box isEqualType objNull) then {
    _box = [_box];
};

private _weaps = [] call a3aa_fnc_hashInit;
private _bmags = [] call a3aa_fnc_hashInit;
private _items = [] call a3aa_fnc_hashInit;
private _packs = [] call a3aa_fnc_hashInit;

/* recurse into any sub-containers, merge contents */
{
    {
        _x params ["_classname", "_cargo"];
        private _sub = _cargo call a3aa_fnc_saveCargo;
        _sub params ["_sub_weaps", "_sub_bmags", "_sub_items", "_sub_packs"];
        {
            _x params ["_classname", "_cnt"];
            [_weaps, _classname, _cnt] call a3aa_fnc_hashCntIncrement;
        } forEach _sub_weaps;
        {
            _x params ["_classname", "_cnt"];
            [_bmags, _classname, _cnt] call a3aa_fnc_hashCntIncrement;
        } forEach _sub_bmags;
        {
            _x params ["_classname", "_cnt"];
            [_items, _classname, _cnt] call a3aa_fnc_hashCntIncrement;
        } forEach _sub_items;
        {
            _x params ["_classname", "_cnt"];
            [_packs, _classname, _cnt] call a3aa_fnc_hashCntIncrement;
        } forEach _sub_packs;
    } forEach everyContainer _x;
} forEach _box;

/* extract weapon attachments and magazines inside weapons */
/* weap, muzzle, side, cows, [mag1], [mag2], ..., underbarrel */
{
    {
        _x params ["_weap", "_muzzle", "_side", "_cows"];
        private _weapmags = _x select [4, count _x - 5];
        (_x select [count _x - 1, 1]) params ["_underbarrel"];

        /* add magazine bullets */
        {
            _x params ["_class", "_bullets"];
            [_bmags, _class, _bullets] call a3aa_fnc_hashCntIncrement;
        } forEach _weapmags;

        private _baseweap = ["CfgWeapons", _weap] call a3aa_saveload_fnc_baseClass;
        private _nativeacc = _baseweap call a3aa_saveload_fnc_weapNativeLinked;

        /* add accessories */
        {
            if (_x != "" && !(_x in _nativeacc)) then {
                [_items, _x, 1] call a3aa_fnc_hashCntIncrement;
            };
        } forEach [_muzzle, _side, _cows, _underbarrel];

        /* add the weapon, use its base version if possible */
        [_weaps, _baseweap, 1] call a3aa_fnc_hashCntIncrement;
    } forEach weaponsItemsCargo _x;
} forEach _box;

/* extract all the bullets for individual mag types */
{
    {
        _x params ["_class", "_bullets"];
        [_bmags, _class, _bullets] call a3aa_fnc_hashCntIncrement;
    } forEach magazinesAmmoCargo _x;
} forEach _box;

/* add items */
{
    (getItemCargo _x) params ["_classes", "_counts"];
    {
        private _class = _x;
        /* special case: use base radio class, without the _ID_123 tail */
        if (_class find "ACRE_" == 0) then {
            private _id = _class find "_ID_";
            if (_id != -1) then {
                private _newclass = _class select [0, _id];
                if (isClass (configFile >> "CfgWeapons" >> _newclass)) then {
                    _class = _newclass;
                };
            };
        };

        [_items, _class, _counts select _forEachIndex]
            call a3aa_fnc_hashCntIncrement;
    } forEach _classes;
} forEach _box;

/* add backpacks, don't bother with base class, loadBox empties them */
{
    (getBackpackCargo _x) params ["_classes", "_counts"];
    {
        [_packs, _x, _counts select _forEachIndex]
            call a3aa_fnc_hashCntIncrement;
    } forEach _classes;
} forEach _box;

/* return weaps/mags/items/packs */
[
    _weaps call a3aa_fnc_hashKeyVals,
    _bmags call a3aa_fnc_hashKeyVals,
    _items call a3aa_fnc_hashKeyVals,
    _packs call a3aa_fnc_hashKeyVals
];
