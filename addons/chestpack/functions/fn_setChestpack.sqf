/* add chestpack to '_unit', according to getUnitLoadout-formatted
 * '_backinfo' (backpack array), saved by fn_delBackpack */

params ["_unit", "_packinfo"];
_packinfo params ["_packclass"];

/* sometimes has .p3d, sometimes doesn't, starts with leading \, etc. */
//getText (configFile >> "CfgVehicles" >> _packclass >> "model");

private _temp = _packclass createVehicleLocal [0,0,0];
private _model = (getModelInfo _temp) select 1;
deleteVehicle _temp;

private _obj = createSimpleObject [_model, [0,0,0]];
_obj attachTo [_unit, [0.02,-0.04,-0.3], "pelvis"];

_unit forceWalk true;
_unit setVariable ["Chestpack_pack", [_obj, _packinfo], true];


/*
obj = createVehicle ["GroundWeaponHolder", player, [], 0, "CAN_COLLIDE"];
obj addBackpackCargoGlobal [(typeof unitbackpack player), 1];
obj attachTo [player, [0.02,-0.04,-0.3], "pelvis"];
obj setVectorUp [0,1,0];
*/
