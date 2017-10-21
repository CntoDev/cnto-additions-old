private ["_info"];

switch (true) do {
    /* object - unit */
    case (_this in (all3DENEntities select 0)): {
        _info = format ["class:'%1'", typeOf _this];
        private _roledesc = _this get3DENAttribute "description" select 0;
        if (!isNil "_roledesc" && {_roledesc != ""}) then {
            _info = format ["%1 desc:'%2'", _info, _roledesc];
        };
        private _groupid = groupId group _this;
        if (!isNil "_groupid") then {
            _info = format ["%1 group:'%2'", _info, _groupid];
        };
    };
    /* group */
    case (_this in (all3DENEntities select 1)): {
        private _groupid = groupId _this;
        if (!isNil "_groupid") then {
            _info = format ["group:'%1'", _groupid];
        };
    };
    /* system - module */
    case (_this in (all3DENEntities select 3)): {
        _info = format ["class:'%1'", typeOf _this];
    };
    /* markers */
    case (_this in (all3DENEntities select 5)): {
        _info = _this;
    };
    /* all other */
    default {
        _info = str _this;
    };
};

_info;
