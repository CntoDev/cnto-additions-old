For group tracking, you can

1. disable the group flag for any group by
```
_group setVariable ["a3aa_map_trackers_hide_group", true];
```
or using the ACE3-compatible
```
_group setVariable ["ACE_map_hideBlueForceMarker", true];
```
(either works)

2. use a custom logic deciding what flat from CfgGroupIcons to use
```
/* group object passed as _this */
a3aa_map_trackers_custom_group_type = {
    /*
     * if half or more of the group's soldiers are wearing red caps,
     * the group is considered to be "service",
     * - in other cases, fall back to default group flag
     */
    private _cappers = {
        headgear _x == "H_Cap_red";
    } count (units _this);
    if (_cappers >= (count units _this)/2) then {
        "service";
    } else {
        _this call a3aa_map_trackers_fnc_getGroupIconType;
    };
};
```

3. define a custom function that returns an array of groups to display
   ("Group tracking" setting set to "Script-selected groups")
```
/* any groups led by players, friendly or enemy */
a3aa_map_trackers_custom_groups = {
    private _grps = allPlayers apply { group _x };
    private _unique = _grps arrayIntersect _grps;
    _unique;
};

/* any groups of our side (but not player grp) + spotted enemy groups */
a3aa_map_trackers_custom_groups = {
    allGroups select {
        (
            side _x == side group player
            && _x != group player
        )
        || {player targets [true, 1000, [], 60]}
    };
};

/* any groups of our side + groups with special attribute set by GM */
a3aa_map_trackers_custom_groups = {
    allGroups select {
        side _x == side group player
        || {_x getVariable ["my_mission_VIP_group", false]}
    };
};

Note that the effect is local only, always viewed through `player`.
So any group `getVariable` attributes like this need to be set globally
for all clients (using `true` as third `setVariable` arg).
