if !(a3aa_littlebird_hud_enable) exitWith {};
params ["_vehicle"];

private _isAH6 = _vehicle isKindOf "RHS_MELB_AH6M";
private _size = 1 / (getResolution select 5);

[{
    _this#0 params ["_vehicle","_size","_isAH6"];
    private _currentUnit = call CBA_fnc_currentUnit;
    if (vehicle _currentUnit == _vehicle) then {
        if (driver _vehicle == _currentUnit && !isGamePaused && isEngineOn _vehicle) then {
            private _eyeZ = 0;
            private _zoomSize = _size * (0.9/(getObjectFOV _currentUnit));
            // AH-6 is zeroed to eye level of player, not vehicle centre. AH-9 is zeroed to centre of aircraft model. Therefore offset Z level of reticle if vehicle is AH-6
            if (_isAH6) then {
                _eyeZ = (_vehicle worldToModel (eyePos _currentUnit))#2;
            };
            drawIcon3D [
                "a3aa\littlebird_hud\reticle.paa", 
                [0.3,1,0.3,0.5], 
                (_vehicle modelToWorldVisual [0, 1000, _eyeZ]), 
                _zoomSize, 
                _zoomSize, 
                0
            ];
        };
    } else {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_vehicle,_size,_isAH6]] call CBA_fnc_addPerFrameHandler;