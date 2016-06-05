/*
 * call '_code' for a Curator-selected object or group of objects, passing them
 * as argument (array in all cases, even when 1 object is selected)
 *
 * - if Ares marker is placed directly on an object, use it
 * - if it is placed on empty ground, wait a few seconds to let the Curator
 *   select multiple objects with mouse
 *
 * '_gfilter' is a boolean
 * - true: return an array of selected (unique) groups only
 * - false (default): return an array of selected units
 *
 * the passed array may be empty if Curator didn't select any objects
 *
 * if '_code' is an ARRAY (not CODE), its first member should be an arbitrary
 * argument, passed as first arg to the second member which should be CODE,
 * array of objects from this function is passed as second arg
 */

params ["_code", "_ares_args", ["_gfilter", false]];
_ares_args params ["_pos", "_unit"];

private _call_code = {
    params ["_code", "_objects"];
    if (typeName _code == "ARRAY") then {
        [(_code select 0), _objects] call (_code select 1);
    } else {
        _objects call _code;
    };
};

/* object selected as Ares _unit, use it */
if (!isNil "_unit" && !isNull _unit) then {
    if (!_gfilter) then {
        [_code, [_unit]] call _call_code;
    } else {
        [_code, [group _unit]] call _call_code;
    };

/* placed on empty ground, wait for mouse selection */
} else {
    0 = [_code, _gfilter, _call_code] spawn {
        params ["_code", "_gfilter", "_call_code"];

        ["Select objects with mouse."] call Ares_fnc_ShowZeusMessage;

        /* 20*0.5 = 10 seconds */
        private ["_objects"];
        for "_x" from 1 to 20 do {
            _objects = (curatorSelected select ([0,1] select _gfilter));
            if (count _objects > 0) exitWith {};
            sleep 0.5;
        };

        [
            format ["Selected %1 objects.", count _objects]
        ] call Ares_fnc_ShowZeusMessage;

        [_code, _objects] call _call_code;
    };
};
