/* delete the backpack of '_unit', returning its class and contents,
 * as getUnitLoadout provides it */

params ["_unit"];

private _packinfo = getUnitLoadout _unit;
if (count _packinfo > 0) then {
    /* https://community.bistudio.com/wiki/Talk:getUnitLoadout */
    _packinfo = _packinfo select 5;
    removeBackpackGlobal _unit;
};
_packinfo;
