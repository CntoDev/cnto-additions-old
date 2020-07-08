if (isClass (configFile >> "CfgPatches" >> "ace_nightvision")) exitWith {};
if (!hasInterface) exitWith {};

private _setup_pp = {
    params ["_type", "_prio", "_settings"];
    private _handle = ppEffectCreate [_type, _prio];
    _handle ppEffectAdjust _settings;
    _handle ppEffectCommit 0;
    _handle ppEffectForceInNVG true;
    _handle ppEffectEnable true;
    _handle;
};

params ["_enable"];
if (isNil "_enable") then {
    _enable = !isNull player && currentVisionMode player == 1;
};

if (_enable) then {
    /* if effects were already somehow enabled, destroy them first */
    if (!isNil "a3aa_nightvision_effects") then {
        ppEffectDestroy a3aa_nightvision_effects;
    };
    /*
     * see https://community.bistudio.com/wiki/Post_process_effects
     * - use ACE-defined PP priorities for compatibility with ACE medical
     *   (if playing with ACE, but without ACE Nightvision)
     */
    a3aa_nightvision_effects = [];
    /* barely noticeable blur to avoid the unnaturally sharp NVG image */
    a3aa_nightvision_effects pushBack (
        ["DynamicBlur", 190, [0.15]] call _setup_pp
    );
    /* light grain, much more visible in the dark */
    a3aa_nightvision_effects pushBack (
        ["FilmGrain", 200, [0.15, 1.25, 2.6, 0.3, 0.3]] call _setup_pp
    );
    /* more yellow-ish green, shamelessly stolen from ACE */
    a3aa_nightvision_effects pushBack (
        ["ColorCorrections", 2003, [0.6, 0.6, 0, [0,0,0,0], [1.3,1.2,0,0.9], [6,1,1,0]]] call _setup_pp
    );
} else {
    if (!isNil "a3aa_nightvision_effects") then {
        ppEffectDestroy a3aa_nightvision_effects;
        a3aa_nightvision_effects = nil;
    };
};
