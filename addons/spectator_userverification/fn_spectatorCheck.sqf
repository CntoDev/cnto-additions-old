if(!didJip OR !hasInterface) exitWith{}; 
if (player isKindOf "VirtualSpectator_F") then { 
    if (isNil "Spectator_Players") exitWith {}; 
    if (!((getPlayerUID player) in Spectator_Players)) then{ 
    failMission "LOSER"; 
    }; 
}; 