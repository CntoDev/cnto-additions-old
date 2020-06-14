if (!isMultiplayer) exitWith {};
if (!dynamic_groups_enable) exitWith {};

if (isServer) then {
    ["Initialize", [dynamic_groups_addgroups]] call BIS_fnc_dynamicGroups;
};

if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    ["InitializePlayer", [player, dynamic_groups_addgroups]]
        call BIS_fnc_dynamicGroups;
};
