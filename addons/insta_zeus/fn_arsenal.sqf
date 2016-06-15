if (isNull getAssignedCuratorLogic player) exitWith {};
switch _this do {
    case "open": {
        ["Open", true] spawn BIS_fnc_arsenal;
    };
    case "spawn": {
        (screenToWorld [0.5, 0.5]) params ["_px", "_py"];
        private _box = createVehicle ["Land_RotorCoversBag_01_F", [_px, _py, 50], [], 0, "CAN_COLLIDE"];
        [(getAssignedCuratorLogic player), [[_box], false]] remoteExec ["addCuratorEditableObjects", 2];
        ["AmmoboxInit", [_box, true]] spawn BIS_fnc_arsenal;
    };
};
