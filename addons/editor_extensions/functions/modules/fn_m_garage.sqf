if (is3DEN) exitWith {};
private _area = _this getVariable "objectArea";
private _actiontext = _this getVariable "actiontext";
private _condition = _this getVariable "condition";

_area params ["_rx", "_ry", "_angle", "_rect"];
if (_rect || _rx != _ry) exitWith {
    "Garage: Area must be a perfect circle (X = Y)." remoteExec ["BIS_fnc_errorMsg"];
};

[
    [_this, _rx, _actiontext, _condition],
    {
        params ["_module", "_radius", "_text", "_cond"];

        /* player might be in synchronized objects, wait for it */
        if (!hasInterface) exitWith {};
        waitUntil { !isNull player };

        /* need to wait for all objects to be initialized - AFAIK there's
         * no good way to do that, so just wait for mission start and give it
         * extra time to JIP players, whose time already starts above 0 */
        waitUntil { time > 0 };
        sleep 1;

        {
            _x addAction [
                _text,
                {
                    params ["_target", "_caller", "_actid", "_args"];
                    _args params ["_module", "_radius"];
                    private _pos = position _module;

                    /* clear garage area - delete any units */
                    {
                        if (_x isKindOf "AllVehicles") then { deleteVehicle _x };
                    } forEach (_pos nearObjects _radius);

                    /* create dummy obj for BIS_fnc_garage,
                     * THIS OBJ GETS DELETED, DO NOT USE THE MODULE ITSELF */
                    private _obj = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
                    ["Open", [true, _obj]] spawn BIS_fnc_garage;

                    /* BIS_fnc_garage disables damage on spawned vehicles,
                     * as there's no easy way to get the spawned vehicle
                     * to enable damage back, set it periodically in the module
                     * area while Garage is active and then some more */
                    waitUntil { !isNull (uinamespace getvariable ["BIS_fnc_arsenal_cam", objNull]) };
                    waitUntil {
                        {
                            if (_x isKindOf "AllVehicles") then {
                                _x allowDamage true;
                            };
                        } forEach (_pos nearObjects _radius);
                        isNull (uinamespace getvariable ["BIS_fnc_arsenal_cam", objNull]);
                    };
                    {
                        if (_x isKindOf "AllVehicles") then {
                            _x allowDamage true;
                        };
                    } forEach (_pos nearObjects _radius);
                },
                [_module, _radius],
                0.1,
                true,
                true,
                "",
                "((_target distance _this) < 3) && (" + _cond + ")"
            ];
        } forEach synchronizedObjects _module;
    }
] remoteExec ["spawn", 0, true];

/* don't delete this module, synchronized objects cannot be retrieved
 * beforehand, we need to let each client wait for init of all objects
 * and *then* use this module to figure out which are synchronized */
//deleteVehicle _this;
