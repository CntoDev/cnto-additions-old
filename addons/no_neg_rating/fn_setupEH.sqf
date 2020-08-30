if (isClass (configFile >> "CfgPatches" >> "ace_interaction")) exitWith {};

if (!a3aa_no_neg_rating_enable) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    player addEventHandler ["HandleRating", {
        params ["_unit", "_rating"];
        _rating max 0;
    }];
};
