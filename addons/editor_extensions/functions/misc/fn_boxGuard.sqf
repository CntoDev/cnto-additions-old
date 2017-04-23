/*
 * show empty inventory on _box if it is closer than _range meters to its
 * initial placement location (as seen on mission start)
 */

params ["_box", "_range"];

if (isServer) then {
    _box setVariable ["boxguard_data", [
        position _box, _range
    ], true];
};
if (hasInterface) then {
    /* racey, though no clear way to solve it */
    if (!isNil "boxguard_already_added_eh") exitWith {};
    boxguard_already_added_eh = true;

    0 = [] spawn {
        waitUntil { !isNull player };
        player addEventHandler ["InventoryOpened", {
            params ["_player", "_target"];
            private _data = _target getVariable "boxguard_data";
            if (isNil "_data") exitWith {false};

            _data params ["_initpos", "_range"];
            if (position _target distance2D _initpos > _range) exitWith {false};

            player action ["Gear", objNull];
            true;
        }];
    };
};
