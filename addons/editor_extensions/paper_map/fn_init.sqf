#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\ui_f\hpp\defineResincl.inc"

if (is3DEN) exitWith {};

private _markrange = _this getVariable "markrange";
private _nodelete = _this getVariable "nodelete";

/*
 * server-side
 */

/* hash of per-UID makers */
a3ee_paper_map_uidspecific = [] call a3aa_fnc_hashInit;

/* push directplay ID and per-UID makers to clients */
addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    private _peruid = [a3ee_paper_map_uidspecific, _uid]
        call a3aa_fnc_hashGet;
    if (isNil "_peruid") then {
        _peruid = [sideUnknown, []];
    };

    /* on the client */
    [[_id, _peruid], {
        params ["_dpid", "_peruid"];
        if (!hasInterface) exitWith {};
        a3ee_paper_map_uidmarkers = _peruid;
        waitUntil { !isNull player };
        player setVariable ["a3ee_directplay_id", _dpid, true];
    }] remoteExec ["spawn", _owner];
}];
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_unit setVariable ["a3ee_directplay_id", nil, true];
}];
// TODO: addMissionEventHandler ["TeamSwitch", { ?

/* list of permanent (never deleted) markers */
0 = [] spawn {
    waitUntil { time > 0 };
    /* all that were initially added on briefing screen */
    a3ee_paper_map_permarkers = allMapMarkers select {
        _x find "_USER_DEFINED" == 0
    };
    publicVariable "a3ee_paper_map_permarkers";
};


/*
 * client-side
 */

[
    [_markrange, _nodelete],
    {
        if (!hasInterface) exitWith {};

        params ["_markrange", "_nodelete"];

        waitUntil { !isNull player };
        waitUntil { !isNil "a3ee_paper_map_permarkers" };
        private _permarkers = a3ee_paper_map_permarkers;

        waitUntil { !isNil "a3ee_paper_map_uidmarkers" };
        a3ee_paper_map_uidmarkers params ["_side", "_prev"];
        private _uidmarkers = [];
        if (playerSide == _side) then {
            _uidmarkers = _prev;
        };

        /* prevent marker deletion after mission start */
        if (_nodelete) then {
            waitUntil { !isNull findDisplay IDD_MAIN_MAP };
            (findDisplay IDD_MAIN_MAP) displayAddEventHandler ["KeyDown", {
                (_this select 1) == DIK_DELETE;
            }];
        };

        /*
         * on JIP, delete any new/unknown markers beyond the ones from briefing
         * and uid-specific ones; this prevents special case where a JIP player
         * would receive markers from players nearby the spawn point due to them
         * being technically within _markrange
         */
        if (didJIP) then {
            {
                deleteMarkerLocal _x;
            } forEach (allMapMarkers select {
                _x find "_USER_DEFINED" == 0
                && !(_x in _permarkers)
                && !(_x in _uidmarkers)
            });
        };

        private _nextsync = 0;

        /* on ~ every frame */
        waitUntil {
            /* nearEntities & other cmds ignore crew */
            private _players = allPlayers select {
                alive _x && { player distance _x < _markrange }
            };
            private _dpids = _players apply {
                _x getVariable "a3ee_directplay_id"
            };
            _dpids = _dpids - [nil];

            private _markers = allMapMarkers select {
                _x find "_USER_DEFINED" == 0
                && !(_x in _permarkers)
                && !(_x in _uidmarkers)
            };

            {
                private _dpid = parseNumber (_x select [15]);
                if (_dpid in _dpids) then {
                    _uidmarkers pushBack _x;
                } else {
                    deleteMarkerLocal _x;
                };
            } forEach _markers;

            /* save to server every 10-20 seconds */
            if (time > _nextsync) then {
                [[getPlayerUID player, [playerSide, _uidmarkers]], {
                    params ["_uid", "_data"];
                    [a3ee_paper_map_uidspecific, _uid, _data]
                        call a3aa_fnc_hashSet;
                }] remoteExec ["call", 2];
                _nextsync = time + 10 + random 10;
            };

            false;
        };
    }
] remoteExec ["spawn", 0, true];

deleteVehicle _this;
