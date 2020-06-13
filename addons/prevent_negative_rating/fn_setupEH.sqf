if (!prevent_negative_rating_enable) exitWith {};
if (isClass (configFile >> "CfgPatches" >> "ace_interaction")) exitWith {};

player addEventHandler ["HandleRating", {
    params ["_unit", "_rating"];
    _rating max 0;
}];
