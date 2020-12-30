if !(a3aa_littlebird_hud_enable) exitWith {};
params ["_vehicle"];
private _size = 1.5 / (getResolution select 5);
[{
    _this#0 params ["_vehicle","_size"];
    private _currentUnit = call CBA_fnc_currentUnit;
    if (vehicle _currentUnit == _vehicle) then {
        if (driver _vehicle == _currentUnit && !isGamePaused && isEngineOn _vehicle) then {
            _eyeZ = (_vehicle worldToModel (eyePos _currentUnit))#2;
            drawIcon3D [
                "a3aa\littlebird_hud\reticle.paa", 
                [0.3,1,0.3,0.5], 
                (_vehicle modelToWorldVisual [0, 1000, _eyeZ]), 
                _size, 
                _size, 
                0
            ];
        };
    } else {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
},0, [_vehicle,_size]] call CBA_fnc_addPerFrameHandler;