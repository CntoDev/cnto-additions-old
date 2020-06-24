{
    _x params ["_pos", "_damage"];
    /* position changes between mission loads due to Number rounding,
     * so use 0.01 distance instead of 0 */
    private _building = nearestTerrainObjects [_pos, [], 0.01, false];
    if (count _building == 1) then {
        (_building select 0) setDamage [_damage, false];
    };
} forEach _this;
