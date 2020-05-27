if (isNull player) exitWith {};

if (_this) then {
    /* enable spectator */
    [[], [player]] call ace_spectator_fnc_updateUnits;
    [true, true, false] call ace_spectator_fnc_setSpectator;
    player enableSimulation false;
    [player, {
        _this enableSimulationGlobal false;
        _this hideObjectGlobal true;
    }] remoteExec ["call", 2];
    player setPosASL [0, 0, 19000 + random 1000];
} else {
    /* disable spectator */
    /* rest of the logic done elsewhere, in doTeleport */
    [false, true, false] call ace_spectator_fnc_setSpectator;
};
