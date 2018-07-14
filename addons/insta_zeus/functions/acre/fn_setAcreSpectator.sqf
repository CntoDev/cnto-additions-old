if (_this) then {
    /* enable */

    /* for restoring below */
    insta_zeus_was_acre_muted = ACRE_MUTE_SPECTATORS;

    ACRE_MUTE_SPECTATORS = true;
    [true] call acre_api_fnc_setSpectator;

} else {
    /* disable */

    if (!isNil "insta_zeus_was_acre_muted") then {
        ACRE_MUTE_SPECTATORS = insta_zeus_was_acre_muted;
        insta_zeus_was_acre_muted = nil;
    };
    [false] call acre_api_fnc_setSpectator;
};
