if (is3DEN) exitWith {};
private _area = _this getVariable "objectArea";
private _locname = _this getVariable "locname";
private _loctype = _this getVariable "loctype";
private _delcorpse = _this getVariable "delcorpse";

/* JIP safety;
 * completely decouple details from the logic object as - by the time
 * client gets to parsing the details - the object might have been already
 * deleteVehicle'd by the server */
[
    [position _this, _area, _locname, _loctype, vehicleVarName _this, _delcorpse],
    {
        params ["_pos", "_area", "_locname", "_loctype", "_locvar", "_delcorpse"];
        _area params ["_sizex", "_sizey", "_orient", "_rect"];

        private _loc = createLocation [_loctype, _pos, _sizex, _sizey];
        _loc setText _locname;
        _loc setName _locname;  /* ?? any use? */
        _loc setRectangular _rect;
        _loc setDirection _orient;
        if (_locvar != "") then {
            missionNamespace setVariable [_locvar, _loc];
        };

        if (isServer && _delcorpse) then {
            /* unique internal variable name, based on position */
            private _internal_loc = "loc_" + ((str position _loc) call BIS_fnc_filterString);
            missionNamespace setVariable [_internal_loc, _loc];
            addMissionEventHandler ["HandleDisconnect", compile (
                "if (position (_this select 0) in " + _internal_loc + ") then {" +
                    "deleteVehicle (_this select 0);" +
                "}; false"
            )];
            /* hideBody gives a few seconds to Respawn EHs like
             * BIS_fnc_curatorRespawn to work with the corpse */
            addMissionEventHandler ["EntityRespawned", compile (
                "if (position (_this select 1) in " + _internal_loc + ") then {" +
                    "hideBody (_this select 1);" +
                "}; false"
            )];
        };
    }
] remoteExec ["call", 0, true];

deleteVehicle _this;
