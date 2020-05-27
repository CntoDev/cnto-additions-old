/* only objects that can be restored fast (without effects) */
private _building_types = [
    "building", "house", "church", "chapel", "fortress", "view-tower",
    "lighthouse", "quay", "fuelstation", "hospital", "transmitter",
    "stack", "ruin", "tourism", "watertower", "powerlines", "powersolar",
    "powerwave", "powerwind"
];

private _buildings = [];
{
    if (damage _x > 0.2) then {
        /* destroyed objects might have different position than they
         * originally had, restore them to pristine state first */
        private _orig = damage _x;
        _x setDamage [0, false];
        _buildings pushBack [_x modelToWorld [0,0,0], _orig];
        _x setDamage [_orig, false];
    };
} count nearestTerrainObjects [[0,0,0], _building_types, 100000, false];

_buildings;
