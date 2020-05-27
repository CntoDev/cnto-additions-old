/* add backpack to '_unit', according to getUnitLoadout-formatted
 * '_backinfo' (backpack array), saved by fn_delBackpack */

params ["_unit", "_packinfo"];

private _loadout = getUnitLoadout _unit;
/* https://community.bistudio.com/wiki/Talk:getUnitLoadout */
_loadout set [5, _packinfo];
_unit setUnitLoadout _loadout;
