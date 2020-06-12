/*
 * replace unique ACRE radio classnames (ie. "ACRE_PRC343_ID_1") with generic
 * ones (ie. "ACRE_PRC343") in a getUnitLoadout array
 */

private _replace_radios = {
    {
        _x params ["_class", "_cnt"];
        if (_class find "ACRE_" == 0) then {
            private _idpos = _class find "_ID_";
            if (_idpos > 0) then {
                private _newclass = _class select [0,_idpos];
                _x set [0, _newclass];
            };
        };
    } forEach _this;
};

_this params ["_priweap", "_launcher", "_handgun",
              "_uniform", "_vest", "_backpack"];
if (count _uniform > 0) then {
    (_uniform select 1) call _replace_radios;
};
if (count _vest > 0) then {
    (_vest select 1) call _replace_radios;
};
if (count _backpack > 0) then {
    (_backpack select 1) call _replace_radios;
};
