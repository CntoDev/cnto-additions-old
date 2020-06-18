/* delete the chestpack of '_unit', returning its class and contents,
 * as getUnitLoadout provides it */

params ["_unit"];

private _chestpack = _unit getVariable "a3aa_chestpack_pack";
if (isNil "_chestpack") exitWith {};
_unit setVariable ["a3aa_chestpack_pack", nil, true];
[_unit, false] remoteExec ["forceWalk", _unit];

_chestpack params ["_obj", "_packinfo"];
deleteVehicle _obj;
_packinfo;
