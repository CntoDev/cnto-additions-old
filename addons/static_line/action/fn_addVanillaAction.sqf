_this addAction [
    "Static Line Jump",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target spawn a3aa_static_line_fnc_ejectUnits;
    },
    nil,
    1.6,
    true,
    true,
    "",
    "_this in _target && { [_target, _this] call a3aa_static_line_fnc_canInitiateJump }"
];
