if (!isMultiplayer) exitWith {};
if (!a3aa_dynamic_groups_enable) exitWith {};

if (isServer) then {
    ["Initialize", [a3aa_dynamic_groups_addgroups]] call BIS_fnc_dynamicGroups;
};

if (!hasInterface) exitWith {};

0 = [] spawn {
    waitUntil { !isNull player };
    ["InitializePlayer", [player, a3aa_dynamic_groups_addgroups]]
        call BIS_fnc_dynamicGroups;
};
