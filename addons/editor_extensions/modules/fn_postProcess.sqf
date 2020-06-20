/*
 * post-processing visual effects, MP-compatible
 *
 * defaults, base priorities & other coefficients taken from
 * https://community.bistudio.com/wiki/Post_process_effects
 */

params ["_module", "_3den_action"];

/*
 * array of [name, handle, base prio, [user settings], [default settings]]
 * (handle is -1 if the effect doesn't yet exist)
 */
private _effects = [];

/* color corrections */
if (_module getVariable "a3aa_ee_post_process_cc_enable") then {
    _effects pushBack [
        "ColorCorrections",
        -1,
        1500,
        [
            _module getVariable "a3aa_ee_post_process_cc_brightness",
            _module getVariable "a3aa_ee_post_process_cc_contrast",
            _module getVariable "a3aa_ee_post_process_cc_contrast_off"
        ] + (_module getVariable "a3aa_ee_post_process_cc_blend_color") + [
            _module getVariable "a3aa_ee_post_process_cc_blend_factor"
        ] + (_module getVariable "a3aa_ee_post_process_cc_desat_color") + [
            _module getVariable "a3aa_ee_post_process_cc_desat_factor"
        ] + (_module getVariable "a3aa_ee_post_process_cc_desat_weight") + [
            0  /* not used */
        ],
        [
            1,
            1,
            0,
            0, 0, 0, 0,
            1, 1, 1, 1,
            0.299, 0.587, 0.114, 0
        ]
    ];
};
/* dynamic blur */
if (_module getVariable "a3aa_ee_post_process_db_enable") then {
    _effects pushBack [
        "DynamicBlur",
        -1,
        400,
        [
            _module getVariable "a3aa_ee_post_process_db_bluriness"
        ],
        [
            0
        ]
    ];
};
/* chromatic aberration */
if (_module getVariable "a3aa_ee_post_process_ca_enable") then {
    _effects pushBack [
        "ChromAberration",
        -1,
        200,
        (_module getVariable "a3aa_ee_post_process_ca_power") + [
            _module getVariable "a3aa_ee_post_process_ca_correction"
        ],
        [
            0.005, 0.005, false
        ]
    ];
};


private _create_handles = {
    {
        _x params ["_name", "_handle", "_prio", "_settings", "_defaults"];

        /* create a handle, finding the lowest available priority nr */
        while {
            _handle = ppEffectCreate [_name, _prio];
            _handle < 0
        } do {
            _prio = _prio + 1;
        };

        _x set [1, _handle];
    } forEach _this;
};
private _enable_effects = {
    {
        _x params ["_name", "_handle", "_prio", "_settings", "_defaults"];
        _handle ppEffectAdjust _settings;
    } forEach _this;
};
private _disable_effects = {
    {
        _x params ["_name", "_handle", "_prio", "_settings", "_defaults"];
        /* set default parameters to make the effects seem to disappear */
        _handle ppEffectAdjust _defaults;
    } forEach _this;
};
private _commit_effects = {
    params ["_effects", "_duration"];
    private _handles = _effects apply { _x select 1 };
    _handles ppEffectEnable true;
    _handles ppEffectCommit _duration;
    _handles;
};


if (is3DEN) exitWith {
    private _prev = _module getVariable "3den_previous_handles";
    if (!isNil "_prev") then {
        _prev ppEffectEnable false;
        ppEffectDestroy _prev;
        _module setVariable ["3den_previous_handles", nil];
    };

    if (!(_module getVariable "a3aa_ee_post_process_preview")) exitWith {};
    if (_effects isEqualTo []) exitWith {};

    if (_3den_action == "add") then {
        _effects call _create_handles;
        _effects call _enable_effects;
        _prev = [_effects, 0] call _commit_effects;
        _module setVariable ["3den_previous_handles", _prev];
    };
};


/*
 * only real game below (no 3den)
 */

if (_effects isEqualTo []) exitWith {};

private _runtime_opts = [
    _module getVariable "a3aa_ee_post_process_runtime",
    _module getVariable "a3aa_ee_post_process_fade_in",
    _module getVariable "a3aa_ee_post_process_fade_out"
];

[
    [_module, _effects, _create_handles, _enable_effects, _disable_effects, _commit_effects, _runtime_opts],
    {
        if (!hasInterface) exitWith {};
        params ["_module", "_effects", "_create_handles", "_enable_effects", "_disable_effects", "_commit_effects", "_runtime_opts"];
        _runtime_opts params ["_runtime", "_fade_in", "_fade_out"];

        _effects call _create_handles;
        waitUntil { time > 0 };

        /* just one-shot setting at mission start */
        if (!_runtime) exitWith {
            _effects call _enable_effects;
            [_effects, 0] call _commit_effects;
        };

        /* watch for enabled/disabled simulation and enable/disable effects */
        while {true} do {
            waitUntil {
                sleep 0.1;
                isNull _module || simulationEnabled _module;
            };
            if (isNull _module) exitWith {};

            _effects call _enable_effects;
            [_effects, _fade_in] call _commit_effects;

            waitUntil {
                sleep 0.1;
                isNull _module || !simulationEnabled _module;
            };

            _effects call _disable_effects;
            [_effects, _fade_out] call _commit_effects;

            if (isNull _module) exitWith {};
        };
    }
] remoteExec ["spawn", 0, true];

if (_module getVariable "a3aa_ee_post_process_runtime") then {
    /* start with effects off */
    _module enableSimulationGlobal false;
} else {
    /* runtime control disabled, module no longer needed */
    deleteVehicle _module;
};
