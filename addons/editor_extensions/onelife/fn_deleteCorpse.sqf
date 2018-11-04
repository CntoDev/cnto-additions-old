if (!local _this) exitWith {
    _this remoteExec ["a3ee_onelife_fnc_deleteCorpse", _this];
};

if (isNull objectParent _this) then {
    deleteVehicle _this;
} else {
    objectParent _this deleteVehicleCrew _this;
};
