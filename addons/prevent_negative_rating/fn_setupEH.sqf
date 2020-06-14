if (isClass (configFile >> "CfgPatches" >> "ace_interaction")) exitWith {};

if (!prevent_negative_rating_enable) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    player addEventHandler ["HandleRating", {
        params ["_unit", "_rating"];
        _rating max 0;
    }];
};
