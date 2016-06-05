/*
 * force '_this' vehicle's lights on regardless of combat mode
 *
 * note that this is really only useful for helicopters as cars have lights on
 * when SAFE and you can force SAFE with setWaypointForceBehaviour, without the
 * runtime overhead of this function (or via disableAI)
 *
 * there's AFAIK no way to do this for helicopters without essentially turning
 * the lights on every frame, so that's what we do here, making sure to stop
 * the loop when we can
 */

private _handle = _this getVariable ["Ares_Extras_vehLightOn_running", scriptNull];
if (!isNull _handle) exitWith {};

_handle = _this spawn {
    waitUntil {
        _this action ["LightOn", _this];

        /* 0th turret is copilot / vehicle turret
         * - don't use this check, copilots taking over do happen,
         *   but it's rare and the extra performance hit is not worth it */
        /*(!alive _this ||
         (isNull driver _this && isNull (_this turretunit [0])) ||
         (!alive driver _this && !alive (_this turretunit [0])));*/

        /* proper check */
        /*(!alive _this || isNull driver _this || !alive driver _this);*/

        /* optimized check
         * - if driver isn't alive, either the vehicle is also dead or we don't
         *   need to loop anyway as there's nobody to perform the LightOn
         * - if _this is null, driver returns nullObject
         * - if driver is null either way, alive returns false */
        (!alive driver _this);
    };
};
_this setVariable ["Ares_Extras_vehLightOn_running", _handle];
