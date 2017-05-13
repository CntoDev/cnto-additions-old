if (is3DEN) exitWith {};
private _actiontext = _this getVariable "actiontext";
private _condition = _this getVariable "condition";

[
    [_this, _actiontext, _condition],
    {
        params ["_module", "_text", "_cond"];

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
                { ["Open", true] spawn BIS_fnc_arsenal },
                nil,
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
