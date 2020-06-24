private _hits = getAllHitPointsDamage _this select 2;

private _fuel = fuel _this;

private _turretmags = [];
{
    _x params ["_class", "_path", "_bullets"];
    _turretmags pushBack [_path, _class, _bullets];
} forEach magazinesAllTurrets _this;

private _cargo = _this call a3aa_fnc_saveCargo;

/* ace cargo, but only base classnames */
private _ace_cargo = [];
{
    if (_x isEqualType "") then {
        _ace_cargo pushBack _x;
    } else {
        /* don't save boxes, they have config-defined contents */
        if (_x isEqualType objNull && {!(_x isKindOf "ReammoBox_F")}) then {
            _ace_cargo pushBack typeOf _x;
        };
    };
} forEach (_this getVariable ["ace_cargo_loaded", []]);

private _ace_fuel = [_this] call ace_refuel_fnc_getFuel;

[_hits, _fuel, _turretmags, _cargo, _ace_cargo, [_ace_fuel]]
