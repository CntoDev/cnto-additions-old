if (is3DEN) exitWith {};
private _briefingfor = _this getVariable "a3aa_ee_briefing_briefingfor";
private _contents = [
    ["Situation", _this getVariable "a3aa_ee_briefing_situation"],
    ["Mission", _this getVariable "a3aa_ee_briefing_mission"],
    ["Execution", _this getVariable "a3aa_ee_briefing_execution"],
    ["Admin & Logistics", _this getVariable "a3aa_ee_briefing_admin_logistics"],
    ["Command & Signal", _this getVariable "a3aa_ee_briefing_command_signal"]
];
/* filter out empty */
_contents = _contents select { (_x select 1) != "" };

[
    [_briefingfor, _contents],
    {
        if (isDedicated) exitWith {};  /* player always null */
        0 = _this spawn {
            params ["_for", "_contents"];
            waitUntil { !isNull player };

            private _me = switch (_for) do {
                case "everyone": { true };
                case "side_blufor": { side player == west };
                case "side_opfor": { side player == east };
                case "side_indep": { side player == resistance };
                case "side_civ": { side player == civilian };
                //case "synced": { group player in (_synced apply {group _x}) };
            };
            if (!_me) exitWith {};

            reverse _contents;
            {
                _x params ["_head", "_body"];
                /* replace newlines with "<br/>" */
                while {true} do {
                    private _pos = _body find toString [10];
                    if (_pos == -1) exitWith {};
                    private _newbody = _body select [0, _pos];
                    _body = _newbody + "<br/>" + (_body select [_pos+1]);
                };
                player createDiaryRecord ["Diary", [_head, _body]];
            } forEach _contents;
        };
    }
] remoteExec ["call", 0, true];

/* we could keep the module unit around for JIP clients to check whether they
 * have been synchronized with it in the editor, but it turns out that sync
 * connections don't work with JIP even if you don't delete the module
 * - apparently, JIP spawns a completely different unit, the module is still
 *   synced to the corpse, so no jazz, just optimize/delete it */
deleteVehicle _this;
