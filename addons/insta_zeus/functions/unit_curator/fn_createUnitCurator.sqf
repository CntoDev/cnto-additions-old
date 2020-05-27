/* called from an Eden object attribute, server only */

/*
 * Idea:
 * Have a list of Curator objects and, as eligible units connect, assign
 * curators from this list. However create curators ONLY before simulation
 * starts - anything after that freezes the game (and can crash/desync it).
 *
 * Simply try finding a free Curator first and assign it - if there is none
 * and the mission hasn't started yet, create and assign it. This guarantees,
 * even through re-connects / JIP, that an eligible unit will always be able
 * to re-gain Curator as long as it was present on mission start.
 *
 * (IOW if 3 eligible units are present at time == 0, then 3 Curator objects
 *  are created and can be assigned/unassigned by connects/disconnects at any
 *  time during the mission.)
 *
 * If the mission already started and there's no free Curator, it means that
 * the eligible unit wasn't present at mission start (and the ones present are
 * already in game / assigned), so there's no Curator to grant.
 *
 * -------------
 * This is one of the few race-free algorithms possible.
 */

params ["_unit", "_checkbox"];
if (!_checkbox) exitWith {};

/* for singleplayer, we already have admin_curator */
if (!isMultiplayer) exitWith {};

/* atomic */
isNil {
    if (isNil "Insta_Zeus_Unit_Curators") then {
        Insta_Zeus_Unit_Curators = [];
    };
};

private "_curator";

/* atomic */
isNil {
    {
        if (getAssignedCuratorUnit _x == objNull) exitWith {
            _curator = _x;
        };
    } forEach Insta_Zeus_Unit_Curators;
};

if (isNil "_curator" && time <= 0) then {
    _curator = ([] call insta_zeus_fnc_mkCurator);
    _unit assignCurator _curator;
    Insta_Zeus_Unit_Curators pushBack _curator;
} else {
    if (!isNil "_curator") then {
        _unit assignCurator _curator;
    };
};
