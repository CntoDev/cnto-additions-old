/*
 * register custom modules/functions in Ares
 */

if (isNil "Ares_fnc_RegisterCustomModule") exitWith {};

/*
 * AI Behaviour
 */

[
    "AI Behaviour",
    "[U] Allow Crew In Immobile",
    {
        private _units = [_this select 1];
        if (objNull in _units) then {
            _units = ["vehicles"] call Achilles_fnc_SelectUnits;
        };
        if (isNil "_units") exitWith {};
        {
            (vehicle _x) allowCrewInImmobile true;
        } forEach _units;
    }
] call Ares_fnc_RegisterCustomModule;

[
    "AI Behaviour",
    "[U] Forget enemies",
    {
        private _units = [_this select 1];
        if (objNull in _units) then {
            _units = ["units"] call Achilles_fnc_SelectUnits;
        };
        if (isNil "_units") exitWith {};
        {
            [_x, {
                { _this forgetTarget _x } forEach (_this targets [true]);
            }] remoteExec ["call", _x];
        } forEach _units;
    }
] call Ares_fnc_RegisterCustomModule;

[
    "AI Behaviour",
    "[U] Reveal enemies",
    {
        private _revealed = [_this select 1];
        if (objNull in _revealed) then {
            _revealed = ["to-be-revealed units"] call Achilles_fnc_SelectUnits;
        };
        if (isNil "_revealed") exitWith {};
        private _informed_units = ["groups to be informed"] call Achilles_fnc_SelectUnits;
        if (isNil "_informed_units") exitWith {};
        private _informed = [];
        { _informed pushBackUnique group _x } forEach (_informed_units select { alive _x });
        [
            [_revealed, _informed],
            {
                params ["_revealed", "_informed"];
                {
                    private _toinform = _x;
                    {
                        _toinform reveal _x;
                    } forEach _revealed;
                } forEach _informed;
            }
        ] remoteExec ["call"];  /* reveal has local effect, see wiki */
    }
] call Ares_fnc_RegisterCustomModule;

[
    "AI Behaviour",
    "[U] Watch",
    {
        params ["_pos", "_unit"];
        private _dst = _unit;
        if (isNil "_unit" || isNull _unit) then {
            _dst = _pos;  /* use pos as dst */
        };
        private _watchers = ["watchers"] call Achilles_fnc_SelectUnits;
        if (isNil "_watchers") exitWith {};
        {
            [[_x,_dst], {
                params ["_unit", "_dst"];
                _unit doWatch _dst;
            }] remoteExec ["call", _x];
        } forEach _watchers;
    }
] call Ares_fnc_RegisterCustomModule;

[
    "AI Behaviour",
    "[U] No unload in combat",
    {
        private _units = [_this select 1];
        if (objNull in _units) then {
            _units = ["vehicles"] call Achilles_fnc_SelectUnits;
        };
        if (isNil "_units") exitWith {};
        {
            [(vehicle _this), false, false]
                remoteExec ["setUnloadInCombat", _this];
        } forEach _units;
    }
] call Ares_fnc_RegisterCustomModule;

[
    "AI Behaviour",
    "[G] Flee",
    {
        private _units = [_this select 1];
        if (objNull in _units) then {
            _units = ["groups"] call Achilles_fnc_SelectUnits;
        };
        if (isNil "_units") exitWith {};
        private _groups = [];
        { _groups pushBackUnique group _x } forEach _units;
        {
            [_x, {
                _this setBehaviour "AWARE";
                _this setSpeedMode "FULL";
                {
                    _x setUnitPos "UP";
                    _x disableAI "AUTOCOMBAT";
                    _x disableAI "AUTOTARGET";
                    _x disableAI "TARGET";
                    _x disableAI "SUPPRESSION";
                    {
                        _this forgetTarget _x;
                    } forEach (_x targets [true]);
                } forEach units _this;
                private _isfleeing = _this getVariable "ares_extras_stopfleeing";
                if (isNil "_isfleeing" || {isNull _isfleeing}) then {
                    _isfleeing = _this spawn {
                        sleep 120;
                        {
                            _x enableAI "AUTOCOMBAT";
                            _x enableAI "AUTOTARGET";
                            _x enableAI "TARGET";
                            _x enableAI "SUPPRESSION";
                        } forEach units _this;
                    };
                    _this setVariable ["ares_extras_stopfleeing", _isfleeing];
                };
            }] remoteExec ["call", units _x select 0];
        } forEach _groups;
    }
] call Ares_fnc_RegisterCustomModule;

[
    "AI Behaviour",
    "[U] Suppress (bis)",
    {
        params ["_pos", "_unit"];
        private _dst = _unit;
        if (isNil "_unit" || isNull _unit) then {
            _dst = _pos;  /* use pos as dst */
        };
        private _units = ["suppression sources"] call Achilles_fnc_SelectUnits;
        if (isNil "_units") exitWith {};
        {
            [[_x, _dst], {
                params ["_src", "_dst"];
                if (_dst isEqualType objNull) then { _src reveal _dst };
                _src doSuppressiveFire _dst;
            }] remoteExec ["call", _x];
        } forEach _units;
    }
] call Ares_fnc_RegisterCustomModule;

/*
 * Development Tools
 */

[
    "Development Tools",
    "[U] Locality - Get",
    {
        params ["_pos", "_unit"];
        if (isNull _unit) exitWith {};
        [_unit, {
            format ["%1 local to %2", _this, owner _this]
                remoteExec ["systemChat", remoteExecutedOwner];
        }] remoteExec ["call", 2];
    }
] call Ares_fnc_RegisterCustomModule;
[
    "Development Tools",
    "[G] Locality - Set",
    {
        if (!isMultiplayer) exitWith {
            ["Not applicable in singleplayer."] call Ares_fnc_ShowZeusMessage;
        };

        private _hcs = (entities "HeadlessClient_F") select { _x in allPlayers };
        private _targets =
            _hcs +
            [-1] +
            (allPlayers - _hcs);
        private _target_names =
            (_hcs apply { name _x }) +
            ["Server"] +
            ((allPlayers - _hcs) apply { name _x });

        private _reply = [
            "Set locality / owner of groups",
            [
                ["Choose new owner", _target_names]
            ]
        ] call Ares_fnc_showChooseDialog;
        if (count _reply == 0) exitWith {};
        private _target = _targets select (_reply select 0);

        private _units = [_this select 1];
        if (objNull in _units) then {
            _units = ["groups to transfer"] call Achilles_fnc_SelectUnits;
        };
        if (isNil "_units") exitWith {};
        private _groups = [];
        { _groups pushBackUnique group _x } forEach _units;

        [[_target, _groups], {
            params ["_target", "_groups"];

            if (!isNil "ares_extras_transferring_units") exitWith {
                "Locality transfer already running." remoteExec ["systemChat", remoteExecutedOwner];
            };
            ares_extras_transferring_units = true;

            if (_target isEqualTo -1) then {
                _target = 2;  /* special value for Server */
            } else {
                _target = owner _target;  /* passed unit */
            };

            _groups = _groups select { groupOwner _x != _target };

            private _i = 0;
            private _total = count _groups;
            format ["Going to transfer %1 groups.", _total] remoteExec ["systemChat", remoteExecutedOwner];
            {
                if (!isNull _x) then {
                    private _src = groupOwner _x;
                    _x setGroupOwner _target;
                    waitUntil {
                        !(_src in (units _x apply { owner _x }));
                    };
                    _i = _i + 1;
                    sleep 10;
                    format ["%1 done (%2/%3)", str _x, _i, _total] remoteExec ["systemChat", remoteExecutedOwner];
                };
            } forEach _groups;
            ares_extras_transferring_units = nil;
            "Locality transfer done." remoteExec ["systemChat", remoteExecutedOwner];
        }] remoteExec ["spawn", 2];
    }
] call Ares_fnc_RegisterCustomModule;

[
    "Development Tools",
    "Give Zeus to player (may crash)",
    {
        params ["_pos", "_unit"];
        if (isNil "_unit" || isNull _unit) exitWith {
            ["No unit selected."] call Ares_fnc_ShowZeusMessage;
        };
        if (!isNull getAssignedCuratorLogic _unit) exitWith {
            ["Player already has Zeus."] call Ares_fnc_ShowZeusMessage;
        };
        [_unit, {
            if (!isNull getAssignedCuratorLogic _this) exitWith {};
            private _curator = ([_this, false] call insta_zeus_fnc_mkCurator);
            0 = [_curator, _this] spawn {
                params ["_curator", "_unit"];
                waitUntil {
                    _unit assignCurator _curator;
                    !isNull getAssignedCuratorUnit _curator;
                };
            };
        }] remoteExec ["call", 2];
    }
] call Ares_fnc_RegisterCustomModule;

[
    "Development Tools",
    "Set player insignia (in profile)",
    {
        params ["_pos", "_unit"];
        if (isNil "_unit" || {isNull _unit || !isPlayer _unit}) exitWith {
            ["Not placed on a player unit."] call Ares_fnc_ShowZeusMessage;
        };

        private _cfgs = "true" configClasses (configFile >> "CfgUnitInsignia");
        private _names = ["None"] + (_cfgs apply { getText (_x >> "displayName") });
        private _values = [""] + (_cfgs apply { configName _x });

        private _defidx = 0;
        private _defclass = profileNamespace getVariable "a3ee_player_insignia";
        if (!isNil "_defclass") then {
            if (_values find _defclass != -1) then {
                _defidx = _values find _defclass;
            };
        };

        private _reply = [
            "Set player insignia (profile variable)",
            [
                ["Insignia", _names, _defidx, true]
            ]
        ] call Ares_fnc_showChooseDialog;
        if (count _reply == 0) exitWith {};
        private _class = _values select (_reply select 0);

        if (_class == "") then {
            /* remove insignia */
            {
                profileNamespace setVariable ["a3ee_player_insignia", nil];
            } remoteExec ["call", _unit];
        } else {
            /* set insignia */
            [_class, {
                profileNamespace setVariable ["a3ee_player_insignia", _this];
            }] remoteExec ["call", _unit];
        };
    }
] call Ares_fnc_RegisterCustomModule;

/*
 * Environment
 */

[
    "Environment",
    "[P] Terrain Objects Hide/Show",
    {
        params ["_pos", "_unit"];

        private _values = [1,5,10,100,500,1000,5000];
        private _names = _values apply {
            format ["Within radius of %1 m", _x];
        };

        private _reply = [
            "Hide/Show Terrain Objects",
            [
                ["Distance", _names],
                ["Hide/Show", ["Hide","Show"]]
            ]
        ] call Ares_fnc_showChooseDialog;
        if (count _reply == 0) exitWith {};
        private _radius = _values select (_reply select 0);
        private _hide = switch (_reply select 1) do {
            case 0: { true };
            case 1: { false };
        };

        [[_pos, _radius, _hide], {
            params ["_pos", "_radius", "_hide"];
            {
                _x hideObjectGlobal _hide;
            } count nearestTerrainObjects [_pos, [], _radius, false, true];
        }] remoteExec ["call", 2];
    }
] call Ares_fnc_RegisterCustomModule;

/*
 * Scenario Flow
 */

[
    "Scenario Flow",
    "End Mission - Won",
    {
        { ["stop", cntr_exportPath] call cntr_fnc_export } remoteExecCall ["call", 2];
        ["end1", true] remoteExec ["BIS_fnc_endMission"];
    }
] call Ares_fnc_RegisterCustomModule;
[
    "Scenario Flow",
    "End Mission - Lost",
    {
        { ["stop", cntr_exportPath] call cntr_fnc_export } remoteExecCall ["call", 2];
        ["end1", false] remoteExec ["BIS_fnc_endMission"];
    }
] call Ares_fnc_RegisterCustomModule;

/*
 * Respawn
 */

[
    "Respawn",
    "Move respawn",
    {
        params ["_pos", "_unit"];
        if ({ _x find "respawn" == 0 } count allMapMarkers < 1) then {
            createMarker ["respawn", _pos];
        } else {
            "respawn" setMarkerPos _pos;
        };
    }
] call Ares_fnc_RegisterCustomModule;
[
    "Respawn",
    "Move respawn_west",
    {
        params ["_pos", "_unit"];
        if ({ _x find "respawn" == 0 } count allMapMarkers < 1) then {
            createMarker ["respawn_west", _pos];
        } else {
            "respawn_west" setMarkerPos _pos;
        };
    }
] call Ares_fnc_RegisterCustomModule;
[
    "Respawn",
    "Move respawn_east",
    {
        params ["_pos", "_unit"];
        if ({ _x find "respawn" == 0 } count allMapMarkers < 1) then {
            createMarker ["respawn_east", _pos];
        } else {
            "respawn_east" setMarkerPos _pos;
        };
    }
] call Ares_fnc_RegisterCustomModule;
[
    "Respawn",
    "Move respawn_guerrila",
    {
        params ["_pos", "_unit"];
        if ({ _x find "respawn" == 0 } count allMapMarkers < 1) then {
            createMarker ["respawn_guerrila", _pos];
        } else {
            "respawn_guerrila" setMarkerPos _pos;
            "respawn_guerilla" setMarkerPos _pos;
            "respawn_guerrilla" setMarkerPos _pos;
        };
    }
] call Ares_fnc_RegisterCustomModule;
[
    "Respawn",
    "Move respawn_civilian",
    {
        params ["_pos", "_unit"];
        if ({ _x find "respawn" == 0 } count allMapMarkers < 1) then {
            createMarker ["respawn_civilian", _pos];
        } else {
            "respawn_civilian" setMarkerPos _pos;
        };
    }
] call Ares_fnc_RegisterCustomModule;

[
    "Respawn",
    "Move JIP teleport point",
    {
        /* needs the Editor_Extensions pbo */
        params ["_pos", "_unit"];

        /* spawn the module if it wasn't placed in the editor */
        private _cfg = configFile >> "CfgVehicles" >> "a3ee_teleport_on_jip";
        if (isNil "a3ee_teleport_on_jip_pos") then {
            if (isClass (configFile >> "CfgVehicles" >> "a3ee_teleport_on_jip")) then {
                private _grp = createGroup sideLogic;
                _grp createUnit ["a3ee_teleport_on_jip", _pos, [], 0, "CAN_COLLIDE"];
            };
        } else {
            a3ee_teleport_on_jip_pos = _pos;
            publicVariable "a3ee_teleport_on_jip_pos";
        };
    }
] call Ares_fnc_RegisterCustomModule;

/*
 * Util
 */

[
    "Objects",
    "[U] Delete units (really)",
    {
        private _units = [_this select 1];
        if (objNull in _units) then {
            _units = ["objects"] call Achilles_fnc_SelectUnits;
        };
        if (isNil "_units") exitWith {};
        {
            deleteVehicle _x;
        } forEach _units;
    }
] call Ares_fnc_RegisterCustomModule;
