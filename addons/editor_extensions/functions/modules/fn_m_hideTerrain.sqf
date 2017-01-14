if (is3DEN) exitWith {};
private _area = _this getVariable "objectArea";
private _filter = _this getVariable "terrfilter";

_area params ["_rx", "_ry", "_angle", "_rect"];
if (_rect || _rx != _ry) exitWith {
    "Hide Terrain: Area must be a perfect circle (X = Y)." remoteExec ["BIS_fnc_errorMsg"];
};

/* TODO: remake into (faster) nearTerrainObjects on 1.61+ */
{
    _x hideObjectGlobal true;
} count nearestTerrainObjects [_this, _filter, _rx, false, true];

deleteVehicle _this;
