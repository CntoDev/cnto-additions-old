/*
 * re-create given object as a SimpleObject (executed only once, on server)
 */

params ["_unit", "_checkbox"];
if (is3DEN || !_checkbox) exitWith {};

/* we're doing this before simulation starts, we can thus have easily
 * both objects overlapping each other before we delete the old one */

private _obj = createSimpleObject [getModelInfo _unit select 1,
                                   getPosWorld _unit];
_obj setVectorDirAndUp [vectorDir _unit, vectorUp _unit];

deleteVehicle _unit;
