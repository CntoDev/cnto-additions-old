/*
 * add ('_add' == true) or remove ('_add' == false) Night Vision Googles from
 * '_unit', based on its side / faction, assigning/unassigning them into/from
 * the correct slot
 */

params ["_unit", ["_add", true]];

private "_googles";

if (side _unit == blufor) then {
    _googles = "NVGoggles";
} else {
    if (side _unit == opfor) then {
        _googles = "NVGoggles_OPFOR";
    } else {
        if (side _unit == independent || side _unit == civilian) then {
            _googles = "NVGoggles_INDEP";
        } else {
            /* default */
            _googles = "NVGoggles";
        };
    };
};

if (_add) then {
    _unit linkItem _googles;
} else {
    _unit unlinkItem _googles;
};
