if (isClass (configFile >> "CfgVoice" >> "ACE_NoVoice")) exitWith {};
if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    /* player owner broadcasting to all, adding to JIP queue */
    [player, {
        _this setSpeaker "NoVoice";
        _this addEventHandler ["Respawn", {
            params ["_unit", "_corpse"];
            _unit setSpeaker "NoVoice";
        }];
    }] remoteExec ["call", 0, player];
};
