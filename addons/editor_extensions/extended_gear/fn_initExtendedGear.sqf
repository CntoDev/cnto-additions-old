if (isDedicated) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };

    /* arsenal customized, wait for "arsenal respawn" to finish */
    if (!isNil "a3ee_arsenal_respawn_enabled") then {
        waitUntil { !isNil "a3ee_arsenal_respawn_done" };
    };

    private _goggles = player getVariable ["a3ee_extgear_goggles", ""];
    private _insignia = player getVariable ["a3ee_extgear_insignia", ""];
    private _face = player getVariable ["a3ee_extgear_face", ""];

    /* anything to do? */
    if (_goggles == "" && _insignia == "" && _face == "") exitWith {};

    if (_goggles != "") then {
        private _saved_goggles = _goggles;
        if (_goggles == "None") then {
            removeGoggles player;
            _saved_goggles = "";
        } else {
            player linkItem _goggles;
        };
        /* no respawn logic needed, "arsenal respawn" will restore it */
        if (!isNil "a3ee_arsenal_respawn_loadout") then {
            a3ee_arsenal_respawn_loadout set [7, _saved_goggles];
        };
    };

    if (_insignia != "") then {
        [player, _insignia] call BIS_fnc_setUnitInsignia;
    };

    if (_face != "") then {
        /* object-attached JIP queue handle, gets removed on objNull */
        [player, _face] remoteExec ["setFace", 0, player];
    };

    /*
     * respawn EH
     */
    missionNamespace setVariable ["a3ee_saved_extgear", [_goggles, _insignia, _face]];
    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];

        private _saved = (missionNamespace getVariable "a3ee_saved_extgear");
        _saved params ["_goggles", "_insignia", "_face"];

        /* only if not taken care of by "aresenal respawn" module */
        if (_goggles != "" && isNil "a3ee_arsenal_respawn_loadout") then {
            if (_goggles == "None") then {
                removeGoggles player;
            } else {
                player linkItem _goggles;
            };
        };

        if (_insignia != "") then {
            [player, _insignia] call BIS_fnc_setUnitInsignia;
        };

        if (_face != "") then {
            /* object-attached JIP queue handle, gets removed on objNull */
            [player, _face] remoteExec ["setFace", 0, player];
        };

        /*
         * for some unknown reason, when player dies, the corpse gets
         * re-assigned goggles/face from what the player originally had
         * - just wait (a bit) and re-set it to our values
         */
        0 = _corpse spawn {
            sleep 0.5;
            removeGoggles _this;
            _this addGoggles goggles player;
            _this setFace face player;
        };
    }];
};
