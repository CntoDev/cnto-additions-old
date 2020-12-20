params ["_vehicle"];
private _size = 1 / (getResolution select 5);
[{
    _this#0 params ["_vehicle","_size"];
    if (vehicle player == _vehicle) then {
        if (driver _vehicle == player && !isGamePaused && isEngineOn _vehicle) then {
            drawIcon3D [
                "a3aa\reticle.paa", 
                [0.3,1,0.3,0.5], 
                (_vehicle modelToWorld [0, 10000, 0]), 
                _size, 
                _size, 
                0
            ];
        };
    } else {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}
, [_vehicle,_size]] call CBA_fnc_addPerFrameHandler;

