/* allow only if logged in, see fn_maintainCurator */
if (isMultiplayer && !serverCommandAvailable "#kick") exitWith {};

switch _this do {
    case "open": {
        ["Open", true] spawn BIS_fnc_arsenal;
    };
    case "spawn": {
        private "_pos";
        if (!isNull findDisplay 312) then {
            /* has curator interface open, use mouse cursor position */
            _pos = screenToWorld getMousePosition;
        } else {
            _pos = screenToWorld [0.5, 0.5];
        };
        _pos params ["_px", "_py"];
        private _box = createVehicle ["Land_RotorCoversBag_01_F", [_px, _py, 50], [], 0, "CAN_COLLIDE"];
        [(getAssignedCuratorLogic player), [[_box], false]] remoteExec ["addCuratorEditableObjects", 2];
        ["AmmoboxInit", [_box, true]] spawn BIS_fnc_arsenal;
    };
};
