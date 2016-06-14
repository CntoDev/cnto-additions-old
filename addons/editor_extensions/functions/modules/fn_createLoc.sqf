if (is3DEN) exitWith {};
private _area = _this getVariable "objectArea";
private _locname = _this getVariable "locname";
private _loctype = _this getVariable "loctype";

/* JIP safety;
 * completely decouple details from the logic object as - by the time
 * client gets to parsing the details - the object might have been already
 * deleteVehicle'd by the server */
[
    [position _this, _area, _locname, _loctype, vehicleVarName _this],
    {
        params ["_pos", "_area", "_locname", "_loctype", "_locvar"];
        _area params ["_sizex", "_sizey", "_orient", "_rect"];

        private _loc = createLocation [_loctype, _pos, _sizex, _sizey];
        _loc setText _locname;
        _loc setName _locname;  /* ?? any use? */
        _loc setRectangular _rect;
        _loc setDirection _orient;
        if (_locvar != "") then {
            missionNamespace setVariable [_locvar, _loc];
        };
    }
] remoteExec ["BIS_fnc_call", 0, true];

deleteVehicle _this;
